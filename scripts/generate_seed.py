#!/usr/bin/env python3
"""
TopicLeap curriculum seed generator.

Emits an idempotent, NON-DESTRUCTIVE SQL seed for 4 subjects x 10 Grade-4
topics, each with a short step-by-step lesson and a 10-question worksheet
(MCQ / fill-in). Math + grammar questions are generated programmatically so
the answers are correct by construction; science + reading are authored.

Re-running the SQL never duplicates: topics upsert by (subject, grade, slug),
and lesson/worksheet/question content is only inserted for topics that don't
already have it (so the topic your kid already attempted is left untouched).

Usage:
    python3 scripts/generate_seed.py > supabase/seed/grade4_curriculum.sql
"""
import json
import random

GRADE = 4
LETTERS = ["a", "b", "c", "d"]


_ASCII_MAP = {
    "×": "x",   # × multiply
    "÷": "/",   # ÷ divide
    "−": "-",   # − minus
    "—": "-",   # — em dash
    "–": "-",   # – en dash
    "‘": "'", "’": "'",   # curly single quotes
    "“": '"', "”": '"',   # curly double quotes
    "…": "...",
}


def ascii_clean(s: str) -> str:
    """Force ASCII so the SQL survives copy/paste into any editor."""
    for k, v in _ASCII_MAP.items():
        s = s.replace(k, v)
    return s.encode("ascii", "ignore").decode("ascii")


def sql_str(s: str) -> str:
    """ASCII-clean, then single-quote escape for SQL string literals."""
    s = ascii_clean(s)
    return "'" + s.replace("'", "''") + "'"


def mcq(prompt, correct, distractors, rng):
    """Build a 4-option MCQ dict. Correct option placed at a random slot."""
    opts = list(distractors)[:3]
    pos = rng.randint(0, 3)
    opts.insert(pos, correct)
    choices = [{"id": LETTERS[i], "label": str(opts[i])} for i in range(4)]
    return {
        "type": "mcq",
        "prompt": prompt,
        "choices": choices,
        "answer": LETTERS[pos],
    }


def fill(prompt, answer):
    return {"type": "fill_in", "prompt": prompt, "choices": None, "answer": str(answer)}


# ============================================================ MATH (computed)

def g_place_value(rng):
    qs = []
    places = [(1, "ones"), (10, "tens"), (100, "hundreds"),
              (1000, "thousands"), (10000, "ten thousands")]
    used = set()
    while len(qs) < 10:
        n = rng.randint(10000, 999999)
        s = str(n)
        idx = rng.randint(0, len(s) - 1)
        digit = int(s[idx])
        if digit == 0:
            continue
        place = 10 ** (len(s) - 1 - idx)
        if (n, idx) in used:
            continue
        used.add((n, idx))
        val = digit * place
        qs.append(fill(f"What is the value of the digit {digit} in {n:,}? "
                       f"(Write just the number, e.g. 4000)", val))
    return qs


def g_rounding(rng):
    qs = []
    targets = [(100, "hundred"), (1000, "thousand"), (10, "ten")]
    for _ in range(10):
        place, name = rng.choice(targets)
        n = rng.randint(place * 2, place * 90 + 555)
        rounded = round(n / place) * place
        # python banker's rounding fix
        rem = n % place
        rounded = n - rem if rem < place / 2 else n - rem + place
        qs.append(fill(f"Round {n:,} to the nearest {name}.", rounded))
    return qs


def g_add_subtract(rng):
    qs = []
    for i in range(10):
        a = rng.randint(1200, 89000)
        b = rng.randint(100, a - 1)
        if i % 2 == 0:
            qs.append(fill(f"Add: {a:,} + {b:,} = ?", a + b))
        else:
            qs.append(fill(f"Subtract: {a:,} − {b:,} = ?", a - b))
    return qs


def g_multiply_2x2(rng):
    qs = []
    seen = set()
    while len(qs) < 10:
        a = rng.randint(12, 99)
        b = rng.randint(12, 99)
        if (a, b) in seen:
            continue
        seen.add((a, b))
        qs.append(fill(f"Multiply: {a} × {b} = ?", a * b))
    return qs


def g_division_remainder(rng):
    qs = []
    for i in range(10):
        d = rng.randint(3, 9)
        q = rng.randint(12, 80)
        r = rng.randint(1, d - 1)
        n = d * q + r
        if i % 2 == 0:
            qs.append(fill(f"What is the quotient (whole-number part) of {n} ÷ {d}?", q))
        else:
            qs.append(fill(f"What is the remainder of {n} ÷ {d}?", r))
    return qs


def g_factors_multiples(rng):
    qs = []
    for i in range(10):
        if i % 2 == 0:
            n = rng.choice([12, 18, 24, 20, 36, 16, 30, 28])
            factors = [x for x in range(2, n) if n % x == 0]
            correct = rng.choice(factors)
            non = [x for x in range(2, n) if n % x != 0]
            rng.shuffle(non)
            qs.append(mcq(f"Which number is a factor of {n}?", correct, non[:3], rng))
        else:
            base = rng.choice([3, 4, 6, 7, 8, 9])
            k = rng.randint(3, 9)
            correct = base * k
            non = [correct + rng.choice([-1, 1, 2, -2]) for _ in range(3)]
            qs.append(mcq(f"Which number is a multiple of {base}?", correct, non, rng))
    return qs


def g_equivalent_fractions(rng):
    qs = []
    bases = [(1, 2), (1, 3), (2, 3), (1, 4), (3, 4), (2, 5), (3, 5), (1, 5)]
    for i in range(10):
        a, b = rng.choice(bases)
        k = rng.randint(2, 4)
        correct = f"{a*k}/{b*k}"
        distract = [f"{a*k+1}/{b*k}", f"{a*k}/{b*k+1}", f"{a+1}/{b+1}"]
        qs.append(mcq(f"Which fraction is equivalent to {a}/{b}?", correct, distract, rng))
    return qs


def g_compare_fractions(rng):
    qs = []
    for _ in range(10):
        d = rng.choice([4, 5, 6, 8, 10])
        x = rng.randint(1, d - 1)
        y = rng.randint(1, d - 1)
        while y == x:
            y = rng.randint(1, d - 1)
        f1, f2 = f"{x}/{d}", f"{y}/{d}"
        correct = f1 if x > y else f2
        qs.append(mcq(f"Which fraction is greater: {f1} or {f2}?",
                      correct, [f1 if correct == f2 else f2, "They are equal",
                                f"{x+y}/{d}"], rng))
    return qs


def g_add_fractions_like(rng):
    qs = []
    for i in range(10):
        d = rng.choice([5, 6, 8, 10, 12])
        a = rng.randint(1, d - 2)
        b = rng.randint(1, d - 1 - a)
        if i % 2 == 0:
            qs.append(fill(f"Add the fractions: {a}/{d} + {b}/{d} = ?  "
                           f"(Write as a fraction like 5/{d})", f"{a+b}/{d}"))
        else:
            tot = a + b
            qs.append(fill(f"Subtract: {tot}/{d} − {a}/{d} = ?  "
                           f"(Write as a fraction like 2/{d})", f"{b}/{d}"))
    return qs


# ========================================================= WRITING (computed)

NOUNS = ["river", "teacher", "garden", "puppy", "mountain", "kitchen", "pencil",
         "library", "sister", "engine", "village", "balloon", "doctor", "island",
         "blanket", "window", "farmer", "forest"]
VERBS = ["jump", "whisper", "build", "swim", "explore", "shout", "paint",
         "gallop", "stretch", "discover", "bounce", "scribble", "march", "wander"]
ADJS = ["shiny", "gentle", "enormous", "frozen", "curious", "ancient", "fluffy",
        "brave", "slippery", "cheerful", "narrow", "stormy", "golden", "tiny"]
PRONOUNS = ["she", "they", "him", "we", "it", "us", "her", "them", "you", "I"]


def g_nouns(rng):
    qs, pool = [], NOUNS[:]
    rng.shuffle(pool)
    for i in range(10):
        correct = pool[i]
        distract = rng.sample(VERBS + ADJS, 3)
        qs.append(mcq("Which word is a noun (a person, place, or thing)?",
                      correct, distract, rng))
    return qs


def g_verbs(rng):
    qs, pool = [], VERBS[:]
    rng.shuffle(pool)
    for i in range(10):
        correct = pool[i % len(pool)]
        distract = rng.sample(NOUNS + ADJS, 3)
        qs.append(mcq("Which word is an action verb (something you can do)?",
                      correct, distract, rng))
    return qs


def g_adjectives(rng):
    qs, pool = [], ADJS[:]
    rng.shuffle(pool)
    for i in range(10):
        correct = pool[i % len(pool)]
        distract = rng.sample(NOUNS + VERBS, 3)
        qs.append(mcq("Which word is an adjective (it describes a noun)?",
                      correct, distract, rng))
    return qs


def g_pronouns(rng):
    qs, pool = [], PRONOUNS[:]
    rng.shuffle(pool)
    for i in range(10):
        correct = pool[i % len(pool)]
        distract = rng.sample(NOUNS + VERBS, 3)
        qs.append(mcq("Which word is a pronoun (it takes the place of a noun)?",
                      correct, distract, rng))
    return qs


def g_subject_verb(rng):
    singular = [("dog", "barks"), ("girl", "runs"), ("baby", "cries"),
                ("teacher", "writes"), ("bird", "sings"), ("boy", "plays"),
                ("cat", "sleeps"), ("river", "flows"), ("clock", "ticks"),
                ("flower", "grows")]
    qs = []
    pool = singular[:]
    rng.shuffle(pool)
    for noun, verb in pool[:10]:
        wrong = verb[:-1] if verb.endswith("s") else verb + "s"
        qs.append(mcq(f"Choose the correct verb: \"The {noun} ____ every day.\"",
                      verb, [wrong, verb + "ed", verb + "ing"], rng))
    return qs


PAST = {"run": "ran", "go": "went", "eat": "ate", "see": "saw", "make": "made",
        "take": "took", "give": "gave", "write": "wrote", "sing": "sang",
        "swim": "swam", "fly": "flew", "draw": "drew", "ride": "rode",
        "begin": "began"}


def g_past_tense(rng):
    items = list(PAST.items())
    rng.shuffle(items)
    return [fill(f"What is the past tense of the verb \"{base}\"?", past)
            for base, past in items[:10]]


PLURALS = {"baby": "babies", "city": "cities", "leaf": "leaves",
           "wolf": "wolves", "box": "boxes", "bus": "buses", "fox": "foxes",
           "story": "stories", "knife": "knives", "dish": "dishes",
           "berry": "berries", "brush": "brushes", "penny": "pennies",
           "shelf": "shelves"}


def g_plurals(rng):
    items = list(PLURALS.items())
    rng.shuffle(items)
    return [fill(f"Write the plural of \"{word}\".", plural)
            for word, plural in items[:10]]


def g_capitalization(rng):
    names = ["india", "monday", "december", "amazon river", "mount everest",
             "sarah", "new york", "africa", "tuesday", "october", "pacific ocean",
             "london"]
    rng.shuffle(names)
    qs = []
    for name in names[:10]:
        correct = name.title()
        commons = rng.sample(["river", "city", "month", "country", "ocean",
                              "mountain", "friend", "day"], 3)
        qs.append(mcq("Which word or phrase is a proper noun that must be "
                      "capitalized?", correct, commons, rng))
    return qs


def g_end_punctuation(rng):
    items = [("Watch out", "!"), ("What time is it", "?"),
             ("I love to read", "."), ("Where are we going", "?"),
             ("That is amazing", "!"), ("The sky is blue", "."),
             ("Are you ready", "?"), ("Stop right now", "!"),
             ("We had lunch", "."), ("How does it work", "?"),
             ("Look at that", "!"), ("She likes apples", ".")]
    rng.shuffle(items)
    qs = []
    for sent, mark in items[:10]:
        distract = [m for m in [".", "?", "!"] if m != mark] + [","]
        qs.append(mcq(f"Which end mark best completes the sentence?  \"{sent}___\"",
                      mark, distract, rng))
    return qs


# ===================================================== AUTHORED BANK HELPERS

def build_bank(raw, rng):
    """Convert authored tuples into question dicts.
    ('mcq', prompt, correct, [d1,d2,d3]) or ('fill', prompt, answer)."""
    out = []
    for item in raw:
        if item[0] == "mcq":
            _, prompt, correct, distract = item
            out.append(mcq(prompt, correct, distract, rng))
        else:
            _, prompt, answer = item
            out.append(fill(prompt, answer))
    assert len(out) == 10, f"bank must have 10 questions, got {len(out)}"
    return out


# ===================================================== SCIENCE (authored, NGSS)

SCIENCE = {
"energy": [
 ("mcq","Energy that is moving, like a rolling ball, is called what?","kinetic energy",["stored energy","light only","no energy"]),
 ("mcq","A stretched rubber band ready to snap back is an example of what?","stored (potential) energy",["kinetic energy","heat energy only","sound only"]),
 ("mcq","When you rub your hands together quickly, the energy you feel is mostly:","heat (thermal) energy",["light energy","sound energy","chemical energy"]),
 ("mcq","A faster-moving object has MORE of which kind of energy?","kinetic energy",["less energy","stored energy","no energy"]),
 ("mcq","Which of these gives off light and heat energy?","the Sun",["a rock","a glass of water","a wooden chair"]),
 ("mcq","Plants store energy from sunlight in the form of:","food (sugar)",["water","soil","air"]),
 ("mcq","A battery stores which kind of energy?","chemical energy",["sound energy","light energy","wind energy"]),
 ("fill","Energy from the movement of an object is called ____ energy. (one word)","kinetic"),
 ("mcq","When a moving car hits a wall, its energy is transferred mostly into:","sound and heat",["new matter","sunlight","gravity"]),
 ("mcq","Which activity uses electrical energy?","turning on a lamp",["dropping a ball","stretching a spring","throwing a rock"]),
],
"waves-light-sound": [
 ("mcq","Sound is made when objects do what?","vibrate",["freeze","melt","glow"]),
 ("mcq","We see most objects because light does what off of them?","reflects (bounces)",["disappears","freezes","melts"]),
 ("mcq","Sound travels as a kind of:","wave",["rock","liquid","gas only"]),
 ("mcq","A louder sound is made by a vibration with a bigger:","amplitude",["color","weight","smell"]),
 ("mcq","Which travels faster?","light",["sound","they never move","neither moves"]),
 ("mcq","You cannot see in a completely dark room because there is no:","light",["sound","air","water"]),
 ("mcq","A high-pitched sound comes from vibrations that are:","fast",["slow","stopped","heavy"]),
 ("fill","Sound is made when an object ____ back and forth. (one word)","vibrates"),
 ("mcq","Patterns of light and sound can be used to:","send information (like a signal)",["create matter","stop time","make gravity"]),
 ("mcq","An echo happens when sound waves do what off a wall?","bounce back",["disappear","speed up forever","turn into light"]),
],
"plant-structures": [
 ("mcq","Which plant part takes in water from the soil?","roots",["flower","leaf","fruit"]),
 ("mcq","Which plant part makes food using sunlight?","leaves",["roots","stem","seeds"]),
 ("mcq","Which part of a plant usually makes seeds?","flower",["root","stem","leaf"]),
 ("mcq","What carries water from the roots up to the leaves?","the stem",["the petals","the seeds","the fruit"]),
 ("mcq","The process plants use to make food from sunlight is called:","photosynthesis",["digestion","erosion","evaporation"]),
 ("mcq","Why are brightly colored flowers helpful to a plant?","they attract pollinators like bees",["they scare away the Sun","they make the plant cold","they stop water"]),
 ("mcq","Seeds help a plant to:","make new plants (reproduce)",["take in sunlight","hold the plant down","make flowers fall"]),
 ("fill","The plant part that anchors it and absorbs water is the ____. (one word)","roots"),
 ("mcq","A fruit usually protects the plant's:","seeds",["roots","leaves","stem"]),
 ("mcq","Which do plants need to make their own food?","sunlight, water, and air",["only soil","only darkness","only rocks"]),
],
"animal-structures-senses": [
 ("mcq","Which body part do most animals use to sense light?","eyes",["fins","fur","claws"]),
 ("mcq","An animal uses its ears mainly to:","hear sounds",["taste food","see color","smell"]),
 ("mcq","Sharp claws and teeth most help an animal to:","catch and eat food",["fly higher","stay warm","see at night"]),
 ("mcq","Thick fur or feathers most help an animal to:","stay warm",["run faster only","see better","smell food"]),
 ("mcq","Which structure helps a fish move through water?","fins",["lungs","wings","hooves"]),
 ("mcq","Animals use information from their senses to help them:","survive (find food, avoid danger)",["grow taller only","change color of the sky","stop breathing"]),
 ("mcq","A bird's wings are mainly used for:","flying",["digging","swimming deep","hearing"]),
 ("fill","The sense organ an animal uses to detect smells is its ____. (one word)","nose"),
 ("mcq","Camouflage helps an animal by letting it:","blend in and hide",["glow in the dark","grow wings","breathe water"]),
 ("mcq","Long legs most help an animal to:","run or move quickly",["see color","hear better","taste food"]),
],
"earths-features": [
 ("mcq","A very large area of salt water on Earth is called an:","ocean",["mountain","desert","forest"]),
 ("mcq","A tall landform that rises high above the land around it is a:","mountain",["valley","plain","river"]),
 ("mcq","Most of Earth's surface is covered by:","water",["sand","ice","forests"]),
 ("mcq","A map uses symbols and a key to show:","places and features",["the future","sounds","smells"]),
 ("mcq","A low area of land between mountains is called a:","valley",["peak","plateau","cliff"]),
 ("mcq","Fresh water that flows across land toward the sea is a:","river",["dune","crater","glacier"]),
 ("mcq","Which is the largest? ","an ocean",["a pond","a stream","a puddle"]),
 ("fill","A dry region that gets very little rain is called a ____. (one word)","desert"),
 ("mcq","Mountains are often found in long lines called:","ranges",["lakes","bays","islands"]),
 ("mcq","A piece of land surrounded by water on all sides is an:","island",["ocean","valley","desert"]),
],
"weathering-erosion": [
 ("mcq","Wind and water slowly breaking rock into smaller pieces is called:","weathering",["melting","freezing","growing"]),
 ("mcq","Moving water carrying away soil and sand is called:","erosion",["evaporation","reflection","vibration"]),
 ("mcq","Which can wear down a mountain over a very long time?","wind and water",["a single rainy day","sound","moonlight"]),
 ("mcq","Plant roots can break rocks apart as they:","grow",["shrink","freeze the Sun","reflect light"]),
 ("mcq","When a river drops the sand and soil it was carrying, this is called:","deposition",["weathering","vibration","photosynthesis"]),
 ("mcq","Which change happens very slowly, over many years?","a canyon being carved by a river",["a glass breaking","a light turning on","a door closing"]),
 ("mcq","Ocean waves hitting a cliff cause the cliff to:","wear away (erode)",["grow taller","get colder","turn to metal"]),
 ("fill","The breaking down of rock into smaller pieces is called ____. (one word)","weathering"),
 ("mcq","Which helps SLOW down soil erosion on a hill?","planting grass and trees",["removing all plants","pouring more water","adding loose sand"]),
 ("mcq","Sand at a beach was once mostly:","larger rocks broken down over time",["made by animals","fallen from the sky","grown from seeds"]),
],
"fossils-rock-layers": [
 ("mcq","A fossil is the preserved remains or trace of a:","living thing from long ago",["modern plastic toy","fresh leaf","rain cloud"]),
 ("mcq","Fossils are most often found in which kind of rock?","sedimentary rock",["plastic","glass","metal"]),
 ("mcq","In undisturbed rock layers, the OLDEST layer is usually:","at the bottom",["at the top","in the middle","floating above"]),
 ("mcq","Fossils can tell us about:","living things and environments of the past",["tomorrow's weather","the price of food","what someone is thinking"]),
 ("mcq","A dinosaur footprint turned to stone is an example of a:","trace fossil",["mineral crystal","raindrop","modern shoe"]),
 ("mcq","Rock layers form over time as ____ piles up and hardens.","sediment",["sunlight","sound","wind only"]),
 ("mcq","If a fossil of a fish is found in a desert, it suggests the area was once:","underwater",["on the Moon","always a desert","made of metal"]),
 ("fill","The preserved remains of an ancient living thing is called a ____. (one word)","fossil"),
 ("mcq","Scientists who study fossils are called:","paleontologists",["astronauts","chefs","pilots"]),
 ("mcq","Newer rock layers are usually found:","on top of older layers",["below older layers","inside the Sun","under the ocean only"]),
],
"natural-resources": [
 ("mcq","Which is a natural resource that comes from the Earth?","water",["a plastic toy","a video game","a brick wall"]),
 ("mcq","Which energy resource is renewable (it won't run out)?","sunlight",["coal","oil","natural gas"]),
 ("mcq","Coal and oil are called fossil fuels and are:","nonrenewable",["renewable","made by factories","unlimited"]),
 ("mcq","Recycling helps us:","use fewer new resources",["use up more oil","make more trash","waste water"]),
 ("mcq","Which is a way to conserve water?","turn off the tap while brushing teeth",["leave the hose running","take very long showers","pour water on the road"]),
 ("mcq","Wind can be used to make electricity using a:","wind turbine",["coal mine","oil well","candle"]),
 ("mcq","Trees are an important resource because they give us wood and:","oxygen",["plastic","metal","gasoline"]),
 ("fill","A resource that can be replaced naturally, like sunlight or wind, is called ____. (one word)","renewable"),
 ("mcq","A natural event that can be dangerous to people, like a flood, is a natural:","hazard",["resource","recycle","fuel"]),
 ("mcq","Which choice reduces pollution?","riding a bike instead of driving",["burning more trash","leaving lights on all day","wasting paper"]),
],
"electricity-magnetism": [
 ("mcq","Electricity flows easily through which material?","metal wire",["rubber","plastic","wood"]),
 ("mcq","A material that does NOT let electricity flow easily is called an:","insulator",["conductor","magnet","battery"]),
 ("mcq","A magnet attracts objects made of:","iron",["plastic","glass","paper"]),
 ("mcq","Two magnets pushing apart are showing that like poles:","repel",["attract","melt","disappear"]),
 ("mcq","A complete path that lets electricity flow is called a:","circuit",["magnet","fossil","wave"]),
 ("mcq","Which is a conductor of electricity?","copper",["wood","rubber","cloth"]),
 ("mcq","The opposite poles of two magnets will:","attract (pull together)",["repel","do nothing ever","catch fire"]),
 ("fill","A complete loop that electricity travels around is called a ____. (one word)","circuit"),
 ("mcq","If a bulb in a simple circuit won't light, a likely problem is:","a break in the circuit",["too many magnets","not enough sunlight","the room is quiet"]),
 ("mcq","A magnet's pull is strongest at its:","poles (ends)",["middle","color","weight"]),
],
"water-cycle-weather": [
 ("mcq","When the Sun heats water and it turns into vapor, this is:","evaporation",["condensation","precipitation","erosion"]),
 ("mcq","Water vapor cooling and forming clouds is called:","condensation",["evaporation","melting","weathering"]),
 ("mcq","Rain, snow, and hail are all forms of:","precipitation",["evaporation","reflection","vibration"]),
 ("mcq","Clouds are made of tiny drops of:","water",["smoke","dust only","sand"]),
 ("mcq","The day-to-day condition of the air (sunny, rainy) is called:","weather",["climate forever","gravity","erosion"]),
 ("mcq","Most of the water that evaporates into the sky comes from the:","oceans",["deserts","rocks","fires"]),
 ("mcq","Which tool measures temperature?","thermometer",["ruler","scale","clock"]),
 ("fill","Water turning from a liquid into a gas is called ____. (one word)","evaporation"),
 ("mcq","The water cycle is powered mainly by energy from the:","Sun",["Moon","wind alone","rivers"]),
 ("mcq","Snow is most likely to fall when the air is:","very cold",["very hot","very dry only","windy only"]),
],
}


def g_commas_series(rng):
    sets = [("apples", "oranges", "pears"), ("red", "green", "blue"),
            ("cats", "dogs", "fish"), ("run", "jump", "swim"),
            ("Mom", "Dad", "Grandma"), ("pencils", "pens", "markers"),
            ("spring", "summer", "fall"), ("milk", "eggs", "bread"),
            ("soccer", "tennis", "golf"), ("trains", "planes", "buses")]
    rng.shuffle(sets)
    qs = []
    for a, b, c in sets[:10]:
        correct = f"I like {a}, {b}, and {c}."
        d1 = f"I like {a} {b} and {c}."
        d2 = f"I like {a}, {b} and {c}"
        d3 = f"I like, {a} {b} {c}."
        qs.append(mcq("Which sentence uses commas correctly in a list?",
                      correct, [d1, d2, d3], rng))
    return qs


def g_multiply_1digit(rng):
    qs, seen = [], set()
    while len(qs) < 10:
        a = rng.randint(2, 9)
        b = rng.randint(112, 989)
        if (a, b) in seen:
            continue
        seen.add((a, b))
        qs.append(fill(f"Multiply: {a} × {b} = ?", a * b))
    return qs


# ============================================ READING COMPREHENSION (authored)

READING = {
"main-idea": [
 ("mcq","Read: \"Bees are very important. They move pollen from flower to flower, which helps plants make seeds and fruit. Without bees, many foods would be hard to grow.\" What is the main idea?","Bees are important because they help plants grow.",["Bees can sting people.","Flowers are colorful.","Fruit tastes sweet."]),
 ("mcq","Read: \"Maria practiced piano every day after school. At first the songs were hard, but slowly she got better. By spring, she could play her favorite song perfectly.\" What is the main idea?","Practice helped Maria improve at piano.",["Maria does not like music.","Spring is a season.","Piano songs are easy."]),
 ("mcq","Read: \"Penguins live where it is very cold. Their thick feathers and a layer of fat keep them warm. They huddle together to share heat.\" The passage is mostly about how penguins:","stay warm in cold places",["catch fish","swim fast","build nests"]),
 ("mcq","Read: \"Recycling helps the Earth. It saves trees, uses less energy, and keeps trash out of landfills.\" What is the main idea?","Recycling is good for the Earth.",["Trees are tall.","Trash smells bad.","Landfills are far away."]),
 ("mcq","Read: \"The school garden grew many vegetables. Students planted seeds, watered them, and pulled weeds. In the fall, they picked tomatoes and carrots.\" What is the main idea?","Students grew vegetables in the school garden.",["Carrots are orange.","School starts early.","Weeds are tall."]),
 ("mcq","Read: \"Sea turtles travel thousands of miles in the ocean. They return to the same beach where they were born to lay their eggs.\" The main idea is that sea turtles:","travel far and return to their home beach",["eat jellyfish","are very old","swim slowly"]),
 ("mcq","Read: \"Firefighters have a tough job. They put out fires, rescue people, and teach safety. They must be brave and strong.\" What is the main idea?","Firefighters do an important and difficult job.",["Fire is hot.","Trucks are red.","Water puts out fire."]),
 ("mcq","Read: \"Thomas built a model volcano for science class. He mixed baking soda and vinegar, and it bubbled over like real lava.\" The passage is mainly about:","a science project Thomas made",["how to cook dinner","a real volcano erupting","a trip to the beach"]),
 ("mcq","Read: \"Libraries are wonderful places. You can borrow books, use computers, and join reading clubs, all for free.\" What is the main idea?","Libraries offer many free things to do.",["Books are heavy.","Computers are new.","Reading is hard."]),
 ("fill","Read: \"Brushing your teeth keeps them healthy. It removes food, fights cavities, and keeps your breath fresh.\" In one word, the passage is mostly about keeping your teeth ____. ","healthy"),
],
"supporting-details": [
 ("mcq","Read: \"Dogs make great pets. They are loyal, they can be trained, and they love to play.\" Which is a detail that supports the main idea?","They can be trained.",["Cats are quiet.","Fish swim in water.","Birds can fly."]),
 ("mcq","Read: \"Our trip to the zoo was fun. We saw lions, fed the goats, and watched the monkeys swing.\" Which detail tells something they did at the zoo?","We fed the goats.",["The bus was yellow.","It rained yesterday.","Lunch was at noon."]),
 ("mcq","Read: \"Winter can be dangerous. Roads get icy, the cold can hurt your skin, and storms can knock out power.\" Which detail supports that winter is dangerous?","Roads get icy.",["Summer is warm.","Leaves are green.","Birds sing."]),
 ("mcq","Read: \"Plants need care to grow. They need water, sunlight, and good soil.\" Which is a supporting detail?","They need sunlight.",["Rocks are hard.","The sky is blue.","Dogs bark."]),
 ("mcq","Read: \"The festival had lots to enjoy. There was music, tasty food, and games for kids.\" Which detail supports that there was a lot to enjoy?","There were games for kids.",["It was Tuesday.","The town is small.","Cars were parked."]),
 ("mcq","Read: \"Exercise keeps you healthy. It makes your heart strong, builds muscles, and lifts your mood.\" A supporting detail is that exercise:","makes your heart strong",["takes time","is on TV","needs shoes"]),
 ("mcq","Read: \"The old house looked spooky. The windows were broken, the door creaked, and vines covered the walls.\" Which detail shows the house looked spooky?","The door creaked.",["It was for sale.","The yard was big.","The roof was flat."]),
 ("mcq","Read: \"Reading is a great hobby. It teaches new words, takes you on adventures, and helps you relax.\" A supporting detail is that reading:","teaches new words",["costs money","is loud","needs a TV"]),
 ("mcq","Read: \"Our teacher is kind. She helps us when we are stuck, listens to our ideas, and smiles a lot.\" Which detail supports that she is kind?","She listens to our ideas.",["She drives a car.","School is big.","Math is hard."]),
 ("fill","Read: \"The beach trip was busy. We built sandcastles, swam in the waves, and collected shells.\" Name one thing they did at the beach. (one word, e.g. swam)","swam"),
],
"sequence": [
 ("mcq","Read: \"First Sam woke up. Next he ate breakfast. Then he walked to school.\" What did Sam do FIRST?","He woke up.",["He ate breakfast.","He walked to school.","He went to bed."]),
 ("mcq","Read: \"To make a sandwich, first get the bread. Then add the filling. Last, cut it in half.\" What do you do LAST?","Cut it in half.",["Get the bread.","Add the filling.","Eat the crust."]),
 ("mcq","Read: \"The seed sprouted. Then it grew leaves. Finally it bloomed into a flower.\" What happened SECOND?","It grew leaves.",["It bloomed.","The seed sprouted.","It was picked."]),
 ("mcq","Read: \"Mia drew a picture, then colored it, and finally hung it on the wall.\" What did Mia do right AFTER drawing?","She colored it.",["She hung it up.","She erased it.","She slept."]),
 ("mcq","Read: \"First the clouds gathered. Next it began to rain. Then a rainbow appeared.\" What came BEFORE the rain?","The clouds gathered.",["The rainbow.","The sun set.","The snow fell."]),
 ("mcq","Read: \"Leo packed his bag, ate lunch, and then left for the trip.\" What did Leo do BEFORE leaving?","He ate lunch.",["He came home.","He unpacked.","He slept."]),
 ("mcq","Read: \"She mixed the batter, poured it in a pan, and baked the cake.\" What is the LAST step?","Bake the cake.",["Mix the batter.","Pour the batter.","Buy flour."]),
 ("mcq","Read: \"The alarm rang. Then Dad got up. After that, he made coffee.\" What happened FIRST?","The alarm rang.",["Dad made coffee.","Dad got up.","Dad left."]),
 ("mcq","Read: \"We bought tickets, found our seats, and watched the movie.\" What did we do right BEFORE watching the movie?","We found our seats.",["We bought popcorn.","We went home.","We slept."]),
 ("fill","Read: \"First you plant the seed, next you water it, then it grows.\" What do you do right after planting the seed? (one word)","water"),
],
"cause-and-effect": [
 ("mcq","Read: \"Because it rained all day, the soccer game was canceled.\" What was the CAUSE?","It rained all day.",["The game was canceled.","The team won.","The sun came out."]),
 ("mcq","Read: \"Tom forgot to water his plant, so it wilted.\" What was the EFFECT?","The plant wilted.",["Tom watered it.","The plant grew.","Tom forgot."]),
 ("mcq","Read: \"The ice melted because the day was very hot.\" Why did the ice melt?","The day was very hot.",["The ice was blue.","It was winter.","The freezer broke for no reason."]),
 ("mcq","Read: \"She studied hard, so she passed the test.\" What caused her to pass?","She studied hard.",["The test was easy.","She was late.","She slept in class."]),
 ("mcq","Read: \"The dog barked loudly, so the baby woke up.\" What was the effect of the barking?","The baby woke up.",["The dog slept.","The baby ate.","The dog ran."]),
 ("mcq","Read: \"Because the road was icy, the cars drove slowly.\" Why did the cars drive slowly?","The road was icy.",["The cars were red.","It was sunny.","The road was new."]),
 ("mcq","Read: \"He left the milk out, so it spoiled.\" What was the cause of the milk spoiling?","He left the milk out.",["The milk was cold.","The fridge was full.","He drank it."]),
 ("mcq","Read: \"The wind blew hard, so the kite flew high.\" What made the kite fly high?","The wind blew hard.",["The kite was heavy.","It rained.","The string broke."]),
 ("mcq","Read: \"Because the library was closed, we went to the park instead.\" What was the effect of the library being closed?","They went to the park.",["The library opened.","They read books.","They stayed home all day."]),
 ("fill","Read: \"The fire alarm rang, so everyone left the building.\" What was the cause that made everyone leave? Answer with the two words: the fire ____. ","alarm"),
],
"context-clues": [
 ("mcq","Read: \"The path was so narrow that only one person could pass at a time.\" What does \"narrow\" mean?","not wide",["very tall","bright","heavy"]),
 ("mcq","Read: \"The soup was scalding, so she waited for it to cool.\" What does \"scalding\" mean?","very hot",["very cold","tasty","empty"]),
 ("mcq","Read: \"He was exhausted after the long run and fell asleep right away.\" What does \"exhausted\" mean?","very tired",["excited","hungry","angry"]),
 ("mcq","Read: \"The ancient ruins were thousands of years old.\" What does \"ancient\" mean?","very old",["brand new","colorful","tiny"]),
 ("mcq","Read: \"The puppy was timid and hid behind the couch when strangers came.\" What does \"timid\" mean?","shy or fearful",["loud","huge","fast"]),
 ("mcq","Read: \"She spoke in a faint whisper that was hard to hear.\" What does \"faint\" mean here?","weak or soft",["very loud","bright","sweet"]),
 ("mcq","Read: \"The enormous elephant was the biggest animal at the zoo.\" What does \"enormous\" mean?","very large",["very small","very fast","very quiet"]),
 ("mcq","Read: \"After the drought, the dry land had no water for months.\" What does \"drought\" mean?","a long time with no rain",["a big flood","a snowstorm","a forest"]),
 ("mcq","Read: \"He was generous and shared his lunch with everyone.\" What does \"generous\" mean?","willing to give and share",["selfish","tired","mean"]),
 ("fill","Read: \"The room was vacant; nobody was inside.\" What does \"vacant\" mean? (one word, starts with e)","empty"),
],
"making-inferences": [
 ("mcq","Read: \"Maya grabbed her umbrella and rain boots before heading out.\" What can you infer?","It is probably raining or going to rain.",["It is sunny.","She is going swimming.","It is nighttime."]),
 ("mcq","Read: \"Jake's stomach growled and he kept looking at the clock near lunchtime.\" What can you infer?","Jake is hungry.",["Jake is sleepy.","Jake is cold.","Jake is angry."]),
 ("mcq","Read: \"The streets were empty and all the shops had their lights off.\" What can you infer?","It is very early or very late.",["It is a busy afternoon.","There is a parade.","It is lunchtime."]),
 ("mcq","Read: \"Tia smiled wide and hugged the trophy to her chest.\" What can you infer?","Tia is happy that she won.",["Tia is sad.","Tia is bored.","Tia is afraid."]),
 ("mcq","Read: \"The leaves were turning red and orange, and kids wore jackets to school.\" What season is it?","Fall (autumn)",["Summer","A hot day","Spring planting"]),
 ("mcq","Read: \"Ben tiptoed and whispered as he passed the baby's room.\" What can you infer?","The baby is sleeping.",["The baby is playing.","Ben is loud.","It is a party."]),
 ("mcq","Read: \"The dog wagged its tail and ran to the door when it heard the car.\" What can you infer?","The dog is excited someone is home.",["The dog is scared.","The dog is asleep.","The dog is sick."]),
 ("mcq","Read: \"Sweat dripped down as the team gulped water during a break.\" What can you infer?","It is hot and they have been active.",["It is snowing.","They are sleeping.","They are reading."]),
 ("mcq","Read: \"Grandma set out an extra plate and watched the clock by the window.\" What can you infer?","She is expecting a guest.",["She is leaving forever.","She broke a plate.","She is at school."]),
 ("fill","Read: \"He put on a coat, hat, and gloves before going outside.\" Based on the clues, the weather is most likely ____. (one word)","cold"),
],
"authors-purpose": [
 ("mcq","An author writes \"10 Steps to Build a Birdhouse.\" The author's purpose is mainly to:","instruct (teach how to do something)",["entertain with a story","persuade you to vote","tell a joke"]),
 ("mcq","A funny story about a talking dog is written mainly to:","entertain",["instruct","sell a product","report news"]),
 ("mcq","An article titled \"Why Our Town Needs a New Park\" is written mainly to:","persuade",["entertain","give a recipe","tell a fairy tale"]),
 ("mcq","A page in a science book explaining how rain forms is written mainly to:","inform",["scare the reader","sell toys","make you laugh"]),
 ("mcq","A poster that says \"Eat more vegetables for a healthy body!\" is meant to:","persuade",["report sports scores","tell a mystery","teach math"]),
 ("mcq","A cookbook recipe is written mainly to:","instruct",["entertain","persuade","tell news"]),
 ("mcq","A made-up adventure about pirates searching for treasure is written to:","entertain",["inform","instruct","persuade"]),
 ("mcq","A weather report telling tomorrow's temperatures is meant to:","inform",["entertain","persuade","tell a story"]),
 ("mcq","An ad that says \"Buy our shoes — they're the best!\" is written to:","persuade",["inform only","teach a lesson","tell a joke"]),
 ("fill","If an author writes mainly to teach you facts, their purpose is to ____. (one word, starts with i)","inform"),
],
"compare-and-contrast": [
 ("mcq","Read: \"Cats and dogs are both popular pets, but cats are usually quieter and dogs like to play fetch.\" One way they are the SAME is:","both are popular pets",["both play fetch","both are quiet","both bark"]),
 ("mcq","Read: \"A bicycle has two wheels, while a car has four.\" This sentence shows a:","difference",["similarity","cause","sequence"]),
 ("mcq","Read: \"Both apples and oranges are fruits that grow on trees.\" The word that signals they are alike is:","both",["but","while","unlike"]),
 ("mcq","Read: \"Summer is hot, but winter is cold.\" This compares the two seasons by their:","temperature",["color","size","name"]),
 ("mcq","Read: \"Unlike a frog, a fish cannot live out of water.\" The word \"unlike\" signals a:","difference",["similarity","sequence","cause"]),
 ("mcq","Read: \"A pencil and a pen are both used for writing, but a pencil can be erased.\" How are they DIFFERENT?","a pencil can be erased",["both write","both are tools","both are long"]),
 ("mcq","Read: \"Birds and bats can both fly, but birds have feathers and bats have fur.\" A similarity is that both:","can fly",["have feathers","have fur","swim"]),
 ("mcq","Read: \"The city is busy and loud, while the countryside is calm and quiet.\" This contrasts the two places by their:","noise level",["color","spelling","price"]),
 ("mcq","Which word best signals a contrast (difference)?","however",["also","both","similarly"]),
 ("fill","The word \"both\" usually signals that two things are ____ (alike or different?). ","alike"),
],
"fact-and-opinion": [
 ("mcq","Which sentence is a FACT?","Water freezes at 0 degrees Celsius.",["Winter is the best season.","Pizza tastes amazing.","Blue is the prettiest color."]),
 ("mcq","Which sentence is an OPINION?","Recess is the most fun part of the day.",["A week has seven days.","The Sun is a star.","Spiders have eight legs."]),
 ("mcq","Which is a FACT?","A triangle has three sides.",["Math is boring.","Dogs are better than cats.","Summer is too hot."]),
 ("mcq","Which is an OPINION?","Chocolate ice cream is the best flavor.",["Ice melts when heated.","There are 12 months in a year.","Plants need sunlight."]),
 ("mcq","\"Our school has 400 students.\" This statement is a:","fact",["opinion","question","story"]),
 ("mcq","\"Reading is more fun than watching TV.\" This statement is an:","opinion",["fact","math problem","rule"]),
 ("mcq","Which can be checked to see if it is true (a fact)?","The library opens at 9 a.m.",["Mondays are terrible.","This book is the best ever.","Green is a happy color."]),
 ("mcq","Which word often signals an opinion?","best",["measured","equals","contains"]),
 ("mcq","Which is a FACT?","Elephants are the largest land animals.",["Elephants are cute.","Zoos are boring.","Lions are scary."]),
 ("fill","A statement that tells what someone feels or believes, and can't be proven true, is called an ____. (one word)","opinion"),
],
"synonyms-and-antonyms": [
 ("mcq","Which word is a SYNONYM (same meaning) for \"happy\"?","glad",["sad","angry","tired"]),
 ("mcq","Which word is an ANTONYM (opposite) of \"big\"?","small",["large","huge","giant"]),
 ("mcq","Which word means almost the same as \"fast\"?","quick",["slow","late","still"]),
 ("mcq","Which word is the opposite of \"hot\"?","cold",["warm","boiling","sunny"]),
 ("mcq","A synonym for \"begin\" is:","start",["stop","end","finish"]),
 ("mcq","An antonym for \"empty\" is:","full",["bare","hollow","vacant"]),
 ("mcq","Which word means the same as \"smart\"?","clever",["silly","slow","lazy"]),
 ("mcq","The opposite of \"day\" is:","night",["noon","morning","sunrise"]),
 ("mcq","A synonym for \"tired\" is:","sleepy",["awake","alert","lively"]),
 ("fill","Write a one-word ANTONYM (opposite) of \"up\". ","down"),
],
}


# ===================================================== TOPIC REGISTRY (ordered)
# (subject_slug, topic_slug, name, standard_code, teach_text, source)
# source: a generator callable rng->[q]  OR  an authored bank (list of tuples)

SUBJECTS = [
    ("math", "Math", 0),
    ("science", "Science", 1),
    ("reading", "Reading Comprehension", 2),
    ("writing", "Writing", 3),
]

TOPICS = [
 # ---- MATH ----
 ("math","place-value-to-hundred-thousands","Place Value to Hundred Thousands","4.NBT.A.2",
  "Each digit in a number has a value based on its place: ones, tens, hundreds, thousands, and beyond. The same digit is worth more the farther left it sits.", g_place_value),
 ("math","rounding-large-numbers","Rounding Large Numbers","4.NBT.A.3",
  "To round, look at the digit just to the right of the place you're rounding to. If it's 5 or more, round up; if it's less than 5, round down.", g_rounding),
 ("math","multi-digit-addition-and-subtraction","Multi-Digit Addition & Subtraction","4.NBT.B.4",
  "Line up numbers by place value, then add or subtract one column at a time, regrouping (carrying or borrowing) when needed.", g_add_subtract),
 ("math","multiply-by-one-digit","Multiply by a One-Digit Number","4.NBT.B.5",
  "Break the big number into place values, multiply each part by the one-digit number, then add the partial products together.", g_multiply_1digit),
 ("math","multiply-two-digit-numbers","Multiply Two Two-Digit Numbers","4.NBT.B.5",
  "Split each number into tens and ones and multiply every part by every part (the area model), then add up all the partial products.", g_multiply_2x2),
 ("math","division-with-remainders","Division with Remainders","4.NBT.B.6",
  "Divide to find how many equal groups you can make (the quotient). Whatever is left over and can't make a full group is the remainder.", g_division_remainder),
 ("math","factors-and-multiples","Factors & Multiples","4.OA.B.4",
  "A factor divides a number evenly with no remainder. A multiple is what you get when you skip-count by a number.", g_factors_multiples),
 ("math","equivalent-fractions","Equivalent Fractions","4.NF.A.1",
  "Two fractions are equivalent if they show the same amount. Multiply (or divide) the top and bottom by the same number to find one.", g_equivalent_fractions),
 ("math","comparing-fractions","Comparing Fractions","4.NF.A.2",
  "When two fractions have the same denominator, the one with the bigger numerator (top number) is greater.", g_compare_fractions),
 ("math","adding-fractions-like-denominators","Adding & Subtracting Fractions","4.NF.B.3",
  "When denominators are the same, just add or subtract the numerators and keep the denominator the same.", g_add_fractions_like),
 # ---- SCIENCE ----
 ("science","energy","Energy & Motion","4-PS3-1",
  "Energy is the ability to do work or cause change. Moving things have kinetic energy; stored-up energy (like a stretched spring) is potential energy.", SCIENCE["energy"]),
 ("science","waves-light-sound","Waves: Light & Sound","4-PS4-1",
  "Sound is made by vibrations that travel as waves. We see things when light bounces off them and reaches our eyes.", SCIENCE["waves-light-sound"]),
 ("science","plant-structures","Plant Structures & Functions","4-LS1-1",
  "Plants have parts with special jobs: roots take in water, leaves make food from sunlight, stems carry water, and flowers make seeds.", SCIENCE["plant-structures"]),
 ("science","animal-structures-senses","Animal Structures & Senses","4-LS1-2",
  "Animals have body parts and senses that help them survive — to find food, sense danger, move, and stay warm.", SCIENCE["animal-structures-senses"]),
 ("science","earths-features","Earth's Features & Maps","4-ESS2-2",
  "Earth has oceans, mountains, rivers, valleys, and deserts. Maps use symbols and a key to show where these features are.", SCIENCE["earths-features"]),
 ("science","weathering-erosion","Weathering & Erosion","4-ESS2-1",
  "Weathering breaks rock into smaller pieces. Erosion is when wind or water carries those pieces away, slowly changing the land.", SCIENCE["weathering-erosion"]),
 ("science","fossils-rock-layers","Fossils & Rock Layers","4-ESS1-1",
  "Fossils are preserved traces of ancient living things, usually found in sedimentary rock. Lower rock layers are usually older.", SCIENCE["fossils-rock-layers"]),
 ("science","natural-resources","Natural Resources & Conservation","4-ESS3-1",
  "Natural resources come from Earth. Some are renewable (sunlight, wind) and some are not (coal, oil). Conserving them protects the planet.", SCIENCE["natural-resources"]),
 ("science","electricity-magnetism","Electricity & Magnetism","4-PS3-2",
  "Electricity flows through conductors like metal in a complete circuit. Magnets attract iron and have poles that attract or repel.", SCIENCE["electricity-magnetism"]),
 ("science","water-cycle-weather","The Water Cycle & Weather","4-ESS2-1",
  "The Sun drives the water cycle: water evaporates, condenses into clouds, and falls as precipitation. Weather is the day-to-day state of the air.", SCIENCE["water-cycle-weather"]),
 # ---- READING COMPREHENSION ----
 ("reading","main-idea","Finding the Main Idea","RI.4.2",
  "The main idea is what a passage is mostly about. Ask yourself: what is the one big point the author wants me to understand?", READING["main-idea"]),
 ("reading","supporting-details","Supporting Details","RI.4.2",
  "Supporting details are the facts and examples that tell more about the main idea. They answer who, what, where, when, why, and how.", READING["supporting-details"]),
 ("reading","sequence","Sequence of Events","RI.4.3",
  "Sequence is the order things happen. Signal words like first, next, then, and last help you keep track of the order.", READING["sequence"]),
 ("reading","cause-and-effect","Cause & Effect","RI.4.3",
  "A cause is why something happens; the effect is what happens. Words like because and so often connect them.", READING["cause-and-effect"]),
 ("reading","context-clues","Vocabulary in Context","RI.4.4",
  "When you meet a new word, use the other words around it — the context — as clues to figure out what it means.", READING["context-clues"]),
 ("reading","making-inferences","Making Inferences","RI.4.1",
  "An inference is a smart guess based on clues in the text plus what you already know. The text hints, and you figure out the rest.", READING["making-inferences"]),
 ("reading","authors-purpose","Author's Purpose","RI.4.8",
  "Authors write to persuade, inform, instruct, or entertain. Ask why the author wrote this to find the purpose.", READING["authors-purpose"]),
 ("reading","compare-and-contrast","Compare & Contrast","RI.4.3",
  "Comparing tells how things are alike; contrasting tells how they are different. Words like both signal alike; but and unlike signal different.", READING["compare-and-contrast"]),
 ("reading","fact-and-opinion","Fact vs. Opinion","RI.4.8",
  "A fact can be proven true. An opinion tells what someone feels or believes and can't be proven. Words like best or favorite often signal opinions.", READING["fact-and-opinion"]),
 ("reading","synonyms-and-antonyms","Synonyms & Antonyms","L.4.5",
  "Synonyms are words that mean almost the same thing. Antonyms are words that mean the opposite.", READING["synonyms-and-antonyms"]),
 # ---- WRITING ----
 ("writing","nouns","Nouns","L.4.1",
  "A noun names a person, place, thing, or idea. Common nouns are general (city); proper nouns name a specific one (Paris).", g_nouns),
 ("writing","action-verbs","Action Verbs","L.4.1",
  "A verb shows action or a state of being. Action verbs tell what the subject does, like run, jump, or think.", g_verbs),
 ("writing","adjectives","Adjectives","L.4.1",
  "An adjective describes a noun — telling what kind, how many, or which one, like shiny, three, or that.", g_adjectives),
 ("writing","pronouns","Pronouns","L.4.1",
  "A pronoun takes the place of a noun so we don't repeat it, like he, she, it, we, or they.", g_pronouns),
 ("writing","subject-verb-agreement","Subject-Verb Agreement","L.4.1",
  "The verb must match the subject. A singular subject usually takes a verb ending in -s (The dog runs); a plural subject does not (The dogs run).", g_subject_verb),
 ("writing","past-tense-verbs","Past-Tense Verbs","L.4.1",
  "Past-tense verbs tell about something that already happened. Many add -ed, but some are irregular (go becomes went).", g_past_tense),
 ("writing","plural-nouns","Plural Nouns","L.4.1",
  "Plurals mean more than one. Add -s or -es, change y to -ies after a consonant, and change some f endings to -ves.", g_plurals),
 ("writing","capitalization-proper-nouns","Capitalization","L.4.2",
  "Capitalize the first word of a sentence, the word I, and proper nouns like names of people, places, days, and months.", g_capitalization),
 ("writing","end-punctuation","End Punctuation","L.4.2",
  "End a telling sentence with a period, a question with a question mark, and an excited or strong sentence with an exclamation point.", g_end_punctuation),
 ("writing","commas-in-a-series","Commas in a Series","L.4.2",
  "When you list three or more things, separate them with commas and put 'and' before the last item: apples, oranges, and pears.", g_commas_series),
]


def make_questions(source, rng):
    if callable(source):
        qs = source(rng)
    else:
        qs = build_bank(source, rng)
    assert len(qs) == 10, "every worksheet needs exactly 10 questions"
    for q in qs:
        if q["type"] == "mcq":
            ids = [c["id"] for c in q["choices"]]
            assert q["answer"] in ids, f"bad MCQ answer: {q['prompt']}"
        else:
            assert str(q["answer"]).strip() != "", f"empty fill answer: {q['prompt']}"
    return qs


def build_lesson_steps(name, teach, questions):
    steps = [{"type": "explain", "title": f"About: {name}", "body": teach}]

    ex = questions[0]
    if ex["type"] == "mcq":
        label = next(c["label"] for c in ex["choices"] if c["id"] == ex["answer"])
        body = f"Try this one: {ex['prompt']}\n\nThe correct answer is \"{label}\"."
    else:
        body = f"Try this one: {ex['prompt']}\n\nThe answer is {ex['answer']}."
    steps.append({"type": "worked_example", "title": "Worked example", "body": body})

    # check step: use the first MCQ that isn't the example question, if any
    check = next((q for q in questions[1:] if q["type"] == "mcq"), None)
    if check:
        label = next(c["label"] for c in check["choices"] if c["id"] == check["answer"])
        steps.append({
            "type": "check",
            "title": "Quick check",
            "body": "Pick the best answer.",
            "prompt": check["prompt"],
            "choices": check["choices"],
            "answer": check["answer"],
            "explanation": f"The correct answer is \"{label}\".",
        })
    return steps


def emit():
    out = []
    p = out.append
    p("-- =====================================================================")
    p("-- TopicLeap - Grade 4 full curriculum seed (generated)")
    p("-- 4 subjects x 10 topics, each with a lesson + 10-question worksheet.")
    p("-- Idempotent & non-destructive: re-running never duplicates and never")
    p("-- touches a topic that already has content.")
    p("-- Run AFTER 0001_init.sql, in the Supabase SQL Editor.")
    p("-- =====================================================================\n")

    for slug, name, order in SUBJECTS:
        p(f"insert into public.subjects (slug, name, sort_order) values "
          f"({sql_str(slug)}, {sql_str(name)}, {order})")
        p("on conflict (slug) do update set name = excluded.name, "
          "sort_order = excluded.sort_order;\n")

    # topic order within subject
    order_counter = {}
    for subj_slug, tslug, name, std, teach, source in TOPICS:
        order_counter[subj_slug] = order_counter.get(subj_slug, 0) + 1
        torder = order_counter[subj_slug]
        rng = random.Random(tslug)
        questions = make_questions(source, rng)
        steps = build_lesson_steps(name, teach, questions)
        steps_json = json.dumps(steps, ensure_ascii=True)
        desc = teach

        p(f"-- ---- [{subj_slug}] {name} ({std}) ----")
        # topic
        p("insert into public.topics (subject_id, slug, name, description, "
          "grade_level, standard_code, sort_order)")
        p(f"select s.id, {sql_str(tslug)}, {sql_str(name)}, {sql_str(desc)}, "
          f"{GRADE}, {sql_str(std)}, {torder}")
        p(f"from public.subjects s where s.slug = {sql_str(subj_slug)}")
        p("on conflict (subject_id, grade_level, slug) do update set "
          "name = excluded.name, description = excluded.description, "
          "standard_code = excluded.standard_code, sort_order = excluded.sort_order;")

        # lesson (guarded)
        p("insert into public.lessons (topic_id, title, grade_level, steps, sort_order)")
        p(f"select t.id, {sql_str('Learn: ' + name)}, {GRADE}, "
          f"{sql_str(steps_json)}::jsonb, 0")
        p("from public.topics t join public.subjects s on s.id = t.subject_id")
        p(f"where s.slug = {sql_str(subj_slug)} and t.slug = {sql_str(tslug)} "
          f"and t.grade_level = {GRADE}")
        p("and not exists (select 1 from public.lessons l where l.topic_id = t.id);")

        # worksheet (guarded)
        p("insert into public.worksheets (topic_id, title, grade_level, sort_order)")
        p(f"select t.id, {sql_str(name + ' — Practice')}, {GRADE}, 0")
        p("from public.topics t join public.subjects s on s.id = t.subject_id")
        p(f"where s.slug = {sql_str(subj_slug)} and t.slug = {sql_str(tslug)} "
          f"and t.grade_level = {GRADE}")
        p("and not exists (select 1 from public.worksheets w where w.topic_id = t.id);")

        # questions (guarded per sort_order)
        for i, q in enumerate(questions):
            choices_sql = (sql_str(json.dumps(q["choices"], ensure_ascii=True)) + "::jsonb"
                           if q["choices"] else "null")
            p("insert into public.questions (worksheet_id, grade_level, "
              "question_type, prompt, choices, correct_answer, points, sort_order)")
            p(f"select w.id, {GRADE}, {sql_str(q['type'])}, {sql_str(q['prompt'])}, "
              f"{choices_sql}, {sql_str(str(q['answer']))}, 10, {i}")
            p("from public.worksheets w join public.topics t on t.id = w.topic_id "
              "join public.subjects s on s.id = t.subject_id")
            p(f"where s.slug = {sql_str(subj_slug)} and t.slug = {sql_str(tslug)} "
              f"and t.grade_level = {GRADE}")
            p(f"and not exists (select 1 from public.questions q "
              f"where q.worksheet_id = w.id and q.sort_order = {i});")
        p("")

    return "\n".join(out)


if __name__ == "__main__":
    print(emit())
