#!/usr/bin/env python3
"""
TopicLeap Grade 5 curriculum seed generator.

New for Grade 5:
  * Worksheets get HARDER as they go — questions are produced in 4 difficulty
    bands (Worksheet 1 = easiest ... Worksheet 4 = hardest), since the 20
    questions fill the worksheets in order.
  * NO repeated questions within a topic — every question is de-duplicated.

Math is computed (banded + unique); grammar reuses the shared generators;
science + reading are authored (ordered easy -> hard). 4 subjects x 10 topics
x 20 questions, worksheets of 5.

Usage:
    python3 scripts/generate_grade5.py > supabase/seed/grade5_curriculum.sql
"""
import random
from decimal import Decimal
from fractions import Fraction

from generate_seed import (
    QUESTIONS_PER_TOPIC,
    emit_curriculum,
    fill,
    mcq,
    build_bank,
    g_nouns, g_verbs, g_adjectives, g_pronouns, g_subject_verb,
    g_past_tense, g_plurals, g_capitalization, g_end_punctuation, g_commas_series,
)

NQ = QUESTIONS_PER_TOPIC


def _qkey(q):
    if q["type"] == "mcq":
        return (q["prompt"], tuple(sorted(c["label"] for c in q["choices"])))
    return (q["prompt"], str(q["answer"]))


def gen_unique(make_one, rng, n=NQ, per_band=5):
    """Produce n unique questions; difficulty band = index // per_band so the
    questions ramp up as the worksheets progress."""
    out, seen = [], set()
    for i in range(n):
        band = i // per_band
        for _ in range(800):
            q = make_one(band, rng)
            k = _qkey(q)
            if k not in seen:
                seen.add(k)
                out.append(q)
                break
        else:
            raise RuntimeError(f"no unique question for band {band}")
    return out


def _distractors(correct, candidates, rng, k=3):
    uniq = []
    for c in candidates:
        c = str(c)
        if c != correct and c not in uniq:
            uniq.append(c)
    # safety net: never return fewer than k (keeps mcq() from crashing)
    i = 1
    while len(uniq) < k:
        f = str(i)
        i += 1
        if f != correct and f not in uniq:
            uniq.append(f)
    rng.shuffle(uniq)
    return uniq[:k]


def dstr(d: Decimal) -> str:
    return format(d.normalize(), "f")


# ============================================================ MATH (computed)

def m_mult(band, rng):
    a1, a2, b1, b2 = [(11, 99, 2, 9), (101, 999, 2, 9),
                      (11, 99, 11, 99), (101, 999, 11, 99)][band]
    a, b = rng.randint(a1, a2), rng.randint(b1, b2)
    return fill(f"Multiply: {a} x {b} = ?", a * b)


def m_div(band, rng):
    d1, d2, q1, q2 = [(2, 9, 2, 9), (2, 9, 11, 50),
                      (11, 25, 5, 40), (12, 40, 20, 90)][band]
    d, q = rng.randint(d1, d2), rng.randint(q1, q2)
    return fill(f"Divide: {d * q} / {d} = ?", q)


def m_decimal_pv(band, rng):
    places = [1, 2, 2, 3][band]
    intlen = [1, 1, 2, 3][band]
    intpart = str(rng.randint(1, 10 ** intlen - 1))
    dec = [rng.randint(0, 9) for _ in range(places)]
    if all(x == 0 for x in dec):
        dec[-1] = rng.randint(1, 9)
    numstr = f"{intpart}.{''.join(map(str, dec))}"
    spots = []
    for idx, ch in enumerate(intpart):
        spots.append((int(ch), len(intpart) - 1 - idx))
    for idx, x in enumerate(dec):
        spots.append((x, -(idx + 1)))
    spots = [(dg, e) for dg, e in spots if dg != 0]
    dg, exp = rng.choice(spots)
    correct = dstr(Decimal(dg) * (Decimal(10) ** exp))
    cands = [
        str(dg),
        dstr(Decimal(dg) * (Decimal(10) ** (exp + 1))),
        dstr(Decimal(dg) * (Decimal(10) ** (exp - 1))),
        dstr(Decimal(dg) * Decimal(10)),
    ]
    return mcq(f"What is the value of the digit {dg} in {numstr}?",
               correct, _distractors(correct, cands, rng), rng)


def m_add_sub_decimals(band, rng):
    places = [1, 1, 2, 2][band]
    hi = [20, 80, 80, 300][band]
    scale = Decimal(10) ** places
    a = Decimal(rng.randint(1, hi * 10 ** (places - 1) + 5)) / scale
    b = Decimal(rng.randint(1, hi * 10 ** (places - 1) + 5)) / scale
    if band >= 2 and rng.random() < 0.5:
        if b > a:
            a, b = b, a
        correct = a - b
        op = "-"
    else:
        correct = a + b
        op = "+"
    cands = [dstr(correct + Decimal("0.1")), dstr(correct - Decimal("0.1")),
             dstr(a), dstr(correct + (Decimal(1) / scale))]
    return mcq(f"{dstr(a)} {op} {dstr(b)} = ?", dstr(correct),
               _distractors(dstr(correct), cands, rng), rng)


def m_mult_decimals(band, rng):
    specs = [(1, 9, 1, 1), (1, 9, 1, 2), (1, 20, 2, 1), (1, 20, 2, 2)][band]
    a = Decimal(rng.randint(specs[0], specs[1])) / (Decimal(10) ** specs[2])
    b = Decimal(rng.randint(1, 9)) / (Decimal(10) ** specs[3])
    correct = a * b
    cands = [dstr(correct * 10), dstr(correct / 10),
             dstr(a * b * 100), dstr(correct + Decimal("0.1"))]
    return mcq(f"{dstr(a)} x {dstr(b)} = ?", dstr(correct),
               _distractors(dstr(correct), cands, rng), rng)


def _fstr(f: Fraction) -> str:
    return str(f.numerator) if f.denominator == 1 else f"{f.numerator}/{f.denominator}"


def m_add_sub_fractions(band, rng):
    pools = [[2, 3, 4], [2, 3, 4, 6], [3, 4, 6, 8], [4, 6, 8, 10, 12]][band]
    b, d = rng.sample(pools, 2)
    a = rng.randint(1, b - 1)
    c = rng.randint(1, d - 1)
    if band >= 2 and rng.random() < 0.5:
        f1, f2 = Fraction(a, b), Fraction(c, d)
        if f2 > f1:
            f1, f2 = f2, f1
            a, b, c, d = f1.numerator, f1.denominator, f2.numerator, f2.denominator
        correct = Fraction(a, b) - Fraction(c, d)
        op = "-"
    else:
        correct = Fraction(a, b) + Fraction(c, d)
        op = "+"
    wrong = [
        f"{a + c}/{b + d}",
        _fstr(Fraction(a * d + c * b, b * d)) if op == "+" else _fstr(Fraction(abs(a * d - c * b), b * d)),
        f"{a + c}/{b * d}",
    ]
    return mcq(f"{a}/{b} {op} {c}/{d} = ?", _fstr(correct),
               _distractors(_fstr(correct), wrong, rng), rng)


def m_mult_fractions(band, rng):
    pools = [[2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6], [4, 5, 6, 8]][band]
    b = rng.choice(pools)
    d = rng.choice(pools)
    a = rng.randint(1, b - 1)
    c = rng.randint(1, d - 1)
    correct = Fraction(a, b) * Fraction(c, d)
    wrong = [f"{a * c}/{b + d}", f"{a + c}/{b * d}", _fstr(Fraction(a * c + 1, b * d))]
    return mcq(f"{a}/{b} x {c}/{d} = ?", _fstr(correct),
               _distractors(_fstr(correct), wrong, rng), rng)


def m_order_ops(band, rng):
    if band == 0:
        a, b, c = rng.randint(2, 9), rng.randint(2, 9), rng.randint(2, 9)
        expr, val = f"{a} + {b} x {c}", a + b * c
    elif band == 1:
        a, b, c = rng.randint(2, 9), rng.randint(2, 9), rng.randint(2, 9)
        expr, val = f"({a} + {b}) x {c}", (a + b) * c
    elif band == 2:
        a, b, c, d = rng.randint(3, 9), rng.randint(3, 9), rng.randint(2, 6), rng.randint(2, 6)
        if a * b < c * d:
            a, b, c, d = c, d, a, b
        expr, val = f"{a} x {b} - {c} x {d}", a * b - c * d
    else:
        a, b, c, d = rng.randint(4, 12), rng.randint(2, 9), rng.randint(2, 9), rng.randint(1, 9)
        expr, val = f"{a} + {b} x {c} - {d}", a + b * c - d
    return fill(f"Solve using order of operations:  {expr} = ?", val)


def m_powers_of_ten(band, rng):
    if band <= 2:
        k = [10, 100, 1000][band]
        n = rng.randint(2, 99)
        return fill(f"{n} x {k} = ?", n * k)
    k = rng.choice([10, 100])
    q = rng.randint(2, 99)
    return fill(f"{q * k} / {k} = ?", q)


def m_volume(band, rng):
    hi = [4, 6, 9, 12][band]
    lo = [2, 2, 3, 4][band]
    l, w, h = (rng.randint(lo, hi) for _ in range(3))
    return fill(f"A box is {l} units long, {w} wide, and {h} tall. "
                f"What is its volume in cubic units?  (length x width x height)",
                l * w * h)


def G(make_one):
    return lambda rng: gen_unique(make_one, rng)


# ============================================== SCIENCE (authored, NGSS gr. 5)
# Each bank is 20 DISTINCT questions, roughly ordered easy -> hard.

SCIENCE5 = {
"matter-and-properties": [
 ("mcq","Everything around us that has mass and takes up space is called:","matter",["energy","light","sound"]),
 ("mcq","The three common states of matter are solid, liquid, and:","gas",["metal","plastic","light"]),
 ("mcq","Which is a property you can measure about matter?","mass",["happiness","name","price"]),
 ("mcq","Even a gas like air is made of tiny particles too small to:","see",["weigh ever","exist","move"]),
 ("mcq","A balloon filled with air shows that gas has:","mass and takes up space",["no mass at all","no volume","color only"]),
 ("mcq","Which tool measures the mass of an object?","a balance",["a ruler","a thermometer","a clock"]),
 ("mcq","Matter is made of extremely small building blocks called:","particles (atoms/molecules)",["pixels","cells only","waves"]),
 ("mcq","Which property could help you identify a mystery material?","its hardness and how it reacts",["the day you found it","its owner","its price"]),
 ("mcq","A substance that is shiny, bends, and conducts electricity is most likely a:","metal",["gas","liquid only","plastic"]),
 ("mcq","Two materials can look the same but be told apart by testing their:","properties",["names","ages","colors only"]),
 ("mcq","If you cool a gas enough, it can become a:","liquid",["solid metal instantly","new element","beam of light"]),
 ("mcq","The amount of space matter takes up is its:","volume",["mass","weight","color"]),
 ("mcq","Why does a rock sink but a cork floats in water?","they have different densities",["the rock is alive","cork is metal","water hates rocks"]),
 ("mcq","Which is NOT a physical property of matter?","its favorite season",["color","texture","mass"]),
 ("mcq","Particles in a solid are packed tightly and:","vibrate in place",["move freely apart","disappear","are not there"]),
 ("fill","Anything that has mass and takes up space is ____. (one word)","matter"),
 ("mcq","Magnetism is a property that lets us identify materials that contain:","iron",["plastic","glass","wood"]),
 ("mcq","Boiling point and melting point are properties that:","help identify a substance",["change its name","make it heavier","are random"]),
 ("mcq","Which best shows that air (a gas) has mass?","a basketball weighs more when pumped up",["air is invisible","air is everywhere","you can breathe it"]),
 ("mcq","Density compares an object's mass to its:","volume",["color","age","name"]),
],
"mixtures-and-solutions": [
 ("mcq","When you stir sand into water, you make a:","mixture",["new element","pure substance","gas"]),
 ("mcq","When sugar dissolves completely in water, it forms a:","solution",["solid","gas","new metal"]),
 ("mcq","In a solution, the dissolved substance seems to:","disappear (spread evenly)",["float on top","sink as chunks","turn to gas"]),
 ("mcq","Which mixture can be separated by a strainer or filter?","sand and water",["salt fully dissolved in water","sugar water","air"]),
 ("mcq","How can you separate salt from salt water?","let the water evaporate",["use a magnet","use a strainer","freeze it once"]),
 ("mcq","A magnet can be used to separate iron filings from:","sand",["salt water","sugar","air"]),
 ("mcq","Mixing two things does NOT make a new substance — the parts:","keep their own properties",["vanish forever","become an element","explode"]),
 ("mcq","Which dissolves best in warm water?","sugar",["a rock","a coin","a marble"]),
 ("mcq","Stirring and heating usually make a solid dissolve:","faster",["slower","never","into metal"]),
 ("mcq","A salad is an example of a mixture because you can still:","see and separate the parts",["not separate it","turn it to gas","make an element"]),
 ("mcq","To get clean water from muddy water, you could first:","filter it",["add salt","freeze and forget it","use a magnet"]),
 ("mcq","The part that gets dissolved (like sugar) is called the:","solute",["solvent","filter","magnet"]),
 ("mcq","The liquid that does the dissolving (like water) is the:","solvent",["solute","mixture","filter"]),
 ("mcq","Iron filings, sand, and salt mixed together can be separated using a magnet, water, and:","evaporation",["a microwave only","a magnet only","nothing"]),
 ("mcq","Which is a solution?","salt water",["sand and pebbles","oil and water","a fruit salad"]),
 ("fill","When sugar dissolves evenly in water, the result is a ____. (one word)","solution"),
 ("mcq","Oil and water poured together will:","separate into layers",["form a solution","make a metal","disappear"]),
 ("mcq","Evaporating a solution leaves behind the:","dissolved solid",["water only","nothing","a gas"]),
 ("mcq","Chromatography separates the colors in ink, showing ink is a:","mixture of colors",["single pure color","metal","gas"]),
 ("mcq","Which property helps separate a mixture of iron and salt?","iron is magnetic",["salt is magnetic","both float","both are gases"]),
],
"conservation-of-matter": [
 ("mcq","When you mix two things, the total mass:","stays the same",["disappears","always doubles","becomes zero"]),
 ("mcq","If 50 g of water freezes into ice, the ice weighs about:","50 g",["0 g","100 g","5 g"]),
 ("mcq","Matter is never created or destroyed in ordinary changes — it is:","conserved",["deleted","invented","ignored"]),
 ("mcq","When sugar dissolves in water, the mass of the solution equals:","sugar + water",["just the water","just the sugar","zero"]),
 ("mcq","If ice melts in a sealed cup, the water's mass is:","the same as the ice",["less","more","zero"]),
 ("mcq","Burning a log seems to lose mass, but the gases released still count, so matter is:","conserved",["destroyed","created","gone"]),
 ("mcq","Cutting paper into pieces changes its shape but not its total:","mass",["color forever","existence","element"]),
 ("mcq","100 g of clay molded into a new shape now has a mass of:","100 g",["0 g","200 g","10 g"]),
 ("mcq","In a closed container, a chemical change keeps the total mass:","unchanged",["lower","higher","at zero"]),
 ("mcq","If you combine 20 g and 30 g of liquids that mix, the result is:","50 g",["10 g","60 g","0 g"]),
 ("mcq","When water evaporates from an open dish, the water:","became a gas (still exists)",["was destroyed","turned to nothing","became a solid"]),
 ("mcq","A sealed bag of fizzing tablets and water keeps the same mass because the gas:","stays trapped inside",["escapes and is gone","is created","weighs nothing"]),
 ("mcq","Conservation of matter means atoms are:","rearranged, not lost",["destroyed","created from nothing","made of light"]),
 ("mcq","If a plant grows bigger, most of its new mass comes from:","air and water",["the soil disappearing","nothing","magic"]),
 ("mcq","Rust forms on iron; the rusty iron actually weighs:","a bit more (it combined with oxygen)",["less","nothing","zero"]),
 ("fill","In ordinary changes, the total amount of matter is ____ (stays the same). (one word)","conserved"),
 ("mcq","Mixing baking soda and vinegar in an open cup seems to lose mass because:","a gas escapes into the air",["matter is destroyed","mass is fake","the cup eats it"]),
 ("mcq","If you weigh reactants before and products after in a sealed jar, they are:","equal",["very different","always less after","always more after"]),
 ("mcq","A melted then re-frozen ice cube has:","the same mass as before",["less mass","more mass","no mass"]),
 ("mcq","The idea that matter can't just vanish is the law of:","conservation of matter",["gravity","motion","reflection"]),
],
"food-webs-and-energy": [
 ("mcq","Almost all the energy in an ecosystem starts with the:","Sun",["soil","wind","Moon"]),
 ("mcq","Plants are called producers because they:","make their own food",["eat animals","eat other plants","make soil"]),
 ("mcq","An animal that eats plants is a:","herbivore",["carnivore","producer","decomposer"]),
 ("mcq","An animal that eats other animals is a:","carnivore",["herbivore","producer","plant"]),
 ("mcq","In a food chain, an arrow points in the direction that:","energy flows",["animals walk","the wind blows","water falls"]),
 ("mcq","Decomposers like fungi and bacteria break down dead things and return nutrients to the:","soil",["sky","Sun","ocean only"]),
 ("mcq","A food web shows that most animals eat:","more than one kind of food",["only one food","no food","only sunlight"]),
 ("mcq","If the plants in an area die, the animals that eat them will:","have less food",["get more food","not be affected","make their own food"]),
 ("mcq","Energy passes from the Sun to plants to animals through:","food",["wind","sound","light only"]),
 ("mcq","An animal that eats both plants and animals is an:","omnivore",["herbivore","carnivore","producer"]),
 ("mcq","In the food chain grass -> rabbit -> fox, the rabbit is the:","plant-eater (herbivore)",["producer","top predator","decomposer"]),
 ("mcq","Removing the top predator from a food web can cause prey to:","increase a lot",["disappear","become plants","stop eating"]),
 ("mcq","Most of the energy is lost as heat at each step, so food chains usually have only a:","few links",["hundred links","no links","one animal only"]),
 ("mcq","Which gets its energy WITHOUT eating other organisms?","a green plant",["a wolf","a hawk","a frog"]),
 ("mcq","Mushrooms growing on a dead log are acting as:","decomposers",["producers","predators","herbivores"]),
 ("fill","An organism that makes its own food, like a plant, is a ____. (one word)","producer"),
 ("mcq","If a pond loses its algae, the tiny animals that eat algae will:","struggle to survive",["thrive","become algae","make sunlight"]),
 ("mcq","A food web is more realistic than a food chain because it shows:","many connected food paths",["only one path","no animals","only plants"]),
 ("mcq","The original source of energy for a deep food web is still the:","Sun",["biggest animal","soil","Moon"]),
 ("mcq","Scavengers like vultures help an ecosystem by eating:","dead animals",["living plants only","rocks","sunlight"]),
],
"plants-make-food": [
 ("mcq","Plants make their own food using sunlight in a process called:","photosynthesis",["digestion","erosion","evaporation"]),
 ("mcq","Most of the material a plant uses to grow comes from:","air and water",["the soil disappearing","rocks","animals"]),
 ("mcq","Plants take in carbon dioxide from the air through tiny openings in their:","leaves",["roots","flowers","seeds"]),
 ("mcq","During photosynthesis, plants release which gas that we breathe?","oxygen",["carbon dioxide","helium","smoke"]),
 ("mcq","The green substance in leaves that captures sunlight is:","chlorophyll",["water","sugar","soil"]),
 ("mcq","Plants store the energy they make as:","sugar (food)",["sunlight","oxygen","water"]),
 ("mcq","Roots mainly take in:","water and minerals",["sunlight","oxygen for food","carbon dioxide"]),
 ("mcq","A plant kept in the dark cannot:","make food",["take in water","have roots","have leaves"]),
 ("mcq","The gas plants take IN for photosynthesis is:","carbon dioxide",["oxygen","helium","nitrogen only"]),
 ("mcq","Surprisingly, most of a tree's added mass comes from:","carbon dioxide in the air",["the soil it sits in","the water alone","sunlight as matter"]),
 ("mcq","Photosynthesis happens mostly in the plant's:","leaves",["roots","bark","seeds"]),
 ("mcq","Animals depend on plants because plants provide food and:","oxygen",["plastic","metal","gasoline"]),
 ("mcq","Sunlight, water, and carbon dioxide are the ingredients plants use to make:","sugar and oxygen",["soil and rocks","plastic","rain"]),
 ("mcq","Which is NOT needed for photosynthesis?","darkness",["sunlight","water","carbon dioxide"]),
 ("mcq","When you eat a plant, you are getting energy that originally came from the:","Sun",["soil","wind","Moon"]),
 ("fill","The process a plant uses to make food from sunlight is called ____. (one word)","photosynthesis"),
 ("mcq","Why are most leaves flat and broad?","to catch more sunlight",["to hold the plant down","to store seeds","to make noise"]),
 ("mcq","Plants help reduce a greenhouse gas by taking in:","carbon dioxide",["oxygen","helium","water vapor only"]),
 ("mcq","The sugar a plant makes is used for energy and to:","build new plant parts",["make soil","make rain","make rocks"]),
 ("mcq","If all green plants vanished, animals would lose their main source of:","food and oxygen",["water only","sunlight","soil"]),
],
"earth-systems": [
 ("mcq","The layer of air surrounding Earth is the:","atmosphere",["geosphere","hydrosphere","biosphere"]),
 ("mcq","All of Earth's water — oceans, rivers, ice — makes up the:","hydrosphere",["atmosphere","geosphere","biosphere"]),
 ("mcq","Earth's rocks, soil, and land form the:","geosphere",["atmosphere","hydrosphere","biosphere"]),
 ("mcq","All living things on Earth make up the:","biosphere",["atmosphere","geosphere","hydrosphere"]),
 ("mcq","When rain (hydrosphere) helps a plant (biosphere) grow, two Earth systems are:","interacting",["disappearing","stopping","unrelated"]),
 ("mcq","Wind in the atmosphere shaping a sand dune shows the atmosphere affecting the:","geosphere",["biosphere only","nothing","Moon"]),
 ("mcq","Plants taking in water from the soil connects the biosphere to the:","hydrosphere and geosphere",["atmosphere only","Moon","Sun core"]),
 ("mcq","A volcano sends gas into the air — the geosphere is affecting the:","atmosphere",["nothing","Moon","hydrosphere only"]),
 ("mcq","Earth's four systems are atmosphere, hydrosphere, geosphere, and:","biosphere",["stratosphere","exosphere","ionosphere"]),
 ("mcq","Animals breathing connects the biosphere to the:","atmosphere",["geosphere only","Moon","Sun"]),
 ("mcq","Ocean water evaporating into clouds links the hydrosphere to the:","atmosphere",["geosphere only","biosphere only","Moon"]),
 ("mcq","Tree roots breaking apart rock shows the biosphere changing the:","geosphere",["atmosphere","hydrosphere","Sun"]),
 ("mcq","Which system would a fish swimming in a lake belong to (the living part)?","biosphere",["hydrosphere","geosphere","atmosphere"]),
 ("mcq","A landslide (geosphere) dumping soil into a river affects the:","hydrosphere",["atmosphere only","Sun","Moon"]),
 ("mcq","Earth's systems are connected, so a change in one often:","affects the others",["affects nothing","stops Earth","is impossible"]),
 ("fill","All of Earth's living things together make up the ____. (one word)","biosphere"),
 ("mcq","Clouds, wind, and rain are events happening in the:","atmosphere",["geosphere","biosphere","core"]),
 ("mcq","Soil forms when rock (geosphere) is broken down with help from water and:","living things",["sunlight only","the Moon","wind only"]),
 ("mcq","A coral reef is part of the biosphere living within the:","hydrosphere",["atmosphere","geosphere core","Sun"]),
 ("mcq","Studying how Earth's systems interact helps us understand:","weather, land, and life changes",["other galaxies only","the alphabet","math facts"]),
],
"water-on-earth": [
 ("mcq","About what fraction of Earth's water is salty ocean water?","most of it",["almost none","exactly half is fresh","none"]),
 ("mcq","Most of Earth's FRESH water is frozen in:","ice caps and glaciers",["oceans","clouds","lakes only"]),
 ("mcq","Which is fresh water people can drink (when clean)?","river and lake water",["ocean water","sea water","salty bay water"]),
 ("mcq","Only a small amount of Earth's water is fresh water that is:","easy to use (liquid)",["salty","frozen forever only","in space"]),
 ("mcq","Ocean water is not good for drinking because it is too:","salty",["cold","clean","fresh"]),
 ("mcq","Underground water stored in soil and rock is called:","groundwater",["ocean water","cloud water","glacier ice"]),
 ("mcq","Because fresh, usable water is limited, it is important to:","conserve it",["waste it","pour it out","ignore it"]),
 ("mcq","Which holds the largest amount of water on Earth?","oceans",["rivers","lakes","clouds"]),
 ("mcq","Glaciers and ice caps are mostly found:","near the poles and high mountains",["at the equator beaches","in deserts","in cities"]),
 ("mcq","Turning salty ocean water into drinkable water is called:","desalination",["evaporation only","pollution","freezing"]),
 ("mcq","A model shows oceans as 97% and fresh water as about:","3%",["50%","80%","0%"]),
 ("mcq","Which uses fresh water?","drinking and farming",["only swimming in the sea","nothing","only ships"]),
 ("mcq","Why is protecting rivers and lakes important?","they are key fresh-water sources",["they are salty","no one uses them","they are in space"]),
 ("mcq","Most liquid fresh water that people use comes from rivers, lakes, and:","groundwater",["the ocean","glaciers melting only","rain in the sea"]),
 ("mcq","If a town pollutes its only river, the people may run short of:","clean fresh water",["salt","ice","air"]),
 ("fill","Water that is not salty and that we can drink is called ____ water. (one word)","fresh"),
 ("mcq","The water cycle keeps moving water between the oceans, air, and:","land",["space","the Sun","the Moon"]),
 ("mcq","Which is the best way to save fresh water at home?","turn off the tap while brushing",["leave the hose running","take very long showers","pour water on the road"]),
 ("mcq","Polar ice caps store fresh water as:","solid ice",["salty liquid","steam","sand"]),
 ("mcq","Because so little water is usable fresh water, clean water is a precious:","resource",["toy","color","sound"]),
],
"protecting-resources": [
 ("mcq","Using fewer resources and reusing items helps:","protect the environment",["waste more","pollute more","use up oil faster"]),
 ("mcq","The three R's that reduce waste are reduce, reuse, and:","recycle",["remove","ruin","rush"]),
 ("mcq","Which is a renewable energy source?","sunlight",["coal","oil","natural gas"]),
 ("mcq","Burning fossil fuels like coal and oil adds pollution and:","greenhouse gases",["clean air","fresh water","oxygen"]),
 ("mcq","Planting trees helps because trees clean the air and provide:","oxygen and habitat",["plastic","gasoline","metal"]),
 ("mcq","Which action best conserves water?","fixing leaky faucets",["letting taps run","watering pavement","ignoring leaks"]),
 ("mcq","Recycling paper helps protect:","forests (trees)",["oceans of oil","the Sun","metal mines only"]),
 ("mcq","Wind and solar power are better for the air than fossil fuels because they create:","little or no pollution",["more smog","more oil","more coal"]),
 ("mcq","Throwing trash in rivers and oceans harms:","water animals and plants",["only rocks","nothing","the Moon"]),
 ("mcq","Which is a way individuals can reduce pollution?","ride a bike or walk",["burn more trash","leave lights on","waste paper"]),
 ("mcq","Protecting habitats helps keep many kinds of living things, called:","biodiversity",["pollution","erosion","traffic"]),
 ("mcq","A nonrenewable resource is one that:","can run out",["never runs out","grows back fast","is unlimited"]),
 ("mcq","Composting food scraps helps by:","returning nutrients to soil and cutting trash",["making more garbage","polluting water","wasting food"]),
 ("mcq","Turning off lights and devices you aren't using conserves:","energy",["water","trees","air"]),
 ("mcq","Which choice is most eco-friendly for shopping?","bring a reusable bag",["take many plastic bags","double-bag everything","litter the receipt"]),
 ("fill","To reduce, reuse, and ____ are the three R's of cutting waste. (one word)","recycle"),
 ("mcq","Oil spills in the ocean are harmful because they:","poison and coat sea life",["help fish breathe","clean the water","make more fish"]),
 ("mcq","Communities protect water by treating sewage and limiting:","pollution",["clean water","fresh air","sunlight"]),
 ("mcq","Which is the most sustainable way to get electricity?","solar and wind",["burning more coal","burning more oil","burning trash only"]),
 ("mcq","Caring for Earth's resources helps make sure they last for:","future generations",["nobody","only today","robots only"]),
],
"patterns-in-the-sky": [
 ("mcq","The Sun appears to rise in the east and set in the:","west",["north","south","ground"]),
 ("mcq","Day and night are caused by Earth:","rotating (spinning) once a day",["orbiting the Sun once a year","stopping","growing"]),
 ("mcq","The seasons are caused by Earth's tilt as it:","orbits the Sun",["spins once a day","stops","shrinks"]),
 ("mcq","Stars appear to move across the night sky because Earth:","is rotating",["is exploding","is shrinking","makes the stars"]),
 ("mcq","A shadow from a stick is longest when the Sun is:","low in the sky",["directly overhead","gone","behind the Moon"]),
 ("mcq","At noon, when the Sun is highest, shadows are:","shortest",["longest","gone forever","pointing up"]),
 ("mcq","The changing shapes of the Moon over a month are called the Moon's:","phases",["seasons","shadows","stars"]),
 ("mcq","One full set of Moon phases takes about:","a month",["a day","a year","an hour"]),
 ("mcq","Different stars are visible in different seasons because Earth:","orbits the Sun",["spins faster","stops","makes stars"]),
 ("mcq","The Sun is actually a:","star",["planet","moon","comet"]),
 ("mcq","Some stars look brighter than others mainly because of their size and:","distance from Earth",["color of light only","temperature on Earth","the day of the week"]),
 ("mcq","A sundial tells time using the position of a:","shadow",["star","cloud","raindrop"]),
 ("mcq","We always see the same side of the Moon because of how it:","spins as it orbits Earth",["stops spinning","explodes","hides"]),
 ("mcq","The pattern of day length changes with the seasons: summer days are:","longer",["shorter","the same","gone"]),
 ("mcq","Because these sky events repeat in patterns, we can:","predict them",["never know them","stop them","create them"]),
 ("fill","The repeating changes in the Moon's appearance are called its ____. (one word)","phases"),
 ("mcq","The North Star appears to stay nearly still because it is near Earth's:","axis (line of spin)",["equator","ocean","core only"]),
 ("mcq","Earth takes about 365 days to make one:","orbit around the Sun",["spin","Moon phase","day"]),
 ("mcq","A solar eclipse happens when the Moon passes between Earth and the:","Sun",["Moon","stars","North Star"]),
 ("mcq","Constellations are patterns of:","stars",["clouds","planets only","comets"]),
],
"gravity": [
 ("mcq","The force that pulls objects toward Earth is:","gravity",["friction","magnetism","wind"]),
 ("mcq","When you drop a ball, gravity pulls it:","down toward Earth's center",["up to the sky","sideways","apart"]),
 ("mcq","Gravity is what keeps the Moon in orbit around:","Earth",["the Sun only","Mars","nothing"]),
 ("mcq","Without gravity, objects on Earth would:","float away",["fall faster","stay the same","get heavier"]),
 ("mcq","Weight is a measure of the pull of ____ on an object.","gravity",["friction","sound","light"]),
 ("mcq","Earth's gravity points toward Earth's:","center",["the sky","the Moon","the Sun"]),
 ("mcq","Astronauts seem to float in orbit because they are in:","continuous free fall around Earth",["a place with no gravity at all","outer galaxies","a magnet field"]),
 ("mcq","Which falls because of gravity?","a dropped apple",["a balloon rising in air","smoke going up","a floating bubble going up"]),
 ("mcq","Gravity also holds the planets in orbit around the:","Sun",["Moon","North Star","Earth"]),
 ("mcq","On the Moon, gravity is weaker, so you would weigh:","less than on Earth",["more","exactly the same","nothing at all"]),
 ("mcq","A ball thrown up comes back down because gravity:","pulls it back toward Earth",["pushes it away","disappears","turns to friction"]),
 ("mcq","The direction we call 'down' is really the direction of Earth's:","gravity",["rotation","magnetism","wind"]),
 ("mcq","Heavier and lighter objects dropped together (no air) hit the ground:","at the same time",["heavier first always","lighter first","never"]),
 ("mcq","Gravity gets weaker as objects get:","farther apart",["closer","heavier","colder"]),
 ("mcq","What keeps the oceans and atmosphere on Earth?","gravity",["wind","sunlight","the Moon only"]),
 ("fill","The force that pulls everything toward Earth is ____. (one word)","gravity"),
 ("mcq","A skydiver falls because the force of gravity is greater than the:","air resistance (at first)",["sunlight","sound","magnetism"]),
 ("mcq","More massive objects, like planets, have:","stronger gravity",["no gravity","weaker gravity than a pebble","gravity made of light"]),
 ("mcq","Why don't we fall off the 'bottom' of the round Earth?","gravity pulls us toward the center everywhere",["we are glued","there is no bottom person","the air holds us"]),
 ("mcq","The Sun's strong gravity keeps Earth:","orbiting it",["spinning only","cold","still"]),
],
}


# ================================================= READING (authored, grade 5)

READING5 = {
"main-idea-and-details": [
 ("mcq","Read: \"Sea otters are vital to kelp forests. They eat sea urchins, which would otherwise destroy the kelp.\" The main idea is that sea otters:","help protect kelp forests",["are cute","sleep in water","are large"]),
 ("mcq","Read: \"Volcanoes can be destructive, but volcanic ash also enriches soil and creates fertile farmland.\" The main idea is that volcanoes:","can be both harmful and helpful",["are always safe","never erupt","are tiny"]),
 ("mcq","In the otter passage, which is a supporting detail?","they eat sea urchins",["the ocean is blue","otters are mammals","kelp is green"]),
 ("mcq","Read: \"Recycling conserves resources by saving trees, reducing energy use, and cutting landfill waste.\" A supporting detail is that recycling:","reduces energy use",["is colorful","is difficult","is loud"]),
 ("mcq","The main idea of a paragraph is usually:","its most important point",["the longest sentence","the first word","a random fact"]),
 ("mcq","Read: \"Honeybee numbers are falling due to pesticides, disease, and habitat loss, threatening the crops they pollinate.\" The main idea is that:","declining bees endanger our crops",["bees make honey","bees sting","flowers are pretty"]),
 ("mcq","Supporting details in a text are there to:","explain or back up the main idea",["distract the reader","end the story","list the title"]),
 ("mcq","Read: \"The Great Barrier Reef hosts thousands of species, but warming oceans are bleaching its coral.\" The main idea is that the reef:","is rich in life but under threat",["is small","has no animals","is on land"]),
 ("mcq","Which sentence would best support the main idea 'exercise improves health'?","It strengthens the heart and muscles.",["Gyms can be crowded.","Shoes come in many colors.","Mornings are early."]),
 ("mcq","Read: \"Migratory birds travel thousands of miles, using stars, the sun, and Earth's magnetic field to navigate.\" The main idea is that migratory birds:","navigate huge distances using natural cues",["are colorful","build nests","eat seeds"]),
 ("mcq","A detail that does NOT support the main idea is called:","irrelevant",["essential","central","the topic"]),
 ("mcq","Read: \"Ancient Egyptians built pyramids as tombs, using ramps, levers, and thousands of workers.\" A key detail is that they used:","ramps and levers",["cars","electric cranes","helicopters"]),
 ("mcq","To find the main idea, ask yourself:","what is this mostly about?",["how long is it?","who printed it?","what is the last word?"]),
 ("mcq","Read: \"Coral reefs protect coastlines, support fisheries, and may hold new medicines.\" The main idea is that coral reefs:","are valuable in many ways",["are only pretty","are useless","are dry"]),
 ("mcq","Two paragraphs about the same topic together support the text's:","central (main) idea",["page number","author bio","glossary"]),
 ("fill","The most important point a passage makes is its ____ idea. (one word)","main"),
 ("mcq","Read: \"Rainforests produce much of Earth's oxygen, yet they are being cut down rapidly.\" The main idea is that rainforests:","are important but threatened",["are dry","are useless","never change"]),
 ("mcq","A strong summary of a text focuses on the main idea and the:","most important details",["smallest details","author's name","page count"]),
 ("mcq","Read: \"Wolves reintroduced to Yellowstone reshaped the whole ecosystem, even changing rivers.\" The main idea is that wolves:","had wide effects on the ecosystem",["are scary","are large","howl loudly"]),
 ("mcq","Which best states a main idea?","Pollinators are essential to our food supply.",["Bees have six legs.","Some flowers are yellow.","It was a sunny day."]),
],
"theme": [
 ("mcq","A theme is the:","lesson or message of a story",["setting","main character's name","title"]),
 ("mcq","Read: \"After failing many times, Mia finally built her robot by never giving up.\" A theme is:","perseverance pays off",["robots are easy","never try","give up early"]),
 ("mcq","A story where a selfish king learns to share teaches a theme about:","generosity / kindness",["greed is good","kings are tall","castles are old"]),
 ("mcq","Theme is different from plot because theme is the:","underlying message",["sequence of events",  "list of characters","the setting only"]),
 ("mcq","Read: \"The two rivals worked together to survive the storm and became friends.\" A theme is:","cooperation / friendship",["enemies forever","storms are fun","ignore others"]),
 ("mcq","A common theme in many fables is:","honesty is important",["lying wins","be cruel","never learn"]),
 ("mcq","To find a theme, look at what the characters:","learn or how they change",["are named","wear","eat for lunch"]),
 ("mcq","Read: \"Even though everyone doubted her, Ana stayed true to herself and succeeded.\" The theme is about:","believing in yourself",["following the crowd","quitting","cheating"]),
 ("mcq","A theme is usually stated:","indirectly, through the story",["in the title only","in the page number","never at all"]),
 ("mcq","Read: \"The boy shared his last bread with a stranger, who later saved his life.\" A theme is:","kindness comes back to you",["keep everything","strangers are bad","never share"]),
 ("mcq","Which is a theme, not a topic?","Courage can overcome fear.",["dragons","a forest","a knight"]),
 ("mcq","Two different stories can share the same theme, such as:","love conquers hardship",["the same exact words","the same author always","the same page count"]),
 ("mcq","Read: \"Despite losing the race, Sam was proud he had done his best.\" The theme is:","effort matters more than winning",["winning is everything","never race","cheat to win"]),
 ("mcq","A theme often applies:","to real life beyond the story",["only to that one page","to the title font","to nothing"]),
 ("mcq","Read: \"The villagers ignored warnings and lost their crops to the flood.\" A theme is:","heeding warnings / responsibility",["ignore advice","floods are fun","crops are boring"]),
 ("fill","The message or lesson of a story is its ____. (one word)","theme"),
 ("mcq","Read: \"She forgave her friend's mistake, and their bond grew stronger.\" The theme is about:","forgiveness",["revenge","greed","fear"]),
 ("mcq","Which question helps you find a theme?","What did the character learn?",["How many pages?","What is the cover color?","Who published it?"]),
 ("mcq","A story showing that working hard leads to success has a theme of:","hard work / determination",["luck only","laziness","giving up"]),
 ("mcq","Read: \"The proud lion needed the tiny mouse's help, learning everyone matters.\" The theme is:","even the small can help",["the strong need no one","mice are pests","be proud always"]),
],
"summarizing": [
 ("mcq","A good summary includes the main idea and the:","most important details",["every tiny detail","your opinion","a new ending"]),
 ("mcq","A summary should be:","shorter than the original",["longer than the original","exactly the same","just the title"]),
 ("mcq","When summarizing, you should leave out:","unimportant details",["the main idea","all the events","the topic"]),
 ("mcq","A summary should be written in:","your own words",["the author's exact words","a secret code","no words"]),
 ("mcq","The first step to summarizing is to:","identify the main idea",["copy the whole text","read only the title","skip to the end"]),
 ("mcq","A summary of a story should keep events in:","the correct order",["random order","reverse only","no order"]),
 ("mcq","Adding your own opinion to a summary makes it:","no longer a true summary",["better always","longer correctly","more accurate"]),
 ("mcq","Read: \"A long article explains how bees pollinate, make honey, and live in colonies.\" A good summary mentions:","pollination, honey, and colonies",["the font size","the author's pet","one random sentence"]),
 ("mcq","Summarizing helps you:","understand and remember a text",["forget the text","make it longer","change the facts"]),
 ("mcq","A summary of a how-to article should capture the:","key steps",["every word","none of the steps","only the title"]),
 ("mcq","Which is the best summary of 'The hungry fox tried many times to reach grapes, failed, and walked away calling them sour'?","A fox failed to get grapes and pretended he didn't want them.",["A fox liked grapes.","Grapes are sour.","Foxes are orange."]),
 ("mcq","A retelling that includes every detail is:","too long to be a summary",["a perfect summary","required","best"]),
 ("mcq","When you summarize nonfiction, focus on:","main idea and key facts",["made-up parts","your feelings","the page number"]),
 ("mcq","A summary and the original text should have the same:","main idea",["length","exact wording","number of pages"]),
 ("mcq","To shorten a paragraph into a summary, you:","combine ideas and drop minor details",["add more sentences","repeat it twice","copy it"]),
 ("fill","A short retelling of a text's main points, in your own words, is a ____. (one word)","summary"),
 ("mcq","Which detail would you leave OUT of a summary about a soccer game's result?","the color of the referee's socks",["the final score","who won","the key goal"]),
 ("mcq","A summary should answer mainly:","what happened and why it matters",["how you felt only","the publisher","the price"]),
 ("mcq","Good summarizers reread to make sure they captured the:","most important ideas",["least important ideas","longest words","page numbers"]),
 ("mcq","A one-sentence summary is sometimes called the:","gist or main idea",["glossary","index","title page"]),
],
"making-inferences": [
 ("mcq","An inference is a conclusion based on:","clues plus what you know",["a wild guess","the title only","nothing"]),
 ("mcq","Read: \"Maria grabbed her umbrella and rain boots before leaving.\" You can infer:","it is raining or about to",["it is sunny","she is swimming","it is night"]),
 ("mcq","Read: \"Jake's stomach growled as he stared at the clock near noon.\" Infer that Jake is:","hungry",["sleepy","cold","angry"]),
 ("mcq","Read: \"The streets were empty and every shop was dark.\" You can infer it is:","very early or very late",["a busy afternoon","a parade","lunchtime"]),
 ("mcq","An author who doesn't state everything expects the reader to:","infer meaning from clues",["skip the text","memorize it","ignore details"]),
 ("mcq","Read: \"Tia hugged the trophy and beamed at the cheering crowd.\" Infer that Tia:","won and is proud",["lost and is sad","is bored","is afraid"]),
 ("mcq","Read: \"He checked his rearview mirror, signaled, and merged.\" Infer that he is:","driving a car",["riding a bike","walking","swimming"]),
 ("mcq","Read: \"The classroom was silent; every desk was empty and the lights were off.\" Infer that:","no one is there right now",["class is full","there is a party","it is the middle of class"]),
 ("mcq","To make a strong inference, your conclusion should be:","supported by text clues",["unrelated to the text","random","about the cover"]),
 ("mcq","Read: \"Sweat dripped as the team gulped water during the break.\" Infer that:","it is hot and they've been active",["it is snowing","they are asleep","they are reading"]),
 ("mcq","Read: \"Grandma set an extra plate and watched the clock by the window.\" Infer that:","she is expecting a guest",["she is leaving forever","she broke a plate","she is at school"]),
 ("mcq","Inferences are sometimes called:","reading between the lines",["copying the lines","skipping lines","counting lines"]),
 ("mcq","Read: \"The dog hid under the bed and trembled at each thunderclap.\" Infer that the dog is:","scared of the storm",["hungry","playful","sleepy and calm"]),
 ("mcq","Read: \"Her eyes were red and she clutched a crumpled tissue.\" Infer that she has been:","crying",["laughing","running","sleeping"]),
 ("mcq","A good inference can change if you find:","new clues in the text",["a longer book","the page number","the author's age"]),
 ("fill","A smart conclusion based on clues and prior knowledge is an ____. (one word)","inference"),
 ("mcq","Read: \"Snow piled up and the school sign read 'Closed.'\" Infer the kids will:","stay home",["go to class","go swimming outside","mow the lawn"]),
 ("mcq","Read: \"He tiptoed and whispered as he passed the nursery.\" Infer that:","a baby is sleeping",["a party is on","he is shouting","it is noon recess"]),
 ("mcq","An inference differs from a fact stated in the text because it is:","not directly written",["printed in bold","the title","a heading"]),
 ("mcq","Read: \"The candles were lit and a wrapped box sat by a 'Happy Birthday' banner.\" Infer:","it's someone's birthday",["it's a school day","someone is leaving","it's breakfast"]),
],
"character-analysis": [
 ("mcq","To understand a character, pay attention to their words, thoughts, and:","actions",["the page number","the font","the cover"]),
 ("mcq","Read: \"Lia gave her lunch to the new student and offered to show him around.\" Lia is:","kind and welcoming",["selfish","rude","lazy"]),
 ("mcq","A character who changes and grows during a story is called:","dynamic",["flat / static","invisible","minor only"]),
 ("mcq","Read: \"No matter how many times he failed, Sam tried again.\" Sam is:","determined",["lazy","fearful","careless"]),
 ("mcq","A character's motivation is the:","reason they act",["their height","their clothes","their name"]),
 ("mcq","Read: \"She lied to avoid blame, then felt guilty all night.\" This shows the character has a:","conscience (sense of right and wrong)",["fear of dogs","love of math","new bike"]),
 ("mcq","Read: \"Marcus shared credit with his teammates after the win.\" Marcus is:","humble / generous",["boastful","cruel","jealous"]),
 ("mcq","The main character a story centers on is the:","protagonist",["antagonist","narrator only","setting"]),
 ("mcq","A character who opposes the main character is the:","antagonist",["protagonist","author","reader"]),
 ("mcq","Read: \"Even when scared, Nina stepped forward to help.\" Nina is:","brave",["cowardly","cruel","lazy"]),
 ("mcq","We learn about characters through what they do and what others:","say about them",["eat","wear randomly","weigh"]),
 ("mcq","Read: \"He snapped at everyone and refused to listen.\" The character seems:","irritable / closed-minded",["cheerful","patient","generous"]),
 ("mcq","A character trait is a:","quality that describes who they are",["place they visit","day of the week","page number"]),
 ("mcq","Read: \"She saved part of her allowance every week for a year.\" The character is:","patient and disciplined",["impulsive","wasteful","careless"]),
 ("mcq","When a character faces a hard choice, it reveals their:","values",["shoe size","favorite color","address"]),
 ("fill","The main character in a story is called the ____. (one word)","protagonist"),
 ("mcq","Read: \"He apologized and worked to fix his mistake.\" This shows he is:","responsible",["careless","proud","cruel"]),
 ("mcq","A 'flat' or 'static' character is one who:","does not change much",["changes a lot","is the villain always","narrates"]),
 ("mcq","Read: \"Despite the teasing, Ravi kept helping others.\" Ravi shows:","resilience and kindness",["weakness","cruelty","greed"]),
 ("mcq","Comparing how a character acts at the start and end shows how they:","changed (or didn't)",["were printed","were named","were drawn"]),
],
"point-of-view": [
 ("mcq","A story told using 'I' and 'me' is written in:","first person",["second person","third person","no person"]),
 ("mcq","A story told using 'he', 'she', and 'they' is in:","third person",["first person","second person","my person"]),
 ("mcq","The narrator is the:","one telling the story",["main villain","reader","author's pet"]),
 ("mcq","Read: \"I couldn't believe my eyes as I opened the door.\" This is:","first person",["third person","second person","no narrator"]),
 ("mcq","Read: \"She wondered what was behind the door as he waited.\" This is:","third person",["first person","second person","fourth person"]),
 ("mcq","Point of view is the:","perspective the story is told from",["page count","setting","title"]),
 ("mcq","A first-person narrator can tell you their own:","thoughts and feelings",["everyone's secret thoughts","the future for sure","the page number"]),
 ("mcq","A third-person narrator who knows all characters' thoughts is:","omniscient",["limited only","first person","silent"]),
 ("mcq","Read: \"You walk into the room and feel the chill.\" This unusual style is:","second person",["first person","third person","no person"]),
 ("mcq","Two characters may describe the same event differently because they have different:","points of view",["page numbers","fonts","titles"]),
 ("mcq","If a narrator only knows one character's thoughts, it is third person:","limited",["omniscient","first","second"]),
 ("mcq","Understanding point of view helps you see whose:","eyes you're seeing the story through",["shoes you wear","lunch you eat","desk you use"]),
 ("mcq","Read: \"My heart raced as I crossed the finish line.\" The narrator is:","a character in the story",["outside the story only","the reader","the author's friend"]),
 ("mcq","An author chooses point of view to control what the reader:","knows and feels",["eats","wears","weighs"]),
 ("mcq","Which pronoun signals first person?","I",["he","she","they"]),
 ("fill","A story told from the 'I' perspective is in ____ person. (one word)","first"),
 ("mcq","A biased narrator might:","only show one side",["show every side fairly","have no opinions","not exist"]),
 ("mcq","Read: \"They argued for hours,\" he thought, \"but I knew the truth.\" The shift to 'I' marks a change in:","point of view / speaker",["setting","weather","font"]),
 ("mcq","Reading the same event from two characters teaches us that perspective:","shapes the story",["is unimportant","never changes","is the title"]),
 ("mcq","A third-person omniscient narrator can reveal:","all characters' inner thoughts",["only one thought","no thoughts","only dialogue"]),
],
"context-clues": [
 ("mcq","Read: \"The arid desert had not seen rain in months.\" \"Arid\" means:","very dry",["very wet","very cold","very loud"]),
 ("mcq","Read: \"His ravenous appetite made him eat three plates.\" \"Ravenous\" means:","very hungry",["full","picky","tired"]),
 ("mcq","Read: \"The fragile glass shattered at the lightest touch.\" \"Fragile\" means:","easily broken",["very strong","heavy","colorful"]),
 ("mcq","Read: \"She was elated to win first prize.\" \"Elated\" means:","very happy",["very sad","very bored","very tired"]),
 ("mcq","Read: \"The vast ocean stretched beyond the horizon.\" \"Vast\" means:","huge",["tiny","shallow","loud"]),
 ("mcq","Read: \"He spoke in an audible whisper we could just hear.\" \"Audible\" means:","able to be heard",["silent","bright","sweet"]),
 ("mcq","Read: \"The novice player made beginner mistakes.\" \"Novice\" means:","a beginner",["an expert","a coach","a fan"]),
 ("mcq","Read: \"Their abundant harvest filled every basket.\" \"Abundant\" means:","plentiful",["scarce","empty","dry"]),
 ("mcq","Read: \"The reclusive author rarely left her home.\" \"Reclusive\" means:","keeping to oneself",["very social","very loud","very fast"]),
 ("mcq","Read: \"He was reluctant and hesitated before agreeing.\" \"Reluctant\" means:","unwilling at first",["eager","angry","sleepy"]),
 ("mcq","Read: \"The diligent student studied every night.\" \"Diligent\" means:","hardworking",["lazy","careless","absent"]),
 ("mcq","Read: \"A feeble light barely lit the room.\" \"Feeble\" means:","weak",["bright","loud","warm"]),
 ("mcq","Read: \"The monotonous hum never changed.\" \"Monotonous\" means:","boringly unchanging",["exciting","colorful","loud and varied"]),
 ("mcq","Read: \"They sought refuge from the storm in a cave.\" \"Refuge\" means:","shelter / safety",["danger","a meal","a map"]),
 ("mcq","Read: \"Her optimistic outlook kept the team hopeful.\" \"Optimistic\" means:","hopeful and positive",["gloomy","angry","fearful"]),
 ("fill","Read: \"The room was vacant; not a soul was inside.\" \"Vacant\" means ____. (one word, starts with e)","empty"),
 ("mcq","Read: \"The scorching pavement burned our feet.\" \"Scorching\" means:","very hot",["freezing","damp","smooth"]),
 ("mcq","Read: \"He gave a brief, two-minute speech.\" \"Brief\" means:","short",["long","loud","boring"]),
 ("mcq","Read: \"The ancient, weathered map was centuries old.\" \"Weathered\" means:","worn by time/weather",["brand new","bright","heavy"]),
 ("mcq","Read: \"Their generous donation funded the whole library.\" \"Generous\" means:","giving freely",["stingy","small","late"]),
],
"text-structure": [
 ("mcq","A text that lists steps in order uses a ____ structure.","sequence (chronological)",["compare-contrast","cause-effect","problem-solution"]),
 ("mcq","A text that explains why something happens and the results uses:","cause and effect",["sequence","description","compare"]),
 ("mcq","A text that tells how two things are alike and different uses:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","A text that presents an issue and then ways to fix it uses:","problem and solution",["sequence","description","compare"]),
 ("mcq","Words like first, next, then, and finally signal a ____ structure.","sequence",["compare","cause-effect","problem-solution"]),
 ("mcq","Words like because, since, and as a result signal:","cause and effect",["sequence","compare","description"]),
 ("mcq","Words like however, both, and unlike signal:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","A recipe is most likely organized as:","sequence of steps",["compare-contrast","problem-solution","description only"]),
 ("mcq","An article on 'why the lake is shrinking and how to save it' uses:","problem and solution",["sequence only","compare only","description"]),
 ("mcq","Knowing a text's structure helps you:","find and organize information",["count pages","pick a font","ignore details"]),
 ("mcq","A passage describing what a rainforest looks, sounds, and smells like uses:","description",["sequence","cause-effect","problem-solution"]),
 ("mcq","A text comparing cats and dogs side by side uses:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","A timeline of historical events follows a ____ structure.","chronological / sequence",["compare","problem-solution","description"]),
 ("mcq","'The drought caused crops to fail, leading to food shortages' shows:","cause and effect",["sequence","compare","description"]),
 ("mcq","Signal words help readers identify a text's:","structure",["title","author","price"]),
 ("fill","A how-to text that lists steps in order uses a ____ structure. (one word)","sequence"),
 ("mcq","Headings and subheadings can hint at a text's:","organization (structure)",["page color","binding","cost"]),
 ("mcq","'Plastic pollution harms oceans; recycling and reuse can help' is structured as:","problem and solution",["sequence","compare","description"]),
 ("mcq","Comparing the causes of two wars side by side blends two structures:","cause-effect and compare-contrast",["sequence only","description only","none"]),
 ("mcq","Identifying structure first makes a hard text:","easier to understand",["longer","impossible","shorter to print"]),
],
"compare-and-contrast": [
 ("mcq","To compare two texts means to find how they are:","alike",["different only","printed","priced"]),
 ("mcq","To contrast two texts means to find how they are:","different",["alike only","bound","sold"]),
 ("mcq","Two articles on sharks, one scary and one scientific, differ mainly in their:","tone / purpose",["topic","page size","font color"]),
 ("mcq","Read accounts of the same storm by a sailor and a scientist; they likely differ in:","point of view and detail",["the date it happened","whether it was a storm","the planet"]),
 ("mcq","A Venn diagram is a tool used to:","compare and contrast",["tell time","measure mass","spell words"]),
 ("mcq","Two recipes for bread are alike because both:","give steps to make bread",["are mystery novels","are about cars","are poems"]),
 ("mcq","A poem and a news report on the same event differ in:","style and structure",["the event itself","the year","the alphabet"]),
 ("mcq","Comparing two characters' choices can reveal a story's:","theme",["page count","font","cover"]),
 ("mcq","The word 'whereas' is used to show a:","contrast (difference)",["similarity","sequence","cause"]),
 ("mcq","Two texts that reach different conclusions about a topic show:","differing viewpoints",["the same view","no view","a glossary"]),
 ("mcq","When comparing, an overlap in a Venn diagram shows what is:","shared by both",["unique to one","not in either","the title"]),
 ("mcq","A primary source (eyewitness) and a textbook on the same event differ because one is:","firsthand, the other secondhand",["fiction always","longer always","colored"]),
 ("mcq","Both a chart and a paragraph can present the same data, differing in:","format",["facts","truth","topic"]),
 ("mcq","Reading multiple texts on one topic helps you:","get a fuller understanding",["get confused only","learn less","ignore facts"]),
 ("mcq","If two authors agree on facts but feel differently, they differ in:","opinion / perspective",["the facts","the date","the spelling"]),
 ("fill","Finding how two things are different is to ____ them. (one word)","contrast"),
 ("mcq","A fairy tale and a fable are alike because both:","teach lessons through stories",["are nonfiction reports","have no characters","are recipes"]),
 ("mcq","Comparing a book and its movie often shows the movie:","leaves out some details",["adds nothing","is identical","has no characters"]),
 ("mcq","Two maps of the same city differ if they show:","different features (roads vs. parks)",["different cities","the future","nothing"]),
 ("mcq","Synthesizing two texts means:","combining their information",["copying one","ignoring both","reading neither"]),
],
"figurative-language": [
 ("mcq","\"Her smile was as bright as the sun\" is a:","simile",["metaphor","fact","question"]),
 ("mcq","\"Time is a thief\" is a:","metaphor",["simile","fact","rhyme"]),
 ("mcq","A simile compares two things using:","like or as",["because","and","the"]),
 ("mcq","A metaphor compares two things by saying one:","is the other",["is like the other","is near the other","is bigger"]),
 ("mcq","\"The wind whispered through the trees\" gives the wind human qualities, which is:","personification",["a simile","a fact","a hyperbole"]),
 ("mcq","\"I've told you a million times!\" is an exaggeration, called:","hyperbole",["a simile","a metaphor","onomatopoeia"]),
 ("mcq","\"Buzz,\" \"pop,\" and \"sizzle\" are examples of:","onomatopoeia (sound words)",["similes","metaphors","idioms"]),
 ("mcq","\"It's raining cats and dogs\" is an:","idiom",["a fact","a simile","onomatopoeia"]),
 ("mcq","\"The classroom was a zoo\" is a metaphor meaning the room was:","wild and noisy",["full of animals","very quiet","empty"]),
 ("mcq","\"As busy as a bee\" is a:","simile",["metaphor","idiom","fact"]),
 ("mcq","Personification gives ____ qualities to nonhuman things.","human",["animal","metal","cold"]),
 ("mcq","\"The stars danced in the sky\" is an example of:","personification",["a simile","hyperbole","onomatopoeia"]),
 ("mcq","Which phrase is a metaphor?","Her room was a disaster zone.",["Her room was like a mess.","Her room was messy.","Her room was clean."]),
 ("mcq","\"He's as tall as a giraffe\" uses 'as,' so it is a:","simile",["metaphor","idiom","fact"]),
 ("mcq","Figurative language is used to:","create vivid images and meaning",["state plain facts only","confuse readers","fill space"]),
 ("fill","A comparison using 'like' or 'as' is called a ____. (one word)","simile"),
 ("mcq","\"My backpack weighs a ton\" is an example of:","hyperbole",["a fact","a simile","onomatopoeia"]),
 ("mcq","\"Break a leg\" before a show is an idiom that really means:","good luck",["get hurt","run fast","sit down"]),
 ("mcq","\"The thunder grumbled\" gives thunder a human action, so it's:","personification",["a simile","an idiom","a fact"]),
 ("mcq","Which is NOT figurative language?","The dog barked loudly.",["The fog crept in on cat feet.","She is a shining star.","Quiet as a mouse."]),
],
}


# ===================================================== TOPIC REGISTRY (grade 5)

TOPICS5 = [
 # ---- MATH (computed, banded by difficulty, de-duplicated) ----
 ("math","multi-digit-multiplication","Multi-Digit Multiplication","5.NBT.B.5",
  "Multiply larger numbers by breaking them into place values. Worksheets get harder as the numbers grow.", G(m_mult)),
 ("math","long-division","Long Division","5.NBT.B.6",
  "Divide larger numbers into equal groups. Each worksheet uses bigger numbers than the last.", G(m_div)),
 ("math","decimal-place-value","Decimal Place Value","5.NBT.A.3",
  "Each digit after the decimal point has a smaller place value: tenths, hundredths, thousandths.", G(m_decimal_pv)),
 ("math","add-subtract-decimals","Add & Subtract Decimals","5.NBT.B.7",
  "Line up the decimal points, then add or subtract just like whole numbers.", G(m_add_sub_decimals)),
 ("math","multiply-decimals","Multiply Decimals","5.NBT.B.7",
  "Multiply the digits, then place the decimal point by counting decimal places.", G(m_mult_decimals)),
 ("math","add-subtract-fractions","Add & Subtract Fractions","5.NF.A.1",
  "To add or subtract fractions with different denominators, first find a common denominator.", G(m_add_sub_fractions)),
 ("math","multiply-fractions","Multiply Fractions","5.NF.B.4",
  "To multiply fractions, multiply the numerators and multiply the denominators.", G(m_mult_fractions)),
 ("math","order-of-operations","Order of Operations","5.OA.A.1",
  "Do parentheses first, then multiply and divide, then add and subtract (left to right).", G(m_order_ops)),
 ("math","powers-of-ten","Powers of Ten","5.NBT.A.2",
  "Multiplying by 10, 100, or 1000 shifts the digits left; dividing shifts them right.", G(m_powers_of_ten)),
 ("math","volume","Volume","5.MD.C.5",
  "The volume of a box is length x width x height, measured in cubic units.", G(m_volume)),
 # ---- SCIENCE ----
 ("science","matter-and-properties","Matter & Its Properties","5-PS1-3",
  "Matter is anything with mass and volume; we identify materials by their properties.", SCIENCE5["matter-and-properties"]),
 ("science","mixtures-and-solutions","Mixtures & Solutions","5-PS1-4",
  "Mixtures can be separated; when a solid dissolves evenly in a liquid it forms a solution.", SCIENCE5["mixtures-and-solutions"]),
 ("science","conservation-of-matter","Conservation of Matter","5-PS1-2",
  "In ordinary changes, matter is never created or destroyed — total mass stays the same.", SCIENCE5["conservation-of-matter"]),
 ("science","food-webs-and-energy","Food Webs & Energy","5-LS2-1",
  "Energy flows from the Sun to producers to consumers; decomposers recycle nutrients.", SCIENCE5["food-webs-and-energy"]),
 ("science","plants-make-food","How Plants Make Food","5-LS1-1",
  "Through photosynthesis, plants use sunlight, water, and air to make their own food.", SCIENCE5["plants-make-food"]),
 ("science","earth-systems","Earth's Systems","5-ESS2-1",
  "Earth's atmosphere, hydrosphere, geosphere, and biosphere constantly interact.", SCIENCE5["earth-systems"]),
 ("science","water-on-earth","Water on Earth","5-ESS2-2",
  "Most of Earth's water is salty ocean; only a small fraction is usable fresh water.", SCIENCE5["water-on-earth"]),
 ("science","protecting-resources","Protecting Earth's Resources","5-ESS3-1",
  "People can protect Earth by reducing, reusing, recycling, and using renewable energy.", SCIENCE5["protecting-resources"]),
 ("science","patterns-in-the-sky","Patterns in the Sky","5-ESS1-2",
  "Earth's rotation and orbit cause day/night, seasons, shadows, and the Moon's phases.", SCIENCE5["patterns-in-the-sky"]),
 ("science","gravity","Gravity","5-PS2-1",
  "Gravity is a force that pulls objects toward Earth's center and holds planets in orbit.", SCIENCE5["gravity"]),
 # ---- READING ----
 ("reading","main-idea-and-details","Main Idea & Details","RI.5.2",
  "The main idea is a text's key point; supporting details explain and back it up.", READING5["main-idea-and-details"]),
 ("reading","theme","Theme","RL.5.2",
  "A theme is the lesson or message a story conveys, usually shown through what characters learn.", READING5["theme"]),
 ("reading","summarizing","Summarizing","RI.5.2",
  "A summary retells the main idea and key details briefly, in your own words.", READING5["summarizing"]),
 ("reading","making-inferences","Making Inferences","RL.5.1",
  "An inference is a conclusion drawn from text clues plus what you already know.", READING5["making-inferences"]),
 ("reading","character-analysis","Character Analysis","RL.5.3",
  "Understand characters through their words, actions, thoughts, and how they change.", READING5["character-analysis"]),
 ("reading","point-of-view","Point of View","RL.5.6",
  "Point of view is the perspective a story is told from — first or third person.", READING5["point-of-view"]),
 ("reading","context-clues","Vocabulary in Context","RI.5.4",
  "Use surrounding words to figure out the meaning of unfamiliar vocabulary.", READING5["context-clues"]),
 ("reading","text-structure","Text Structure","RI.5.5",
  "Authors organize texts as sequence, cause-effect, compare-contrast, or problem-solution.", READING5["text-structure"]),
 ("reading","compare-and-contrast","Comparing Texts","RI.5.9",
  "Comparing texts on the same topic reveals how they are alike and different.", READING5["compare-and-contrast"]),
 ("reading","figurative-language","Figurative Language","L.5.5",
  "Similes, metaphors, personification, idioms, and hyperbole create vivid meaning.", READING5["figurative-language"]),
 # ---- WRITING (reuses shared grammar generators) ----
 ("writing","nouns","Nouns","L.5.1",
  "A noun names a person, place, thing, or idea.", g_nouns),
 ("writing","action-verbs","Action Verbs","L.5.1",
  "A verb shows action or a state of being.", g_verbs),
 ("writing","adjectives","Adjectives","L.5.1",
  "An adjective describes a noun — what kind, how many, or which one.", g_adjectives),
 ("writing","pronouns","Pronouns","L.5.1",
  "A pronoun takes the place of a noun.", g_pronouns),
 ("writing","subject-verb-agreement","Subject-Verb Agreement","L.5.1",
  "The verb must agree with its subject in number.", g_subject_verb),
 ("writing","past-tense-verbs","Past-Tense Verbs","L.5.1",
  "Past-tense verbs describe actions that already happened.", g_past_tense),
 ("writing","plural-nouns","Plural Nouns","L.5.1",
  "Plurals show more than one, using -s, -es, or special spellings.", g_plurals),
 ("writing","capitalization","Capitalization","L.5.2",
  "Capitalize sentence beginnings, the word I, and proper nouns.", g_capitalization),
 ("writing","end-punctuation","End Punctuation","L.5.2",
  "End sentences with a period, question mark, or exclamation point.", g_end_punctuation),
 ("writing","commas-in-a-series","Commas in a Series","L.5.2",
  "Use commas to separate three or more items in a list.", g_commas_series),
]


if __name__ == "__main__":
    print(emit_curriculum(5, TOPICS5))
