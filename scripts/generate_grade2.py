#!/usr/bin/env python3
"""
TopicLeap Grade 2 curriculum seed generator.

Math computed (grade-2 numbers), grammar reused, science + reading authored
to grade-2 standards. 4 subjects x 10 topics x 20 questions, worksheets of 5.

Usage:
    python3 scripts/generate_grade2.py > supabase/seed/grade2_curriculum.sql
"""
import random

from generate_seed import (
    QUESTIONS_PER_TOPIC,
    emit_curriculum,
    fill,
    mcq,
    g_nouns, g_verbs, g_adjectives, g_pronouns, g_subject_verb,
    g_past_tense, g_plurals, g_capitalization, g_end_punctuation, g_commas_series,
)

NQ = QUESTIONS_PER_TOPIC


# ============================================================ MATH (computed)

def g2_place_value(rng):
    qs, used = [], set()
    while len(qs) < NQ:
        n = rng.randint(100, 999)
        s = str(n)
        idx = rng.randint(0, 2)
        d = int(s[idx])
        if d == 0 or (n, idx) in used:
            continue
        used.add((n, idx))
        place = 10 ** (2 - idx)
        qs.append(fill(f"What is the value of the digit {d} in {n}? "
                       f"(Write the number, e.g. 300)", d * place))
    return qs


def g2_add100(rng):
    qs, seen = [], set()
    while len(qs) < NQ:
        a = rng.randint(11, 89)
        b = rng.randint(10, 100 - a)
        if (a, b) in seen:
            continue
        seen.add((a, b))
        qs.append(fill(f"Add: {a} + {b} = ?", a + b))
    return qs


def g2_sub100(rng):
    qs, seen = [], set()
    while len(qs) < NQ:
        a = rng.randint(20, 99)
        b = rng.randint(10, a)
        if (a, b) in seen:
            continue
        seen.add((a, b))
        qs.append(fill(f"Subtract: {a} - {b} = ?", a - b))
    return qs


def g2_add_sub_1000(rng):
    qs = []
    for i in range(NQ):
        if i % 2 == 0:
            a = rng.randint(120, 600)
            b = rng.randint(100, 399)
            qs.append(fill(f"Add: {a} + {b} = ?", a + b))
        else:
            a = rng.randint(300, 999)
            b = rng.randint(100, a - 50)
            qs.append(fill(f"Subtract: {a} - {b} = ?", a - b))
    return qs


def g2_skip_count(rng):
    qs = []
    steps = [2, 5, 10, 100]
    for _ in range(NQ):
        step = rng.choice(steps)
        start = rng.randint(1, 8) * step
        seq = [start + step * k for k in range(3)]
        nxt = seq[-1] + step
        qs.append(fill(f"Skip count by {step}s: {seq[0]}, {seq[1]}, {seq[2]}, ___",
                       nxt))
    return qs


def g2_compare(rng):
    qs = []
    for _ in range(NQ):
        a = rng.randint(100, 999)
        b = rng.randint(100, 999)
        while b == a:
            b = rng.randint(100, 999)
        bigger = max(a, b)
        qs.append(mcq(f"Which number is greater: {a} or {b}?", str(bigger),
                      [str(min(a, b)), "They are equal", str(a + b)], rng))
    return qs


def g2_arrays(rng):
    qs, seen = [], set()
    while len(qs) < NQ:
        r = rng.randint(2, 6)
        c = rng.randint(2, 6)
        if (r, c) in seen:
            continue
        seen.add((r, c))
        qs.append(fill(f"An array has {r} rows with {c} in each row. "
                       f"How many are there in all?", r * c))
    return qs


def g2_money(rng):
    qs = []
    for _ in range(NQ):
        q = rng.randint(0, 3)
        d = rng.randint(0, 4)
        n = rng.randint(0, 3)
        p = rng.randint(0, 4)
        if q + d + n + p == 0:
            d = 1
        total = 25 * q + 10 * d + 5 * n + 1 * p
        parts = []
        if q:
            parts.append(f"{q} quarter" + ("s" if q > 1 else ""))
        if d:
            parts.append(f"{d} dime" + ("s" if d > 1 else ""))
        if n:
            parts.append(f"{n} nickel" + ("s" if n > 1 else ""))
        if p:
            parts.append(f"{p} penny" if p == 1 else f"{p} pennies")
        coins = ", ".join(parts)
        qs.append(fill(f"You have {coins}. How many cents is that in all? "
                       f"(quarter=25, dime=10, nickel=5, penny=1)", total))
    return qs


def g2_time5(rng):
    qs = []
    for _ in range(NQ):
        h = rng.randint(1, 12)
        mm = rng.choice([0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55])
        correct = f"{h}:{mm:02d}"
        others = set()
        while len(others) < 3:
            h2 = rng.randint(1, 12)
            m2 = rng.choice([0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55])
            cand = f"{h2}:{m2:02d}"
            if cand != correct:
                others.add(cand)
        qs.append(mcq(f"Which clock time is '{h} {mm:02d}' — {h} hours and "
                      f"{mm} minutes?", correct, list(others), rng))
    return qs


def g2_even_odd(rng):
    qs = []
    for _ in range(NQ):
        n = rng.randint(1, 100)
        ans = "even" if n % 2 == 0 else "odd"
        qs.append(mcq(f"Is the number {n} even or odd?", ans,
                      ["even" if ans == "odd" else "odd", "both", "neither"], rng))
    return qs


# ============================================== SCIENCE (authored, NGSS gr. 2)

SCIENCE2 = {
"properties-of-materials": [
 ("mcq","A property tells you about a material, like its color and:","texture (how it feels)",["its name","its price","its owner"]),
 ("mcq","Which material is usually hard?","a rock",["a pillow","a cloud","jelly"]),
 ("mcq","Which material is usually soft?","a cotton ball",["a brick","a rock","metal"]),
 ("mcq","Which material is clear (you can see through it)?","glass",["wood","a brick","cardboard"]),
 ("mcq","Which material is best for keeping you warm?","wool",["ice","glass","metal"]),
 ("mcq","Which material bends easily (it is flexible)?","rubber",["a brick","glass","stone"]),
 ("mcq","Which would be best to build a strong, sturdy wall?","bricks",["paper","cotton","jelly"]),
 ("mcq","Which material is smooth?","glass",["sandpaper","a pinecone","tree bark"]),
 ("mcq","Which property describes how heavy something is?","weight",["color","smell","sound"]),
 ("mcq","Metal is a good choice for a pan because it:","gets hot to cook food",["floats away","melts in the sun","is soft"]),
 ("mcq","Which material would float on water?","a cork",["a metal nail","a rock","a coin"]),
 ("mcq","Wood is often used to build furniture because it is:","strong and easy to shape",["see-through","very soft","liquid"]),
 ("mcq","Which is the best material for a window?","clear glass",["wood","metal","brick"]),
 ("mcq","Which material is bendy and stretchy?","a rubber band",["a glass cup","a rock","a brick"]),
 ("mcq","A property you can test with your hands is:","how rough or smooth it is",["its name","its price","who made it"]),
 ("fill","How a material feels when you touch it is called its ____. (one word)","texture"),
 ("mcq","Which material is waterproof (water cannot soak in)?","plastic",["paper","a cotton shirt","cardboard"]),
 ("mcq","Which would make the best soft, cozy blanket?","fleece or wool",["metal","glass","stone"]),
 ("mcq","Sandpaper feels:","rough",["smooth","wet","soft"]),
 ("mcq","We choose materials for a job based on their:","properties",["color only","names","price only"]),
],
"solids-and-liquids": [
 ("mcq","A solid keeps its own:","shape",["temperature only","color only","sound"]),
 ("mcq","A liquid takes the shape of its:","container",["owner","name","color"]),
 ("mcq","Which is a solid?","a rock",["water","milk","juice"]),
 ("mcq","Which is a liquid?","water",["a brick","a chair","a spoon"]),
 ("mcq","If you pour juice into a cup, it takes the shape of the:","cup",["spoon","table","sky"]),
 ("mcq","Which can you hold in your hand without it spilling?","a block (solid)",["water","milk","juice"]),
 ("mcq","Ice is the solid form of:","water",["milk","juice","soda"]),
 ("mcq","When ice gets warm, it melts into a:","liquid",["solid","gas only","rock"]),
 ("mcq","Which keeps the same shape no matter the container?","a toy car (solid)",["water","juice","milk"]),
 ("mcq","Which would flow and spread out if you spilled it?","water (a liquid)",["a book","a rock","a coin"]),
 ("mcq","A solid can be:","hard or soft, but keeps its shape",["only liquid","only a gas","invisible always"]),
 ("mcq","Milk poured from a tall glass into a wide bowl will:","spread into the bowl's shape",["stay tall","become solid","disappear"]),
 ("mcq","Which list has only solids?","rock, spoon, book",["water, milk, juice",  "rain, soup, tea","milk, ice cream soup, lemonade"]),
 ("mcq","Which list has only liquids?","water, milk, juice",["rock, spoon, book","chair, cup, ball","pencil, plate, fork"]),
 ("mcq","When you freeze a liquid, it becomes a:","solid",["gas","new color","sound"]),
 ("fill","A liquid takes the shape of its ____. (one word)","container"),
 ("mcq","Which is the solid: an ice cube or the water it melts into?","the ice cube",["the water","both are gases","neither"]),
 ("mcq","Sand poured into a jar fills the jar's shape but each grain is a tiny:","solid",["liquid","gas","cloud"]),
 ("mcq","Which can be poured easily?","a liquid like water",["a solid brick","a solid rock","a solid book"]),
 ("mcq","A puddle is a small amount of a:","liquid",["solid","gas","rock"]),
],
"changing-materials": [
 ("mcq","Heating ice makes it:","melt into water",["turn to wood","get harder","disappear forever"]),
 ("mcq","Freezing water makes it:","turn into ice",["turn into juice","get warmer","vanish"]),
 ("mcq","Melting and freezing water can be done:","again and again (reversible)",["only once ever","never","only on the Moon"]),
 ("mcq","Baking cake batter into a cake is a change that:","cannot easily be undone",["can be undone easily","makes more batter","freezes it"]),
 ("mcq","Cutting paper into pieces changes its:","shape",["material into metal","color to gold","weight a lot"]),
 ("mcq","Which change can be reversed?","melting butter, then cooling it",["burning toast","baking bread","frying an egg"]),
 ("mcq","Burning wood turns it into ash and smoke. This change is:","not reversible",["easy to undo","make new wood","reversible"]),
 ("mcq","Mixing sand and water, then letting it dry, can:","separate them again",["make gold","make glass instantly","never separate"]),
 ("mcq","Heating chocolate makes it:","melt",["freeze","turn to wood","disappear"]),
 ("mcq","Which is a change you CANNOT easily undo?","cooking an egg",["melting an ice cube","freezing water","folding paper"]),
 ("mcq","When you cool melted wax, it:","becomes solid again",["stays liquid forever","turns to water","vanishes"]),
 ("mcq","Stretching and squishing clay changes its:","shape, not its material",["material to metal","color to blue","weight a lot"]),
 ("mcq","Toasting bread is a change that is:","hard to undo",["easy to undo","reversible","make new bread"]),
 ("mcq","Ice, water, and steam are all forms of the same:","material (water)",["metal","wood","plastic"]),
 ("mcq","Folding a paper airplane changes its:","shape",["material","color","weight a lot"]),
 ("fill","Melting then freezing water can be repeated, so it is a ____ change. (one word)","reversible"),
 ("mcq","Which uses heat to change a material?","baking cookies",["folding a towel","stacking blocks","cutting paper"]),
 ("mcq","A melted crayon that hardens again shows a change that is:","reversible",["impossible","not reversible","magic only"]),
 ("mcq","Mixing flour, water, and heat to bake bread is:","not easily reversible",["easy to undo","reversible","make raw flour back"]),
 ("mcq","Breaking a plate changes its shape and is:","hard to undo",["easy to undo","reversible","make a new plate"]),
],
"plants-need-sun-and-water": [
 ("mcq","To grow well, plants need water, air, and:","sunlight",["candy","toys","darkness"]),
 ("mcq","A plant kept in a dark closet with no light will:","grow poorly or die",["grow super fast","turn into an animal","make light"]),
 ("mcq","Plants take in water mostly through their:","roots",["flowers","petals","leaves only"]),
 ("mcq","Leaves use sunlight to help make the plant's:","food",["roots","soil","rocks"]),
 ("mcq","If you never water a plant, it will:","dry out and wilt",["grow taller","turn blue","make rain"]),
 ("mcq","Which two things does a plant need from its surroundings?","water and sunlight",["candy and toys","TV and music","plastic and metal"]),
 ("mcq","Where do most plants get the water they need?","from the soil",["from the sky directly into leaves only","from rocks","from animals"]),
 ("mcq","A seed needs warmth and ____ to start growing.","water",["soda","sand only","darkness forever"]),
 ("mcq","Sunlight helps a plant's leaves to:","make food (photosynthesis)",["make sound","make rocks","make rain"]),
 ("mcq","Two plants, one in sun and one in a dark box: which grows better?","the one in the sun",["the one in the dark","both die","both grow the same"]),
 ("mcq","Besides water and light, plants also need:","air",["candy","plastic","toys"]),
 ("mcq","Over-watering or no water can both:","harm a plant",["help a plant","make it fly","change its species"]),
 ("mcq","A wilted, droopy plant most likely needs:","water",["less light always","candy","a toy"]),
 ("mcq","Plants are different from animals because plants can:","make their own food",["walk around","eat other plants only","fly"]),
 ("mcq","Which would help a houseplant grow?","placing it near a sunny window and watering it",["putting it in a dark closet","never watering it","feeding it candy"]),
 ("fill","Besides water and air, plants need ____ to make food. (one word)","sunlight"),
 ("mcq","Roots hold a plant in the soil and take in:","water and nutrients",["sound","light","wind"]),
 ("mcq","Which is NOT something a plant needs to grow?","candy",["water","sunlight","air"]),
 ("mcq","Farmers water their crops so the plants can:","grow",["sleep","fly","sing"]),
 ("mcq","On a sunny day, leaves are busy making:","food for the plant",["noise","rocks","rain"]),
],
"seeds-and-pollination": [
 ("mcq","Many plants make ____ that can grow into new plants.","seeds",["rocks","plastic","cups"]),
 ("mcq","Bees help plants by moving:","pollen from flower to flower",["rocks","water only","soil"]),
 ("mcq","Moving pollen between flowers is called:","pollination",["erosion","melting","evaporation"]),
 ("mcq","Some seeds are spread by sticking to animal:","fur",["teeth","eyes","ears only"]),
 ("mcq","A dandelion's fluffy seeds are spread by the:","wind",["ocean","fire","Moon"]),
 ("mcq","When an animal eats a fruit, it can spread the:","seeds inside",["leaves","roots","petals"]),
 ("mcq","Why are flowers often brightly colored?","to attract pollinators like bees",["to scare the Sun","to make rain","to stay cold"]),
 ("mcq","A coconut can float across water to a new beach to:","grow a new plant",["catch fish","make sand","cool the ocean"]),
 ("mcq","Which animal is a common pollinator?","a butterfly",["a shark","a polar bear","a worm in the deep soil"]),
 ("mcq","Seeds spread to new places so plants can:","grow where there is room",["stay all in one spot","make noise","fly away forever"]),
 ("mcq","A burr seed has tiny hooks so it can:","stick to fur and clothes",["float on water","glow","sing"]),
 ("mcq","Pollen is a tiny powder made by:","flowers",["rocks","clouds","animals"]),
 ("mcq","Maple 'helicopter' seeds spin and are carried by the:","wind",["river","fire","Sun"]),
 ("mcq","Plants that make sweet nectar attract bees, which then carry:","pollen",["water","rocks","leaves"]),
 ("mcq","Without pollination, many plants could not make:","seeds and fruit",["leaves","roots","stems"]),
 ("fill","Moving pollen from flower to flower is called ____. (one word)","pollination"),
 ("mcq","Birds can help spread seeds when they:","eat berries and drop the seeds elsewhere",["build nests","sing","fly south only"]),
 ("mcq","Which helps seeds travel far?","wind, water, and animals",["staying still","sunlight only","sound"]),
 ("mcq","A flower's job is mostly to help the plant make:","seeds",["soil","rocks","rain"]),
 ("mcq","If seeds all fell right under the parent plant, the new plants might:","be too crowded",["grow better","fly away","turn to rock"]),
],
"habitats-and-diversity": [
 ("mcq","The natural home of a living thing is its:","habitat",["hobby","schedule","color"]),
 ("mcq","Which animal best fits a desert habitat?","a lizard",["a polar bear","a whale","a penguin"]),
 ("mcq","Which animal best fits a cold, icy habitat?","a polar bear",["a camel","a parrot","a cactus"]),
 ("mcq","A pond habitat is home to:","frogs and fish",["camels","polar bears","lions"]),
 ("mcq","Different habitats are home to different kinds of:","plants and animals",["cars","toys","phones"]),
 ("mcq","A rainforest habitat is:","warm and very rainy",["cold and dry","sandy and dry","icy"]),
 ("mcq","Many different kinds of living things in one place shows:","diversity",["sameness","emptiness","silence"]),
 ("mcq","A cactus is well-suited to live in the:","desert",["ocean","arctic","deep cave"]),
 ("mcq","An ocean habitat is home to:","fish, crabs, and whales",["lions","camels","squirrels"]),
 ("mcq","Animals live in a habitat that gives them:","food, water, and shelter",["homework","money","toys"]),
 ("mcq","Which habitat would have lots of tall trees?","a forest",["a desert","the open ocean","the arctic ice"]),
 ("mcq","A worm's habitat is usually:","in the soil",["high in the sky","in fire","on the Moon"]),
 ("mcq","More kinds of plants and animals usually live in a habitat that has:","plenty of food and water",["no water","no plants","only ice"]),
 ("mcq","Which would you most likely find in a meadow habitat?","grasses and butterflies",["sharks","penguins","cactus only"]),
 ("mcq","A habitat where it is dark, damp, and rocky might be a:","cave",["sunny beach","grassy field","tree top"]),
 ("fill","The natural home of a plant or animal is its ____. (one word)","habitat"),
 ("mcq","Which animals would share a forest habitat?","deer, owls, and squirrels",["whales and sharks","camels and lizards","penguins and seals"]),
 ("mcq","Diversity is good for a habitat because it:","helps many living things survive together",["makes everything the same","removes all plants","empties the area"]),
 ("mcq","A fish moved from the ocean to a desert would:","not survive",["thrive","grow legs instantly","become a plant"]),
 ("mcq","Frogs live near ponds because they need:","water",["sand","ice","fire"]),
],
"fast-and-slow-earth-changes": [
 ("mcq","Which change to the land happens FAST?","a volcano erupting",["a canyon forming over years","a mountain wearing down","a hill slowly eroding"]),
 ("mcq","Which change to the land happens SLOWLY?","a canyon being carved by a river",["an earthquake","a landslide","a volcano erupting"]),
 ("mcq","An earthquake changes the land:","quickly",["over a million years","never","only in winter"]),
 ("mcq","Water slowly wearing away rock over many years is:","slow erosion",["a fast flood","an earthquake","a volcano"]),
 ("mcq","A sudden flood can change the land:","quickly",["very slowly","never","only at night"]),
 ("mcq","Wind slowly shaping a sand dune is a change that is:","slow",["instant","explosive","loud"]),
 ("mcq","A landslide moves rock and soil:","quickly",["over centuries","never","only in summer"]),
 ("mcq","The Grand Canyon was carved by a river over a very:","long time (slow)",["short time (fast)","single day","single hour"]),
 ("mcq","Which is a FAST event?","a volcano erupting",["weathering of a cliff","a slowly growing delta","a slowly forming cave"]),
 ("mcq","Rocks slowly cracking from freezing water is a:","slow change",["fast change","an instant event","a loud blast"]),
 ("mcq","Which would you NOT notice happening in a single day?","a mountain wearing down",["a volcano erupting","an earthquake","a flash flood"]),
 ("mcq","Ocean waves slowly wearing away a cliff is:","slow erosion",["a fast eruption","an earthquake","a landslide"]),
 ("mcq","A big storm can change a beach:","quickly",["over a million years","never","only on the Moon"]),
 ("mcq","Which change takes the longest?","a deep canyon forming",["a rockslide","a flood","a volcano blast"]),
 ("mcq","Scientists know some land changes are slow because they take:","many, many years",["a few seconds","one minute","no time"]),
 ("fill","An event like a volcano changes the land very ____ (quickly or slowly?). ","quickly"),
 ("mcq","A new island can form from a volcano:","fairly quickly",["over a billion years only","never","by magic"]),
 ("mcq","Soil slowly building up to form rich farmland is a:","slow change",["fast change","an explosion","an earthquake"]),
 ("mcq","Which is the best example of a sudden, fast change?","an earthquake",["weathering","slow erosion","a growing sand dune"]),
 ("mcq","Both fast and slow events can change:","the shape of the land",["the alphabet","math facts","the days of the week"]),
],
"landforms-and-maps": [
 ("mcq","A tall landform that rises high above the land is a:","mountain",["valley","plain","river"]),
 ("mcq","A large body of salt water is an:","ocean",["mountain","desert","hill"]),
 ("mcq","A map uses symbols and a key to show:","places and land features",["the future","sounds","smells"]),
 ("mcq","A low area of land between mountains is a:","valley",["peak","cliff","plateau"]),
 ("mcq","A flat, wide area of land is a:","plain",["mountain","canyon","volcano"]),
 ("mcq","On many maps, which direction is at the top?","north",["south","east","down"]),
 ("mcq","A model of Earth shaped like a ball is a:","globe",["map key","ruler","clock"]),
 ("mcq","Fresh water flowing across the land is a:","river",["desert","plateau","dune"]),
 ("mcq","A dry area that gets very little rain is a:","desert",["rainforest","ocean","swamp"]),
 ("mcq","The map key (legend) helps you understand the map's:","symbols",["price","weight","sound"]),
 ("mcq","A piece of land with water all around it is an:","island",["ocean","valley","plain"]),
 ("mcq","A small raised landform, lower than a mountain, is a:","hill",["ocean","valley","sea"]),
 ("mcq","Which tool would best help you find your way in a new place?","a map",["a clock","a thermometer","a scale"]),
 ("mcq","A deep, narrow valley with steep sides is a:","canyon",["plain","hill","beach"]),
 ("mcq","Mountains found in a long line together form a:","mountain range",["lake","bay","island"]),
 ("fill","A model of the Earth shaped like a ball is called a ____. (one word)","globe"),
 ("mcq","Which landform is made of moving ice?","a glacier",["a desert","a plain","a meadow"]),
 ("mcq","The place where land meets the ocean is the:","coast",["peak","valley","plateau"]),
 ("mcq","Maps can show where rivers, mountains, and ____ are.","cities",["feelings","sounds","smells"]),
 ("mcq","A high, flat landform with steep sides is a:","plateau",["valley","canyon","river"]),
],
"water-on-earth": [
 ("mcq","Most of the water on Earth is found in the:","oceans",["rivers","ponds","puddles"]),
 ("mcq","Ocean water is:","salty",["fresh and sweet","made of juice","not real water"]),
 ("mcq","Which holds fresh water we can drink?","a lake or river",["the salty ocean","a sand dune","a rock"]),
 ("mcq","Frozen water at the cold poles is found as:","ice",["sand","soil","steam"]),
 ("mcq","Which is a body of fresh water?","a pond",["the ocean","a sea","a salty bay"]),
 ("mcq","Water in the sky inside clouds is made of tiny:","water droplets",["rocks","sand","smoke"]),
 ("mcq","A small stream of water flowing to a river is a:","creek (stream)",["desert","mountain","dune"]),
 ("mcq","Glaciers are large amounts of water in the form of:","ice",["steam","liquid juice","sand"]),
 ("mcq","Which has fresh water, not salt water?","a river",["the ocean","a salty sea","ocean spray"]),
 ("mcq","Where can you find water underground?","in wells and underground layers",["only in the sky","only in fire","only on the Moon"]),
 ("mcq","Most of Earth's surface is covered by:","water",["sand","forests","ice only"]),
 ("mcq","Which is the largest body of water?","an ocean",["a pond","a puddle","a cup"]),
 ("mcq","Rain that falls and collects can form a:","lake",["mountain","desert","volcano"]),
 ("mcq","Living things need fresh water to:","drink and survive",["build cars","make plastic","do math"]),
 ("mcq","Ice caps and glaciers store water as:","solid ice",["salty liquid","steam","sand"]),
 ("fill","Ocean water tastes ____ because it has salt in it. (one word)","salty"),
 ("mcq","Which one is fresh water people often drink?","river or lake water (cleaned)",["ocean water","sea water","salty bay water"]),
 ("mcq","Water can be found on Earth as a solid, a liquid, and a:","gas",["rock","metal","plant"]),
 ("mcq","A large area of salty water smaller than an ocean is a:","sea",["pond","creek","puddle"]),
 ("mcq","Why is fresh water important?","living things need it to live",["it is for swimming only","it has no use","it is only for boats"]),
],
"wind-and-water-shape-land": [
 ("mcq","Moving water can carry away soil and sand. This is:","erosion",["evaporation","reflection","vibration"]),
 ("mcq","Wind can shape the land by moving:","sand into dunes",["mountains overnight","oceans","cities"]),
 ("mcq","A river slowly carving a path through rock makes a:","canyon or valley",["mountain peak","sand dune","cloud"]),
 ("mcq","Ocean waves hitting a cliff cause the cliff to:","wear away",["grow taller","get colder","turn to metal"]),
 ("mcq","Which slows down soil erosion on a hill?","planting grass and trees",["removing all plants","adding loose sand","pouring more water"]),
 ("mcq","When a river drops the sand it carried, it builds up:","new land (deposition)",["a mountain instantly","a cloud","a canyon"]),
 ("mcq","Smooth, rounded pebbles in a stream got that way from:","being tumbled by water",["being painted","melting","freezing once"]),
 ("mcq","Strong wind in a desert can create:","sand dunes",["rivers","glaciers","forests"]),
 ("mcq","Which two things commonly shape the land over time?","wind and water",["sound and light","cars and roads","stars and the Moon"]),
 ("mcq","People can reduce erosion near rivers by planting:","plants along the banks",["nothing","more sand","plastic"]),
 ("mcq","Rushing flood water can change the land:","quickly",["over a million years","never","only at night"]),
 ("mcq","A delta is new land built where a river drops its:","sediment (sand and soil)",["water only","ice","rocks from space"]),
 ("mcq","Wind blowing sand against rock can slowly:","wear it down",["build a mountain","make it grow","cool the Sun"]),
 ("mcq","Which helps protect a beach from washing away?","plants and barriers",["removing all sand","adding more waves","nothing at all"]),
 ("mcq","Most changes from wind and water happen:","slowly over time (but floods are fast)",["only in one second always","never","only on the Moon"]),
 ("fill","Wind and water carrying away soil and rock is called ____. (one word)","erosion"),
 ("mcq","A canyon shows that water can:","cut through rock over a long time",["build mountains fast","freeze instantly","make sound"]),
 ("mcq","Sand at the beach was once mostly:","bigger rocks worn down",["made by animals","fallen from the sky","grown from seeds"]),
 ("mcq","To keep soil from washing away, farmers can:","plant cover crops and trees",["remove all plants","pour water on it","add loose sand"]),
 ("mcq","Both wind and water can change the shape of:","the land",["the alphabet","numbers","the days"]),
],
}


# ================================================= READING (authored, grade 2)

READING2 = {
"main-idea": [
 ("mcq","Read: \"Honeybees are helpful. They make honey and help flowers grow by moving pollen.\" The main idea is that honeybees:","are helpful",["are scary","are loud","are tiny"]),
 ("mcq","Read: \"Recycling is good. It saves trees, uses less energy, and keeps trash out of landfills.\" The main idea is that recycling:","is good for the Earth",["is hard","is colorful","takes time"]),
 ("mcq","Read: \"Penguins stay warm with thick feathers, a layer of fat, and by huddling together.\" The passage is mostly about how penguins:","stay warm",["catch fish","swim fast","build nests"]),
 ("mcq","Read: \"Our class garden grew well. We planted seeds, watered them, and pulled weeds.\" The main idea is that the class:","grew a garden",["went on a trip","had a party","read books"]),
 ("mcq","Read: \"Firefighters are brave. They put out fires, rescue people, and teach safety.\" The main idea is that firefighters:","do an important job",["are tall","drive fast","like red"]),
 ("mcq","Read: \"Sea turtles travel far in the ocean and return to the beach where they were born.\" The main idea is that sea turtles:","travel far and return home",["eat plants","are small","sleep a lot"]),
 ("mcq","Read: \"Libraries are great. You can borrow books, use computers, and join clubs, all for free.\" The main idea is that libraries:","offer many free things",["are quiet only","are far","are new"]),
 ("mcq","Read: \"Exercise keeps you healthy. It makes your heart strong and lifts your mood.\" The main idea is that exercise:","keeps you healthy",["is boring","needs a ball","is at night"]),
 ("mcq","Read: \"Trees help us. They give shade, clean the air, and are homes for birds.\" The main idea is that trees:","are useful",["are tall only","grow fast","are green"]),
 ("mcq","Read: \"Rosa wanted to help her town, so she started a club to clean the park and plant flowers.\" The main idea is that Rosa:","worked to help her town",["moved away","disliked the park","was bored"]),
 ("mcq","Read: \"Spiders are helpful. They catch insects like flies in their webs.\" The main idea is that spiders:","help by catching insects",["are huge","cannot spin webs","eat plants"]),
 ("mcq","Read: \"The ocean is full of life. Tiny plankton, colorful fish, and huge whales live there.\" The main idea is that the ocean:","is home to many living things",["is always cold","has no animals","is small"]),
 ("mcq","Read: \"Sleep is important. It helps your body grow and your brain remember.\" The main idea is that sleep:","is important",["is boring","is short","is loud"]),
 ("mcq","Read: \"Volcanoes can be dangerous but also helpful. Their ash makes soil rich for farming.\" The main idea is that volcanoes:","can be dangerous and helpful",["are always safe","are only in oceans","never erupt"]),
 ("mcq","Read: \"Deserts are harsh, yet many animals live there by hiding from the heat by day.\" The main idea is that desert animals:","have ways to survive the heat",["never sleep","live in the sea","love cold"]),
 ("fill","Read: \"Brushing your teeth keeps them clean and healthy.\" In one word, this is mostly about keeping teeth ____. ","healthy"),
 ("mcq","Read: \"Birds build nests by gathering twigs, grass, and leaves to make a cozy home.\" The main idea is that birds:","build nests for a home",["fly south","sing songs","eat worms"]),
 ("mcq","Read: \"The internet connects people. We use it to learn, talk, and find information.\" The main idea is that the internet:","helps people connect and learn",["is only for games","is broken","stores food"]),
 ("mcq","Read: \"Apples are tasty and healthy. They are sweet, crunchy, and full of vitamins.\" The main idea is that apples:","are tasty and healthy",["are red only","grow fast","are heavy"]),
 ("mcq","Read: \"Dogs make great pets. They are loyal, can be trained, and love to play.\" The main idea is that dogs:","make great pets",["are quiet","are wild","cannot learn"]),
],
"key-details": [
 ("mcq","Read: \"The hike was perfect. We saw a calm lake, tall pines, and a fire pit.\" Which detail was on the hike?","a calm lake",["a busy mall","a long line","a parking lot"]),
 ("mcq","Read: \"Our hamster runs on its wheel, stuffs food in its cheeks, and naps a lot.\" Which detail is true?","it runs on its wheel",["it can fly","it barks","it swims"]),
 ("mcq","Read: \"The storm was fierce: lightning flashed and wind bent the trees.\" Which detail shows it was fierce?","wind bent the trees",["it was sunny","it was Monday","we ate dinner"]),
 ("mcq","Read: \"Grandpa grows tomatoes, sunflowers, and sweet strawberries.\" Which does Grandpa grow?","strawberries",["a car","a boat","a kite"]),
 ("mcq","Read: \"At the museum we saw dinosaur bones, old coins, and paintings.\" Which detail is true?","we saw dinosaur bones",["the bus was late","lunch was good","it was sunny"]),
 ("mcq","Read: \"My brother carries groceries, walks the dog, and helps with homework.\" Which detail shows he helps?","he walks the dog",["he watches TV all day","he is tall","he likes pizza"]),
 ("mcq","Read: \"The beach was crowded: towels covered the sand and lines formed at the snack bar.\" Which shows it was crowded?","lines formed at the snack bar",["the sky was blue","it was July","we brought a ball"]),
 ("mcq","Read: \"The recipe was simple: three steps and four ingredients.\" Which detail shows it was simple?","three steps",["it tasted sweet","the bowl was red","Mom smiled"]),
 ("mcq","Read: \"Winter sports are fun. People ski, skate, and sled.\" Which is a winter sport in the text?","skating",["swimming","surfing","golf"]),
 ("mcq","Read: \"The party was lively: music played, kids danced, and balloons floated.\" Which detail shows it was lively?","kids danced",["it was quiet","it rained","it was empty"]),
 ("mcq","Read: \"Our teacher is kind: she helps us, listens, and smiles a lot.\" Which shows she is kind?","she listens",["she drives a car","school is big","math is hard"]),
 ("mcq","Read: \"We packed sandwiches, juice, and grapes for the picnic.\" Which food was packed?","grapes",["pizza","soup","cake"]),
 ("mcq","Read: \"The old house looked spooky: broken windows and a creaky door.\" Which shows it was spooky?","a creaky door",["it was for sale","the yard was big","the roof was flat"]),
 ("mcq","Read: \"Reading is great: it teaches words, takes you on adventures, and helps you relax.\" Which is a benefit in the text?","it teaches words",["it costs money","it is loud","it needs a TV"]),
 ("mcq","Read: \"The festival had music, tasty food, and games for kids.\" Which detail is true?","there were games for kids",["it was Tuesday","the town is small","cars were parked"]),
 ("fill","Read: \"Maya's bike is green.\" What color is Maya's bike? (one word)","green"),
 ("mcq","Read: \"Exercise makes your heart strong, builds muscles, and lifts your mood.\" Which is a benefit listed?","builds muscles",["takes time","is on TV","needs shoes"]),
 ("mcq","Read: \"The campsite had a lake, flat ground for tents, and a fire pit.\" Which detail is true?","it had a lake",["it had a mall","it had a pool","it had a train"]),
 ("mcq","Read: \"Dad fixed the bike with a wrench and some oil.\" What did Dad use?","a wrench and oil",["a spoon","glue","tape only"]),
 ("mcq","Read: \"The trip was educational: we saw bones, coins, and art.\" Which shows it was educational?","we saw bones, coins, and art",["the bus was late","lunch was tasty","it was hot"]),
],
"story-lesson": [
 ("mcq","Read: \"The hare bragged and napped during the race. The slow tortoise kept going and won.\" The lesson is:","slow and steady wins the race",["always nap","bragging is good","races are bad"]),
 ("mcq","Read: \"The ant worked all summer storing food. The grasshopper played and had none in winter.\" The lesson is:","plan ahead and work hard",["never work","winter is fun","play all day"]),
 ("mcq","Read: \"Maya kept trying to ride her bike, fell many times, but finally did it.\" The lesson is:","don't give up",["bikes are bad","falling is fun","stop trying"]),
 ("mcq","Read: \"Leo shared his snack, and his friend shared back the next day.\" The lesson is:","being kind comes back to you",["never share","food is bad","friends are mean"]),
 ("mcq","Read: \"The boy cried 'wolf' as a joke so often that no one believed him when it was real.\" The lesson is:","tell the truth",["jokes are great","wolves are nice","shout a lot"]),
 ("mcq","Read: \"Ana told the truth even though she was scared, and her mom was proud.\" The lesson is:","honesty is important",["hide mistakes","never speak","fear is bad"]),
 ("mcq","Read: \"The team practiced together and won by helping each other.\" The lesson is:","teamwork helps",["work alone","quit early","skip practice"]),
 ("mcq","Read: \"Sam was patient and waited his turn, so everyone had fun.\" The lesson is:","being patient is good",["push in line","never wait","fun is bad"]),
 ("mcq","Read: \"Pia saved her coins for weeks and bought the gift she wanted.\" The lesson is:","saving helps you reach a goal",["spend it all","goals are silly","never save"]),
 ("mcq","Read: \"The little engine kept saying 'I think I can' and climbed the big hill.\" The lesson is:","believe in yourself",["give up on hills","trains are bad","stop talking"]),
 ("mcq","Read: \"Ben helped a new student feel welcome, and they became best friends.\" The lesson is:","kindness makes friends",["ignore new kids","friends are bad","stay alone"]),
 ("mcq","Read: \"Zoe rushed her homework and made many mistakes; next time she took her time.\" The lesson is:","careful work is better than rushing",["rush always","homework is bad","never check"]),
 ("mcq","Read: \"The mouse helped the lion escape a net, proving small friends can help too.\" The lesson is:","even small friends can help",["big is best","never help","lions are mean"]),
 ("mcq","Read: \"Mia listened to advice and her plan worked much better.\" The lesson is:","listening to others can help",["ignore advice","plans are bad","talk only"]),
 ("mcq","Read: \"Tom shared the last cookie instead of keeping it, and felt good.\" The lesson is:","sharing feels good",["keep everything","cookies are bad","be greedy"]),
 ("fill","Read: \"The tortoise kept going slowly and beat the bragging hare.\" The lesson: slow and ____ wins the race. (one word)","steady"),
 ("mcq","Read: \"The crow dropped pebbles in the jar to raise the water and drink.\" The lesson is:","clever thinking solves problems",["give up when thirsty","jars are bad","never think"]),
 ("mcq","Read: \"Liz apologized after a mistake, and her friend forgave her.\" The lesson is:","saying sorry helps fix things",["never apologize","mistakes are great","ignore friends"]),
 ("mcq","Read: \"The farmer cared for his land every day and grew a big harvest.\" The lesson is:","hard work pays off",["skip work","land is bad","luck is all"]),
 ("mcq","Read: \"Two goats on a narrow bridge worked it out by taking turns.\" The lesson is:","cooperating solves problems",["push others off","never share","fight always"]),
],
"character-feelings": [
 ("mcq","Read: \"Tia smiled wide and hugged her trophy.\" How does Tia feel?","happy / proud",["sad","angry","scared"]),
 ("mcq","Read: \"Ben's eyes filled with tears when his balloon popped.\" How does Ben feel?","sad",["happy","excited","brave"]),
 ("mcq","Read: \"Mia stomped her feet and crossed her arms.\" How does Mia feel?","angry",["calm","happy","sleepy"]),
 ("mcq","Read: \"Leo hid under the blanket during the loud storm.\" How does Leo feel?","scared",["proud","bored","silly"]),
 ("mcq","Read: \"Ana jumped up and down when she heard the great news.\" How does Ana feel?","excited",["sad","angry","tired"]),
 ("mcq","Read: \"Sam yawned and rubbed his eyes at bedtime.\" How does Sam feel?","sleepy",["excited","angry","scared"]),
 ("mcq","Read: \"Pia frowned and sighed when recess was canceled.\" How does Pia feel?","disappointed",["thrilled","proud","sleepy"]),
 ("mcq","Read: \"Max laughed and grinned at the funny clown.\" How does Max feel?","happy",["angry","scared","sad"]),
 ("mcq","Read: \"Zoe's hands shook before her big speech.\" How does Zoe feel?","nervous",["bored","sleepy","angry"]),
 ("mcq","Read: \"Tom shared his toys and helped clean up with a smile.\" Tom is being:","kind",["mean","rude","lazy"]),
 ("mcq","Read: \"Liz tried the hard puzzle again and again without quitting.\" Liz is:","determined",["lazy","bored","scared"]),
 ("mcq","Read: \"The new kid stood alone and looked at the ground quietly.\" The kid seems:","shy or lonely",["excited","angry","silly"]),
 ("mcq","Read: \"Ravi cheered and high-fived his teammates after the goal.\" How does Ravi feel?","happy / excited",["sad","sleepy","scared"]),
 ("mcq","Read: \"Nina gasped and stepped back when she saw the spider.\" How does Nina feel?","surprised / scared",["calm","proud","bored"]),
 ("mcq","Read: \"Sam waited patiently for his turn without complaining.\" Sam is:","patient",["rude","angry","greedy"]),
 ("fill","Read: \"Tia grinned and hugged her trophy.\" Tia feels ____. (one word)","happy"),
 ("mcq","Read: \"Lily wiped her eyes and missed her old friend.\" How does Lily feel?","sad",["excited","angry","silly"]),
 ("mcq","Read: \"Ben checked under the bed twice before sleeping.\" Ben feels:","a little scared",["very brave","very happy","very bored"]),
 ("mcq","Read: \"Ana helped her grandma and felt warm inside.\" Ana feels:","good / proud",["angry","bored","scared"]),
 ("mcq","Read: \"Max pumped his fist and shouted 'Yes!' when he won.\" How does Max feel?","excited",["sad","tired","shy"]),
],
"sequence": [
 ("mcq","Read: \"First Ana woke up. Next she ate. Then she went to school.\" What did Ana do FIRST?","woke up",["ate","went to school","slept"]),
 ("mcq","Read: \"He read the recipe, gathered the food, then cooked.\" What did he do BEFORE cooking?","gathered the food",["ate dessert","washed up","set the table"]),
 ("mcq","Read: \"The caterpillar ate leaves, made a chrysalis, then became a butterfly.\" What happened LAST?","it became a butterfly",["it ate leaves","it made a chrysalis","it laid eggs"]),
 ("mcq","Read: \"We bought tickets, found our seats, and watched the show.\" What came SECOND?","found our seats",["bought tickets","watched the show","went home"]),
 ("mcq","Read: \"First fill the pot, next turn on the stove, then add pasta.\" What is the SECOND step?","turn on the stove",["add pasta","fill the pot","eat"]),
 ("mcq","Read: \"She drew a picture, colored it, then hung it up.\" What did she do LAST?","hung it up",["drew it","colored it","erased it"]),
 ("mcq","Read: \"The bell rang, the kids lined up, then they walked in.\" What happened FIRST?","the bell rang",["kids walked in","kids lined up","class ended"]),
 ("mcq","Read: \"We washed the car, dried it, then waxed it.\" What came right after washing?","drying it",["waxing it","driving it","parking it"]),
 ("mcq","Read: \"Plant the seed, water it, then watch it grow.\" What is the LAST step?","watch it grow",["plant the seed","water it","pick it"]),
 ("mcq","Read: \"He tied his shoes, grabbed his ball, and ran outside.\" What did he do LAST?","ran outside",["tied his shoes","grabbed his ball","sat down"]),
 ("mcq","Read: \"The sun set, the stars came out, and we fell asleep.\" What happened FIRST?","the sun set",["we fell asleep","the stars came out","the sun rose"]),
 ("mcq","Read: \"Mix the batter, pour it in a pan, then bake.\" What do you do right after mixing?","pour it in a pan",["bake","eat","wash dishes"]),
 ("mcq","Read: \"We packed a bag, drove to camp, then set up the tent.\" What came SECOND?","drove to camp",["packed a bag","set up the tent","slept"]),
 ("mcq","Read: \"The seed sprouted, grew leaves, then bloomed.\" What happened SECOND?","grew leaves",["sprouted","bloomed","was picked"]),
 ("mcq","Read: \"She wrote the letter, sealed it, then mailed it.\" What did she do LAST?","mailed it",["wrote it","sealed it","read it"]),
 ("fill","Read: \"First we eat, then we play.\" What do we do first? (one word)","eat"),
 ("mcq","Read: \"The alarm rang, Dad got up, then made coffee.\" What happened FIRST?","the alarm rang",["Dad made coffee","Dad got up","Dad left"]),
 ("mcq","Read: \"He picked apples, washed them, then made a pie.\" What did he do BEFORE the pie?","washed the apples",["ate the pie","sold apples","planted a tree"]),
 ("mcq","Read: \"We climbed the hill, ate lunch, then rolled down.\" What did we do right after climbing?","ate lunch",["rolled down","slept","drove home"]),
 ("mcq","Read: \"Turn off the lights, climb into bed, then fall asleep.\" What is the FIRST step?","turn off the lights",["fall asleep","climb into bed","wake up"]),
],
"cause-and-effect": [
 ("mcq","Read: \"It rained all day, so the game was canceled.\" What was the CAUSE?","it rained all day",["the game was canceled","the team won","the sun came out"]),
 ("mcq","Read: \"Tom forgot to water his plant, so it wilted.\" What was the EFFECT?","the plant wilted",["Tom watered it","the plant grew","Tom forgot"]),
 ("mcq","Read: \"The ice melted because the day was hot.\" Why did the ice melt?","the day was hot",["the ice was blue","it was winter","the freezer broke"]),
 ("mcq","Read: \"She studied hard, so she passed the test.\" What caused her to pass?","she studied hard",["the test was easy","she was late","she slept"]),
 ("mcq","Read: \"The dog barked loudly, so the baby woke up.\" What was the effect of the barking?","the baby woke up",["the dog slept","the baby ate","the dog ran"]),
 ("mcq","Read: \"Because the road was icy, the cars drove slowly.\" Why did the cars drive slowly?","the road was icy",["the cars were red","it was sunny","the road was new"]),
 ("mcq","Read: \"He left the milk out, so it spoiled.\" What was the cause of the milk spoiling?","he left the milk out",["the milk was cold","the fridge was full","he drank it"]),
 ("mcq","Read: \"The wind blew hard, so the kite flew high.\" What made the kite fly high?","the wind blew hard",["the kite was heavy","it rained","the string broke"]),
 ("mcq","Read: \"Because the library was closed, we went to the park.\" What was the effect?","they went to the park",["the library opened","they read books","they stayed home"]),
 ("mcq","Read: \"The fire alarm rang, so everyone left the building.\" What was the cause?","the fire alarm rang",["everyone left","it was lunch","the lights were on"]),
 ("mcq","Read: \"She watered the seeds, so they sprouted.\" What was the effect?","the seeds sprouted",["the seeds dried up","nothing grew","it snowed"]),
 ("mcq","Read: \"Max practiced every day, so he got better.\" What caused him to improve?","he practiced every day",["he quit","he slept","it was easy"]),
 ("mcq","Read: \"It snowed all night, so school was closed.\" Why was school closed?","it snowed all night",["it was summer","it was sunny","it was Friday"]),
 ("mcq","Read: \"He dropped the glass, so it shattered.\" What was the effect?","the glass shattered",["it floated","it grew","nothing"]),
 ("mcq","Read: \"Because it was cold, she wore a coat.\" Why did she wear a coat?","it was cold",["it was hot","it was sunny","it was loud"]),
 ("fill","Read: \"It rained for hours, so the river ____ over its banks.\" Fill the effect word. (one word)","flooded"),
 ("mcq","Read: \"The baby was sleepy, so she cried.\" Why did the baby cry?","she was sleepy",["she was happy","she ate","she ran"]),
 ("mcq","Read: \"He studied the map, so he didn't get lost.\" Why didn't he get lost?","he studied the map",["he ran","he closed his eyes","he was tired"]),
 ("mcq","Read: \"The volcano erupted, so people moved away.\" What was the cause?","the volcano erupted",["it was lunch","the road was new","the sky was blue"]),
 ("mcq","Read: \"She turned off the light, so the room got dark.\" What made the room dark?","turning off the light",["the sun","the lamp on","the window"]),
],
"context-clues": [
 ("mcq","Read: \"The path was narrow, so only one person could pass.\" What does \"narrow\" mean?","not wide",["very tall","bright","heavy"]),
 ("mcq","Read: \"The soup was scalding, so she let it cool.\" What does \"scalding\" mean?","very hot",["very cold","tasty","empty"]),
 ("mcq","Read: \"He was exhausted after the long run.\" What does \"exhausted\" mean?","very tired",["excited","hungry","angry"]),
 ("mcq","Read: \"The ancient ruins were thousands of years old.\" What does \"ancient\" mean?","very old",["brand new","colorful","tiny"]),
 ("mcq","Read: \"The timid puppy hid behind the couch.\" What does \"timid\" mean?","shy or fearful",["loud","huge","fast"]),
 ("mcq","Read: \"The enormous elephant was the biggest animal there.\" What does \"enormous\" mean?","very large",["very small","very fast","very quiet"]),
 ("mcq","Read: \"After the drought, the land had no water for months.\" What does \"drought\" mean?","a long time with no rain",["a big flood","a snowstorm","a forest"]),
 ("mcq","Read: \"He was generous and shared his lunch.\" What does \"generous\" mean?","willing to share",["selfish","tired","mean"]),
 ("mcq","Read: \"The room was vacant; nobody was inside.\" What does \"vacant\" mean?","empty",["full","loud","bright"]),
 ("mcq","Read: \"The fragile vase broke when it slipped.\" What does \"fragile\" mean?","easily broken",["very heavy","brightly colored","very old"]),
 ("mcq","Read: \"He gobbled his food because he was famished.\" What does \"famished\" mean?","very hungry",["very full","very tired","very tall"]),
 ("mcq","Read: \"The cautious driver slowed near the school.\" What does \"cautious\" mean?","careful",["reckless","sleepy","angry"]),
 ("mcq","Read: \"The aroma of fresh bread filled the room.\" What does \"aroma\" mean?","a smell",["a sound","a color","a price"]),
 ("mcq","Read: \"She felt feeble and could barely stand.\" What does \"feeble\" mean?","weak",["strong","fast","happy"]),
 ("mcq","Read: \"The instructions were vague, so nobody knew what to do.\" What does \"vague\" mean?","not clear",["very clear","very loud","colorful"]),
 ("fill","Read: \"The path was visible even at night because of the bright moon.\" \"Visible\" means able to be ____. (one word)","seen"),
 ("mcq","Read: \"The two friends were inseparable and went everywhere together.\" What does \"inseparable\" mean?","always together",["far apart","angry","silent"]),
 ("mcq","Read: \"He was furious and stomped his feet.\" What does \"furious\" mean?","very angry",["very happy","very calm","very sleepy"]),
 ("mcq","Read: \"The damp towel was still a little wet.\" What does \"damp\" mean?","slightly wet",["bone dry","frozen","on fire"]),
 ("mcq","Read: \"She was thrilled to win the prize.\" What does \"thrilled\" mean?","very excited",["very bored","very upset","very tired"]),
],
"synonyms-and-antonyms": [
 ("mcq","Which word means almost the same as \"happy\"?","glad",["sad","angry","tired"]),
 ("mcq","Which word is the OPPOSITE of \"big\"?","small",["large","huge","giant"]),
 ("mcq","A synonym for \"fast\" is:","quick",["slow","late","still"]),
 ("mcq","The opposite of \"hot\" is:","cold",["warm","boiling","sunny"]),
 ("mcq","A synonym for \"begin\" is:","start",["stop","end","finish"]),
 ("mcq","An antonym for \"empty\" is:","full",["bare","hollow","vacant"]),
 ("mcq","A synonym for \"smart\" is:","clever",["silly","slow","lazy"]),
 ("mcq","The opposite of \"day\" is:","night",["noon","morning","sunrise"]),
 ("mcq","A synonym for \"tired\" is:","sleepy",["awake","alert","lively"]),
 ("mcq","An antonym for \"loud\" is:","quiet",["noisy","booming","blaring"]),
 ("mcq","A synonym for \"little\" is:","small",["huge","tall","wide"]),
 ("mcq","The opposite of \"open\" is:","closed",["wide","ajar","unlocked"]),
 ("mcq","A synonym for \"pretty\" is:","beautiful",["ugly","plain","dull"]),
 ("mcq","The opposite of \"start\" is:","stop",["begin","launch","open"]),
 ("mcq","A synonym for \"angry\" is:","mad",["calm","happy","sleepy"]),
 ("fill","Write a one-word ANTONYM (opposite) of \"up\". ","down"),
 ("mcq","A synonym for \"jump\" is:","leap",["sit","crawl","stand"]),
 ("mcq","The opposite of \"wet\" is:","dry",["soggy","damp","moist"]),
 ("mcq","A synonym for \"easy\" is:","simple",["hard","tricky","tough"]),
 ("mcq","The opposite of \"full\" is:","empty",["packed","stuffed","loaded"]),
],
"fact-and-opinion": [
 ("mcq","Which sentence is a FACT?","Water freezes when it gets very cold.",["Winter is the best season.","Pizza tastes amazing.","Blue is the prettiest color."]),
 ("mcq","Which sentence is an OPINION?","Recess is the most fun part of the day.",["A week has seven days.","The Sun is a star.","Spiders have eight legs."]),
 ("mcq","Which is a FACT?","A triangle has three sides.",["Math is boring.","Dogs are better than cats.","Summer is too hot."]),
 ("mcq","Which is an OPINION?","Chocolate is the best flavor.",["Ice melts when heated.","There are 12 months.","Plants need sunlight."]),
 ("mcq","\"Our school has 300 students.\" This is a:","fact",["opinion","question","story"]),
 ("mcq","\"Reading is more fun than TV.\" This is an:","opinion",["fact","rule","number"]),
 ("mcq","Which can be checked to see if it is true?","The library opens at 9 a.m.",["Mondays are terrible.","This book is the best.","Green is a happy color."]),
 ("mcq","Which word often signals an opinion?","best",["measured","equals","contains"]),
 ("mcq","Which is a FACT?","Elephants are very large animals.",["Elephants are cute.","Zoos are boring.","Lions are scary."]),
 ("mcq","Which is an OPINION?","Vanilla is better than chocolate.",["Ice is frozen water.","Cows eat grass.","A year has seasons."]),
 ("mcq","Which is a FACT?","Bees make honey.",["Bees are scary.","Honey is the tastiest.","Bugs are gross."]),
 ("mcq","Which is an OPINION?","Math class is too hard.",["Ten is an even number.","Birds lay eggs.","The library has books."]),
 ("mcq","\"The cat is black.\" This is a:","fact",["opinion","joke","rule"]),
 ("mcq","\"Black cats are the prettiest.\" This is an:","opinion",["fact","number","rule"]),
 ("mcq","Which is a FACT you can check?","The park is on Oak Street.",["Parks are boring.","Swings are the best.","Grass is dull."]),
 ("fill","A statement that tells what someone feels and can't be proven is an ____. (one word)","opinion"),
 ("mcq","Which is a FACT?","An apple is a fruit.",["Apples taste the best.","Red apples are prettiest.","Fruit is boring."]),
 ("mcq","Which is an OPINION?","Snow days are the best.",["Snow is cold.","Snow is frozen water.","Snow is white."]),
 ("mcq","Which signals an opinion?","favorite",["arrived","measured","counted"]),
 ("mcq","Which is a FACT?","Fish live in water.",["Fish are boring.","Sharks are mean.","The ocean is scary."]),
],
"compare-texts": [
 ("mcq","One book says dogs make great pets; another says cats do. Both books are about:","good pets",["cars","weather","sports"]),
 ("mcq","Two stories both have a brave hero, but one is in space and one is under the sea. They are alike because both have:","a brave hero",["a spaceship","an ocean","a dragon"]),
 ("mcq","Book A is about how rain forms; Book B is about how snow forms. Both are about:","kinds of weather",["animals","sports","food"]),
 ("mcq","One text says summer is best; another says winter is best. They differ on the best:","season",["color","number","letter"]),
 ("mcq","Two articles describe bees and butterflies. Both insects:","help pollinate flowers",["live in water","have fur","bark"]),
 ("mcq","Story 1 ends happily; Story 2 ends sadly. They differ in their:","ending",["title only","number of pages only","author's name"]),
 ("mcq","Both texts explain how to plant a garden. They are both meant to:","teach you how to do something",["tell a funny story","sell toys","report news only"]),
 ("mcq","One poem rhymes; the other does not. A difference between them is:","whether they rhyme",["both are about cats","both are short","both have a title"]),
 ("mcq","Two books about the ocean both mention:","sea animals",["deserts","mountains","cities only"]),
 ("mcq","Article A says exercise is healthy; Article B says sleep is healthy. Both are about staying:","healthy",["rich","famous","busy"]),
 ("mcq","Two fables both teach a lesson. They are alike because both have:","a moral / lesson",["the same animals","the same author","the same length"]),
 ("mcq","Book 1 is set in a city; Book 2 is set on a farm. They differ in their:","setting",["language","number of words","cover color only"]),
 ("mcq","Both texts describe penguins. A fact in both might be that penguins:","live where it is cold",["live in deserts","can fly high","eat grass"]),
 ("mcq","One recipe makes cookies; another makes bread. Both recipes:","give steps to follow",["tell a story","sell a toy","report scores"]),
 ("mcq","Two stories about friendship both show that friends should:","help each other",["never talk","be mean","stay apart"]),
 ("fill","If two books are both about space, their shared topic is ____. (one word)","space"),
 ("mcq","Text A is a true report; Text B is a made-up story. They differ because one is:","real and one is fiction",["longer only","shorter only","colorful only"]),
 ("mcq","Both maps show the same town. They are alike because both show:","the town's places",["the future","the weather","a story"]),
 ("mcq","One song is happy and fast; another is slow and sad. They differ in their:","mood",["title only","singer's name","number of words"]),
 ("mcq","Two articles about recycling both say it helps:","the Earth",["cars go faster","TVs work","phones charge"]),
],
}


# ===================================================== TOPIC REGISTRY (grade 2)

TOPICS2 = [
 # ---- MATH ----
 ("math","place-value-to-1000","Place Value to 1000","2.NBT.A.1",
  "A three-digit number is made of hundreds, tens, and ones. In 482 the 4 means 400.", g2_place_value),
 ("math","addition-within-100","Addition within 100","2.NBT.B.5",
  "Add two-digit numbers, regrouping ones into a ten when needed.", g2_add100),
 ("math","subtraction-within-100","Subtraction within 100","2.NBT.B.5",
  "Subtract two-digit numbers, regrouping a ten into ones when needed.", g2_sub100),
 ("math","add-subtract-within-1000","Add & Subtract within 1000","2.NBT.B.7",
  "Add and subtract three-digit numbers using hundreds, tens, and ones.", g2_add_sub_1000),
 ("math","skip-counting","Skip Counting","2.NBT.A.2",
  "Count by 2s, 5s, 10s, and 100s to find what comes next.", g2_skip_count),
 ("math","comparing-numbers","Comparing Numbers","2.NBT.A.4",
  "Compare three-digit numbers to tell which is greater or less.", g2_compare),
 ("math","arrays","Arrays & Equal Groups","2.OA.C.4",
  "An array has equal rows. Add the rows up (or multiply) to find the total.", g2_arrays),
 ("math","money","Money","2.MD.C.8",
  "Count coins: a quarter is 25 cents, a dime 10, a nickel 5, and a penny 1.", g2_money),
 ("math","telling-time","Telling Time (5 min)","2.MD.C.7",
  "Read clocks to the nearest five minutes, like 4:15 or 7:30.", g2_time5),
 ("math","even-and-odd","Even & Odd","2.OA.C.3",
  "Even numbers can be split into two equal groups; odd numbers have one left over.", g2_even_odd),
 # ---- SCIENCE ----
 ("science","properties-of-materials","Properties of Materials","2-PS1-1",
  "Materials have properties like hardness, color, texture, and flexibility that suit different jobs.", SCIENCE2["properties-of-materials"]),
 ("science","solids-and-liquids","Solids & Liquids","2-PS1-1",
  "Solids keep their shape; liquids take the shape of their container.", SCIENCE2["solids-and-liquids"]),
 ("science","changing-materials","Changing Materials","2-PS1-4",
  "Heating and cooling change materials. Some changes can be undone; some cannot.", SCIENCE2["changing-materials"]),
 ("science","plants-need-sun-and-water","What Plants Need","2-LS2-1",
  "Plants need water and sunlight to grow and make their own food.", SCIENCE2["plants-need-sun-and-water"]),
 ("science","seeds-and-pollination","Seeds & Pollination","2-LS2-2",
  "Animals and wind help plants by moving pollen and spreading seeds to new places.", SCIENCE2["seeds-and-pollination"]),
 ("science","habitats-and-diversity","Habitats & Diversity","2-LS4-1",
  "Different habitats are home to many different kinds of plants and animals.", SCIENCE2["habitats-and-diversity"]),
 ("science","fast-and-slow-earth-changes","Fast & Slow Earth Changes","2-ESS1-1",
  "Some land changes happen quickly (volcanoes, floods) and some slowly (erosion).", SCIENCE2["fast-and-slow-earth-changes"]),
 ("science","landforms-and-maps","Landforms & Maps","2-ESS2-2",
  "Earth has mountains, valleys, rivers, and oceans, and maps show where they are.", SCIENCE2["landforms-and-maps"]),
 ("science","water-on-earth","Water on Earth","2-ESS2-3",
  "Water is found in oceans, lakes, rivers, ice, and underground; ocean water is salty.", SCIENCE2["water-on-earth"]),
 ("science","wind-and-water-shape-land","Wind & Water Shape Land","2-ESS2-1",
  "Wind and water slowly wear away and move soil and rock, changing the land.", SCIENCE2["wind-and-water-shape-land"]),
 # ---- READING ----
 ("reading","main-idea","Main Idea","RI.2.2",
  "The main idea is the most important point a text makes.", READING2["main-idea"]),
 ("reading","key-details","Key Details","RI.2.1",
  "Key details are the facts that tell more about the main idea.", READING2["key-details"]),
 ("reading","story-lesson","Story Lessons","RL.2.2",
  "Many stories teach a lesson or moral about how to live or treat others.", READING2["story-lesson"]),
 ("reading","character-feelings","Character Feelings","RL.2.3",
  "Look at what characters do and say to understand how they feel.", READING2["character-feelings"]),
 ("reading","sequence","Sequence of Events","RL.2.3",
  "Sequence is the order things happen: first, next, then, and last.", READING2["sequence"]),
 ("reading","cause-and-effect","Cause & Effect","RI.2.3",
  "A cause is why something happens; the effect is what happens.", READING2["cause-and-effect"]),
 ("reading","context-clues","Vocabulary in Context","RI.2.4",
  "Use the words around an unknown word to figure out its meaning.", READING2["context-clues"]),
 ("reading","synonyms-and-antonyms","Synonyms & Antonyms","L.2.5",
  "Synonyms mean almost the same; antonyms mean the opposite.", READING2["synonyms-and-antonyms"]),
 ("reading","fact-and-opinion","Fact vs. Opinion","RI.2.8",
  "A fact can be proven; an opinion tells what someone feels.", READING2["fact-and-opinion"]),
 ("reading","compare-texts","Comparing Texts","RI.2.9",
  "We can compare two texts to see how they are alike and different.", READING2["compare-texts"]),
 # ---- WRITING (reuses the shared grammar generators) ----
 ("writing","nouns","Nouns","L.2.1",
  "A noun names a person, place, thing, or idea.", g_nouns),
 ("writing","action-verbs","Action Verbs","L.2.1",
  "A verb shows action — what the subject does.", g_verbs),
 ("writing","adjectives","Adjectives","L.2.1",
  "An adjective describes a noun, telling what kind or how many.", g_adjectives),
 ("writing","pronouns","Pronouns","L.2.1",
  "A pronoun takes the place of a noun, like he, she, it, or they.", g_pronouns),
 ("writing","subject-verb-agreement","Subject-Verb Agreement","L.2.1",
  "The verb must match the subject, like 'The dog runs.'", g_subject_verb),
 ("writing","past-tense-verbs","Past-Tense Verbs","L.2.1",
  "Past-tense verbs tell about something that already happened.", g_past_tense),
 ("writing","plural-nouns","Plural Nouns","L.2.1",
  "Plurals mean more than one. Add -s or -es, or change y to -ies.", g_plurals),
 ("writing","capitalization","Capitalization","L.2.2",
  "Capitalize the first word of a sentence, the word I, and proper nouns.", g_capitalization),
 ("writing","end-punctuation","End Punctuation","L.2.2",
  "End a sentence with a period, question mark, or exclamation point.", g_end_punctuation),
 ("writing","commas-in-a-series","Commas in a Series","L.2.2",
  "Use commas to separate three or more items in a list.", g_commas_series),
]


if __name__ == "__main__":
    print(emit_curriculum(2, TOPICS2))
