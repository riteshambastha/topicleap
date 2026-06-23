#!/usr/bin/env python3
"""
TopicLeap Grade 6 curriculum seed generator.

Same engine as Grade 5: math is computed with 4 difficulty bands (worksheets
get harder) and de-duplicated; grammar is reused; science + reading are
authored. 4 subjects x 10 topics x 20 questions, worksheets of 5.

Usage:
    python3 scripts/generate_grade6.py > supabase/seed/grade6_curriculum.sql
"""
import math
import random
from decimal import Decimal
from fractions import Fraction

from generate_seed import (
    emit_curriculum, fill, mcq,
    g_nouns, g_verbs, g_adjectives, g_pronouns, g_subject_verb,
    g_past_tense, g_plurals, g_capitalization, g_end_punctuation, g_commas_series,
)
from generate_grade5 import gen_unique, _distractors, dstr, _fstr, G


# ============================================================ MATH (computed)

def m_ratios(band, rng):
    hi = [10, 20, 40, 99][band]
    a, b = rng.randint(2, hi), rng.randint(2, hi)
    things = rng.choice([("red", "blue"), ("cats", "dogs"), ("apples", "oranges"),
                         ("boys", "girls"), ("wins", "losses")])
    return fill(f"There are {a} {things[0]} and {b} {things[1]}. Write the ratio "
                f"of {things[0]} to {things[1]} (use a colon, like 3:4).",
                f"{a}:{b}")


def m_unit_rate(band, rng):
    h = rng.randint(2, [5, 8, 12, 20][band])
    rate = rng.randint([2, 5, 8, 12][band], [9, 20, 40, 80][band])
    total = h * rate
    return fill(f"A car travels {total} miles in {h} hours at a steady speed. "
                f"How many miles per hour is that?", rate)


def m_percent(band, rng):
    nbase = [100, 200, 400, 1000][band]
    n = nbase * rng.randint(1, 3)
    p = rng.choice([[10, 25, 50][:],
                    [10, 20, 25, 50, 75],
                    [5, 15, 30, 40, 60],
                    [12, 35, 45, 80, 90]][band])
    p = rng.choice(p) if isinstance(p, list) else p
    return fill(f"What is {p}% of {n}?", p * n // 100)


def m_divide_fractions(band, rng):
    pools = [[2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6], [4, 5, 6, 8]][band]
    b, d = rng.choice(pools), rng.choice(pools)
    a, c = rng.randint(1, b - 1), rng.randint(1, d - 1)
    correct = Fraction(a, b) / Fraction(c, d)
    wrong = [_fstr(Fraction(a * c, b * d)), f"{a * d}/{b + c}", f"{a + d}/{b + c}"]
    return mcq(f"{a}/{b} / {c}/{d} = ?  (divide the fractions)",
               _fstr(correct), _distractors(_fstr(correct), wrong, rng), rng)


def m_decimal_ops(band, rng):
    places = [1, 1, 2, 2][band]
    scale = Decimal(10) ** places
    a = Decimal(rng.randint(2, [50, 90, 90, 300][band])) / scale
    b = Decimal(rng.randint(2, 9)) / (Decimal(10) ** rng.randint(1, places))
    op = rng.choice([["+", "-"], ["+", "-", "x"], ["+", "-", "x"], ["+", "-", "x"]][band])
    if op == "+":
        correct = a + b
    elif op == "-":
        if b > a:
            a, b = b, a
        correct = a - b
    else:
        correct = a * b
    cands = [dstr(correct + Decimal("0.1")), dstr(correct - Decimal("0.1")),
             dstr(correct * 10), dstr(a)]
    return mcq(f"{dstr(a)} {op} {dstr(b)} = ?", dstr(correct),
               _distractors(dstr(correct), cands, rng), rng)


def m_gcf_lcm(band, rng):
    hi = [12, 20, 40, 80][band]
    a, b = rng.randint(2, hi), rng.randint(2, hi)
    if rng.random() < 0.5:
        return fill(f"What is the GCF (greatest common factor) of {a} and {b}?",
                    math.gcd(a, b))
    return fill(f"What is the LCM (least common multiple) of {a} and {b}?",
                a * b // math.gcd(a, b))


def m_integers(band, rng):
    hi = [9, 20, 50, 99][band]
    if rng.random() < 0.4:
        x = rng.randint(1, hi)
        return fill(f"What is the absolute value |-{x}| ?", x)
    a, b = rng.randint(1, hi), rng.randint(1, hi)
    if rng.random() < 0.5:
        return fill(f"What is -{a} + {b} ?", -a + b)
    return fill(f"What is {a} - {b} - {b} ?", a - b - b)


def m_exponents(band, rng):
    pools = [
        [(b, 2) for b in range(2, 8)],                          # easy squares
        [(b, 2) for b in range(8, 14)],                         # bigger squares
        [(b, 3) for b in range(2, 8)],                          # cubes
        [(b, 3) for b in range(8, 11)] + [(2, 4), (3, 4), (4, 4), (2, 5), (3, 5)],
    ][band]
    base, e = rng.choice(pools)
    return fill(f"What is {base}^{e} (that is {base} to the power {e})?", base ** e)


def m_evaluate(band, rng):
    if band == 0:
        a, b, v = rng.randint(2, 6), rng.randint(1, 9), rng.randint(2, 9)
        return fill(f"Evaluate {a}x + {b} when x = {v}.", a * v + b)
    if band == 1:
        a, b, v = rng.randint(2, 8), rng.randint(1, 9), rng.randint(3, 12)
        return fill(f"Evaluate {a}x - {b} when x = {v}.", a * v - b)
    if band == 2:
        a, b, x, y = rng.randint(2, 6), rng.randint(2, 6), rng.randint(2, 9), rng.randint(2, 9)
        return fill(f"Evaluate {a}x + {b}y when x = {x} and y = {y}.", a * x + b * y)
    a, b, v = rng.randint(2, 5), rng.randint(1, 9), rng.randint(2, 6)
    return fill(f"Evaluate {a}x^2 + {b} when x = {v}.", a * v * v + b)


def m_one_step(band, rng):
    if band == 0:
        a = rng.randint(2, 12); x = rng.randint(2, 15)
        return fill(f"Solve for x:  x + {a} = {x + a}", x)
    if band == 1:
        a = rng.randint(2, 20); x = rng.randint(2, 20)
        return fill(f"Solve for x:  x - {a} = {x - a}", x)
    if band == 2:
        a = rng.randint(2, 9); x = rng.randint(2, 12)
        return fill(f"Solve for x:  {a}x = {a * x}", x)
    a = rng.randint(2, 9); r = rng.randint(2, 12)
    return fill(f"Solve for x:  x / {a} = {r}", a * r)


# ================================================= SCIENCE (authored, MS gr. 6)

SCIENCE6 = {
"cells": [
 ("mcq","The basic building block of all living things is the:","cell",["atom","molecule","organ"]),
 ("mcq","Living things made of many cells are called:","multicellular",["unicellular","nonliving","atoms"]),
 ("mcq","A living thing made of only one cell is:","unicellular",["multicellular","an organ","a tissue"]),
 ("mcq","The part of the cell that controls its activities is the:","nucleus",["cell wall","vacuole","ribosome"]),
 ("mcq","Plant cells have a stiff outer layer that animal cells lack, the:","cell wall",["nucleus","cytoplasm","membrane"]),
 ("mcq","The thin layer that controls what enters and leaves a cell is the:","cell membrane",["cell wall","nucleus","vacuole"]),
 ("mcq","Green organelles where plant cells make food are:","chloroplasts",["mitochondria","nuclei","vacuoles"]),
 ("mcq","The 'powerhouses' that release energy from food are:","mitochondria",["chloroplasts","ribosomes","vacuoles"]),
 ("mcq","A group of similar cells working together forms a:","tissue",["organ","organism","molecule"]),
 ("mcq","Organs working together form an:","organ system",["a single cell","a tissue only","an atom"]),
 ("mcq","Which can you NOT see with your eyes alone, needing a microscope?","most cells",["a tree","a dog","a hand"]),
 ("mcq","The jelly-like fluid filling a cell is the:","cytoplasm",["nucleus","membrane","wall"]),
 ("mcq","Both plant and animal cells have a:","nucleus and cell membrane",["cell wall","chloroplasts","no parts"]),
 ("mcq","Cells come from:","other living cells",["nonliving rocks","thin air","sunlight only"]),
 ("mcq","The correct order from smallest to largest is:","cell, tissue, organ, organ system",["organ, cell, tissue","tissue, cell, organ","organ system, organ, cell"]),
 ("fill","The basic unit of life is the ____. (one word)","cell"),
 ("mcq","A vacuole in a cell is used mainly to:","store water and materials",["release energy","make the cell wall","control the cell"]),
 ("mcq","Plant cells differ from animal cells because plant cells have:","a cell wall and chloroplasts",["a nucleus","cytoplasm","a membrane"]),
 ("mcq","Why are mitochondria important to a cell?","they provide usable energy",["they store the nucleus","they make sunlight","they are the cell wall"]),
 ("mcq","The idea that all living things are made of cells is part of the:","cell theory",["rock cycle","food web","water cycle"]),
],
"body-systems": [
 ("mcq","The system that pumps blood through the body is the:","circulatory system",["digestive system","nervous system","skeletal system"]),
 ("mcq","The system that breaks down food into nutrients is the:","digestive system",["respiratory system","skeletal system","muscular system"]),
 ("mcq","The system that takes in oxygen and removes carbon dioxide is the:","respiratory system",["digestive system","nervous system","skeletal system"]),
 ("mcq","Bones that support and protect the body make up the:","skeletal system",["muscular system","nervous system","digestive system"]),
 ("mcq","Muscles that let the body move are part of the:","muscular system",["skeletal system","nervous system","circulatory system"]),
 ("mcq","The brain, spinal cord, and nerves form the:","nervous system",["circulatory system","digestive system","respiratory system"]),
 ("mcq","The organ that pumps blood is the:","heart",["lungs","stomach","brain"]),
 ("mcq","The main organs for breathing are the:","lungs",["kidneys","stomach","heart"]),
 ("mcq","Blood carries oxygen and nutrients to the body's:","cells",["bones only","brain only","skin only"]),
 ("mcq","The system that controls and coordinates the body is the:","nervous system",["skeletal system","muscular system","digestive system"]),
 ("mcq","The skeletal and muscular systems work together to allow:","movement",["digestion","breathing only","thinking only"]),
 ("mcq","Where does most absorption of nutrients happen?","the small intestine",["the lungs","the heart","the brain"]),
 ("mcq","The respiratory and circulatory systems work together to deliver:","oxygen to cells",["bones to muscles","food to the brain only","light to the eyes"]),
 ("mcq","The organ that filters waste from the blood is the:","kidney",["lung","heart","stomach"]),
 ("mcq","Body systems are made of organs, which are made of:","tissues and cells",["atoms only","rocks","minerals"]),
 ("fill","The body system that pumps blood is the ____ system. (one word)","circulatory"),
 ("mcq","When you exercise, your heart beats faster to:","deliver more oxygen to muscles",["digest food faster","grow bones","cool the brain only"]),
 ("mcq","The nervous system sends signals using:","nerves",["blood vessels only","bones","muscles only"]),
 ("mcq","Which two systems most directly work together when you run?","muscular and skeletal",["digestive and nervous","none","only the skin"]),
 ("mcq","Organ systems work together to keep the body:","alive and balanced",["asleep","cold","still"]),
],
"ecosystems-and-energy": [
 ("mcq","Energy enters most ecosystems from the:","Sun",["soil","wind","Moon"]),
 ("mcq","Organisms that make their own food are:","producers",["consumers","decomposers","predators"]),
 ("mcq","Organisms that eat other organisms are:","consumers",["producers","minerals","rocks"]),
 ("mcq","Organisms that break down dead matter are:","decomposers",["producers","predators","herbivores"]),
 ("mcq","In a food chain, arrows show the flow of:","energy",["water","air","money"]),
 ("mcq","At each step of a food chain, most energy is lost as:","heat",["matter","light","sound"]),
 ("mcq","Because energy is lost at each level, top predators are usually:","fewer in number",["more numerous","plants","decomposers"]),
 ("mcq","A diagram showing many connected food chains is a:","food web",["water cycle","rock cycle","timeline"]),
 ("mcq","The role an organism plays in its ecosystem is its:","niche",["habitat only","name","color"]),
 ("mcq","Two species competing for the same limited resource shows:","competition",["cooperation only","decomposition","photosynthesis"]),
 ("mcq","Removing a keystone species can cause an ecosystem to:","change dramatically",["stay exactly the same","gain energy","make sunlight"]),
 ("mcq","Matter such as carbon and water is:","cycled through ecosystems",["created each day","destroyed","only in plants"]),
 ("mcq","A relationship where both species benefit is:","mutualism",["competition","predation","none"]),
 ("mcq","If producers disappeared, consumers would:","lose their energy source",["thrive","become producers","make their own food"]),
 ("mcq","An energy pyramid is widest at the:","bottom (producers)",["top (predators)","middle","it is even"]),
 ("fill","Organisms that make their own food are called ____. (one word)","producers"),
 ("mcq","Decomposers are important because they:","recycle nutrients into the soil",["produce sunlight","eat only producers","make rocks"]),
 ("mcq","The amount of available energy decreases as you move:","up the food chain",["down the food chain","into producers","into the Sun"]),
 ("mcq","A change in one part of an ecosystem usually:","affects other parts",["affects nothing","stops the Sun","creates matter"]),
 ("mcq","Which is the ultimate source of energy for a forest ecosystem?","sunlight",["the biggest tree","decomposers","soil"]),
],
"weather-and-climate": [
 ("mcq","Weather is the condition of the atmosphere:","over a short time",["over many years","in space","underground"]),
 ("mcq","Climate is the typical weather of a place:","over many years",["right now","for one hour","on the Moon"]),
 ("mcq","Most weather happens in the lowest layer of the atmosphere, the:","troposphere",["stratosphere","mesosphere","exosphere"]),
 ("mcq","Warm air tends to:","rise",["sink","stay still","freeze"]),
 ("mcq","A large body of air with similar temperature and humidity is an:","air mass",["ocean current","mountain","rock layer"]),
 ("mcq","The boundary where two air masses meet is a:","front",["coast","fault","crater"]),
 ("mcq","Water vapor turning into liquid in clouds is:","condensation",["evaporation","precipitation","erosion"]),
 ("mcq","Areas near the equator generally have a ____ climate.","warm",["polar","freezing","snowy"]),
 ("mcq","Oceans affect climate because water:","heats and cools slowly",["has no effect","is always frozen","blocks the Sun"]),
 ("mcq","High humidity means the air contains a lot of:","water vapor",["oxygen only","dust","carbon"]),
 ("mcq","Which instrument measures air pressure?","barometer",["thermometer","anemometer","rain gauge"]),
 ("mcq","Wind is mainly caused by differences in:","air pressure",["the time of day","the Moon","ocean color"]),
 ("mcq","Mountains can affect climate by causing rain on one side and a ____ on the other.","dry 'rain shadow'",["second ocean","volcano","glacier always"]),
 ("mcq","The greenhouse effect warms Earth by trapping:","heat with certain gases",["sunlight as matter","wind","sound"]),
 ("mcq","Long-term warming of Earth's average temperature is called:","climate change / global warming",["a cold front","a sea breeze","a season"]),
 ("fill","The day-to-day state of the atmosphere is called ____. (one word)","weather"),
 ("mcq","A meteorologist uses data and models to:","predict the weather",["change the climate","stop storms","make rain on demand"]),
 ("mcq","Which factor does NOT strongly affect a region's climate?","the day of the week",["latitude","elevation","nearness to oceans"]),
 ("mcq","Latitude affects climate because it changes how much ____ a place receives.","direct sunlight",["wind only","rain only","soil"]),
 ("mcq","Climate is described using long-term patterns of temperature and:","precipitation",["traffic","population","time zones"]),
],
"plate-tectonics": [
 ("mcq","Earth's outer shell is broken into large pieces called:","tectonic plates",["continents only","oceans","craters"]),
 ("mcq","Tectonic plates float and move slowly on the:","mantle",["core","crust top","atmosphere"]),
 ("mcq","Where two plates pull apart, new crust can form. This is a:","divergent boundary",["convergent boundary","transform boundary","plateau"]),
 ("mcq","Where two plates push together is a:","convergent boundary",["divergent boundary","transform boundary","valley"]),
 ("mcq","Where two plates slide past each other is a:","transform boundary",["divergent boundary","convergent boundary","trench"]),
 ("mcq","Most earthquakes and volcanoes occur:","near plate boundaries",["in the middle of plates only","in the sky","underwater only"]),
 ("mcq","Mountains can form when two plates:","collide and push up the crust",["pull apart fully","stop existing","melt instantly"]),
 ("mcq","The idea that continents were once joined and have drifted is:","continental drift",["the rock cycle","the water cycle","gravity"]),
 ("mcq","Heat from Earth's interior drives slow movement called:","convection currents",["evaporation","erosion","reflection"]),
 ("mcq","A sudden release of energy in the crust causes an:","earthquake",["eclipse","aurora","tide"]),
 ("mcq","Melted rock beneath the surface is called:","magma",["lava only","sediment","fossil"]),
 ("mcq","When magma reaches the surface it is called:","lava",["sediment","soil","ash only"]),
 ("mcq","Deep ocean trenches often form where one plate:","sinks beneath another (subduction)",["rises into the air","disappears","stops moving forever"]),
 ("mcq","Evidence for plate tectonics includes matching fossils on:","different continents",["the Moon","one mountain","the same beach only"]),
 ("mcq","Plates move at about the speed that your:","fingernails grow",["car drives","heart beats","eyes blink"]),
 ("fill","Earth's crust is broken into moving pieces called tectonic ____. (one word)","plates"),
 ("mcq","The Ring of Fire around the Pacific is known for many:","volcanoes and earthquakes",["deserts","glaciers","forests"]),
 ("mcq","A fault is a:","crack in Earth's crust where movement happens",["type of cloud","ocean current","planet"]),
 ("mcq","Sea-floor spreading creates new ocean crust at:","mid-ocean ridges",["beaches","mountain tops","river deltas"]),
 ("mcq","The slow movement of plates over millions of years can:","reshape continents and oceans",["change the weather hourly","stop gravity","create stars"]),
],
"rock-cycle": [
 ("mcq","Rock formed from cooled magma or lava is:","igneous rock",["sedimentary rock","metamorphic rock","soil"]),
 ("mcq","Rock formed from compacted layers of sediment is:","sedimentary rock",["igneous rock","metamorphic rock","magma"]),
 ("mcq","Rock changed by heat and pressure is:","metamorphic rock",["sedimentary rock","igneous rock","sand"]),
 ("mcq","Fossils are most commonly found in which rock type?","sedimentary",["igneous","metamorphic","molten"]),
 ("mcq","The breaking down of rock into smaller pieces is:","weathering",["deposition","melting","cementing"]),
 ("mcq","Wind and water moving sediment from place to place is:","erosion",["weathering","melting","cooling"]),
 ("mcq","When sediment is dropped and settles, it is:","deposition",["erosion","melting","cooling"]),
 ("mcq","The rock cycle shows that rocks can:","change from one type to another over time",["never change","only get bigger","turn into animals"]),
 ("mcq","Heat and pressure deep underground can turn limestone into:","marble (metamorphic)",["sand","lava","fossils"]),
 ("mcq","Magma that cools slowly underground forms igneous rock with:","large crystals",["no crystals ever","fossils","layers"]),
 ("mcq","Lava that cools quickly on the surface forms igneous rock with:","small crystals",["huge crystals","fossils","layers of mud"]),
 ("mcq","Layers (strata) are a clue that a rock is:","sedimentary",["igneous","metamorphic","molten"]),
 ("mcq","Which process can start the rock cycle by breaking rock apart?","weathering",["deposition","melting","cooling"]),
 ("mcq","If a rock melts, it becomes:","magma",["sediment","a fossil","soil"]),
 ("mcq","Pressure squeezing sediment together to form rock is:","compaction",["melting","erosion","weathering"]),
 ("fill","Rock that forms from cooled magma or lava is called ____ rock. (one word)","igneous"),
 ("mcq","Sandstone and shale are examples of:","sedimentary rock",["igneous rock","metamorphic rock","minerals only"]),
 ("mcq","The rock cycle is powered by Earth's internal heat and energy from the:","Sun",["Moon","stars","ocean only"]),
 ("mcq","Minerals are the natural building blocks that make up:","rocks",["clouds","living cells","gases"]),
 ("mcq","A rock can take which path in the cycle?","igneous to sediment to sedimentary to metamorphic",["only stay igneous forever","cell to tissue to organ","none"]),
],
"solar-system": [
 ("mcq","The Sun is at the center of our solar system and is a:","star",["planet","moon","comet"]),
 ("mcq","The planets move around the Sun in paths called:","orbits",["craters","comets","phases"]),
 ("mcq","Which force keeps the planets in orbit around the Sun?","gravity",["friction","magnetism","wind"]),
 ("mcq","The four inner planets are small and made mostly of:","rock",["gas","ice only","light"]),
 ("mcq","The four outer planets are large and made mostly of:","gas",["rock","metal only","water"]),
 ("mcq","Earth takes about one ____ to orbit the Sun.","year",["day","month","hour"]),
 ("mcq","Earth's spin on its axis causes:","day and night",["the seasons alone","tides only","eclipses only"]),
 ("mcq","A natural object that orbits a planet is a:","moon",["star","comet","asteroid belt"]),
 ("mcq","Small rocky bodies orbiting the Sun, mostly between Mars and Jupiter, are:","asteroids",["comets","moons","stars"]),
 ("mcq","Icy bodies that grow a glowing tail near the Sun are:","comets",["asteroids","planets","moons"]),
 ("mcq","The planet closest to the Sun is:","Mercury",["Earth","Jupiter","Neptune"]),
 ("mcq","The largest planet in the solar system is:","Jupiter",["Earth","Mars","Mercury"]),
 ("mcq","The Moon's phases are caused by its position relative to Earth and the:","Sun",["other planets","stars","comets"]),
 ("mcq","A solar eclipse happens when the ____ passes between Earth and the Sun.","Moon",["Sun","Mars","Jupiter"]),
 ("mcq","Seasons on Earth are caused by Earth's:","tilt as it orbits the Sun",["distance changing a lot","spin speed","Moon"]),
 ("fill","The force that keeps planets orbiting the Sun is ____. (one word)","gravity"),
 ("mcq","Which list is in order outward from the Sun?","Mercury, Venus, Earth, Mars",["Earth, Mercury, Mars, Venus","Mars, Earth, Venus, Mercury","Venus, Earth, Mercury, Mars"]),
 ("mcq","Stars other than the Sun look tiny because they are:","extremely far away",["very small","made of paper","behind the Moon"]),
 ("mcq","The Sun provides the solar system with:","light and heat energy",["oxygen","gravity only","sound"]),
 ("mcq","A galaxy is a huge collection of stars, gas, dust, and:","planetary systems",["oceans","continents","weather"]),
],
"atoms-and-matter": [
 ("mcq","The smallest unit of an element is an:","atom",["molecule","cell","mixture"]),
 ("mcq","Two or more atoms joined together form a:","molecule",["cell","mixture","rock"]),
 ("mcq","A substance made of only one kind of atom is an:","element",["mixture","solution","compound"]),
 ("mcq","Water (H2O) is made of hydrogen and oxygen, so it is a:","compound",["element","mixture","atom"]),
 ("mcq","In a solid, particles are packed closely and:","vibrate in place",["move freely and far apart","disappear","do not exist"]),
 ("mcq","In a gas, particles:","move quickly and spread far apart",["are locked in place","are a liquid","vanish"]),
 ("mcq","Adding heat to a substance makes its particles move:","faster",["slower","not at all","backward in time"]),
 ("mcq","When a solid melts into a liquid, this is a:","physical change",["chemical change","new element","nuclear change"]),
 ("mcq","Burning wood, which makes new substances, is a:","chemical change",["physical change","change of shape only","phase change"]),
 ("mcq","Tiny particles that make up atoms include protons, neutrons, and:","electrons",["cells","molecules","minerals"]),
 ("mcq","The states of matter include solid, liquid, gas, and:","plasma",["wood","metal","glass"]),
 ("mcq","A mixture differs from a compound because a mixture's parts:","keep their own properties",["form a new substance","become atoms","cannot be separated"]),
 ("mcq","Cooling a gas enough will cause it to:","condense into a liquid",["become an element","disappear","turn to plasma"]),
 ("mcq","The amount of matter in an object is its:","mass",["volume","color","speed"]),
 ("mcq","During a physical change, the substance's:","identity stays the same",["atoms are destroyed","mass vanishes","element changes"]),
 ("fill","The smallest unit of an element is an ____. (one word)","atom"),
 ("mcq","Which is a sign of a chemical change?","a new color, gas, or smell is produced",["ice melting","water boiling","tearing paper"]),
 ("mcq","Particles in a liquid:","slide past one another",["are fixed in place","fly far apart like a gas","do not move"]),
 ("mcq","The periodic table organizes the known:","elements",["mixtures","compounds only","animals"]),
 ("mcq","Matter is anything that has mass and takes up:","space (volume)",["energy only","light","sound"]),
],
"energy-transfer": [
 ("mcq","Energy that an object has because it is moving is:","kinetic energy",["potential energy","chemical only","no energy"]),
 ("mcq","Stored energy due to position, like a raised ball, is:","potential energy",["kinetic energy","heat only","sound"]),
 ("mcq","Energy cannot be created or destroyed, only:","transferred or transformed",["deleted","invented","frozen"]),
 ("mcq","Heat moving through a metal spoon in soup is:","conduction",["convection","radiation","reflection"]),
 ("mcq","Heat carried by moving liquids or gases is:","convection",["conduction","radiation","insulation"]),
 ("mcq","Heat from the Sun reaching Earth through space is:","radiation",["conduction","convection","friction"]),
 ("mcq","A battery stores energy as:","chemical energy",["sound energy","light energy","wind"]),
 ("mcq","A light bulb changes electrical energy into light and:","heat",["sound","matter","gravity"]),
 ("mcq","When a moving car brakes, kinetic energy is mostly transformed into:","heat",["new matter","light only","sound only"]),
 ("mcq","Energy from food is released in cells by the:","mitochondria",["nucleus","cell wall","ribosome"]),
 ("mcq","A material that does NOT transfer heat well is an:","insulator",["conductor","magnet","battery"]),
 ("mcq","Metals are usually good ____ of heat and electricity.","conductors",["insulators","magnets only","gases"]),
 ("mcq","A roller coaster car at the top of a hill has the most:","potential energy",["kinetic energy","sound energy","light energy"]),
 ("mcq","As that car races downhill, potential energy changes into:","kinetic energy",["chemical energy","sound only","mass"]),
 ("mcq","The total energy in a closed system stays:","the same (conserved)",["always increasing","always zero","random"]),
 ("fill","Energy of motion is called ____ energy. (one word)","kinetic"),
 ("mcq","Solar panels transform sunlight into:","electrical energy",["sound","matter","wind"]),
 ("mcq","A pot warming evenly on a stove as water circulates shows:","convection",["radiation only","insulation","reflection"]),
 ("mcq","Rubbing your hands together transforms motion into:","heat (thermal energy)",["light","sound only","mass"]),
 ("mcq","Which best states the law of conservation of energy?","energy changes form but the total stays the same",["energy disappears","energy is made from nothing","energy is matter"]),
],
"forces-and-motion": [
 ("mcq","A push or a pull is a:","force",["mass","speed","distance"]),
 ("mcq","The tendency of an object to resist changes in motion is:","inertia",["gravity","friction","energy"]),
 ("mcq","An object at rest stays at rest unless acted on by an:","unbalanced force",["balanced force","idea","color"]),
 ("mcq","Forces that are equal and opposite are:","balanced",["unbalanced","negative","invisible"]),
 ("mcq","Unbalanced forces cause an object's motion to:","change",["stay exactly the same","disappear","reverse time"]),
 ("mcq","The force that opposes motion between surfaces is:","friction",["gravity","magnetism","inertia"]),
 ("mcq","Speed is distance divided by:","time",["mass","force","weight"]),
 ("mcq","Velocity is speed in a particular:","direction",["color","mass","temperature"]),
 ("mcq","A change in velocity over time is:","acceleration",["inertia","mass","friction"]),
 ("mcq","The greater an object's mass, the greater the ____ needed to accelerate it.","force",["color","time of day","temperature"]),
 ("mcq","For every action there is an equal and opposite:","reaction",["color","mass","distance"]),
 ("mcq","Gravity is a force of attraction between objects with:","mass",["color","charge only","speed"]),
 ("mcq","If you push a heavy box and a light box with the same force, the light box:","accelerates more",["accelerates less","does not move","gets heavier"]),
 ("mcq","A rocket launches upward by pushing gas down — an example of:","action-reaction",["friction","inertia only","gravity only"]),
 ("mcq","Rougher surfaces generally create ____ friction.","more",["less","no","negative"]),
 ("fill","A push or a pull is called a ____. (one word)","force"),
 ("mcq","A car speeding up, slowing down, or turning is all examples of:","acceleration",["constant speed","rest","inertia only"]),
 ("mcq","Seat belts help in a sudden stop because of the passenger's:","inertia",["gravity","friction","acceleration only"]),
 ("mcq","If forces on a moving object are balanced, it will:","keep moving at constant velocity",["speed up","stop instantly","reverse"]),
 ("mcq","Net force is the:","overall force after combining all forces",["only the biggest force","mass times color","always zero"]),
],
}


# ================================================= READING (authored, grade 6)

READING6 = {
"central-idea": [
 ("mcq","The central idea of a text is its:","most important overall point",["first sentence","longest word","title font"]),
 ("mcq","Supporting details in a text serve to:","develop the central idea",["change the topic","end the text","list the author"]),
 ("mcq","Read: \"Bees pollinate crops, support ecosystems, and produce honey, making them vital.\" The central idea is that bees are:","important to humans and nature",["scary","small","loud"]),
 ("mcq","To find the central idea, you should consider the text as a:","whole",["single word","title only","page number"]),
 ("mcq","A central idea is usually:","supported by several details",["stated as a question","a random fact","the shortest sentence"]),
 ("mcq","Read: \"Despite setbacks, the team kept testing until their rover finally worked.\" The central idea is about:","persistence leading to success",["building cars","spending money","the color of the rover"]),
 ("mcq","A long article's central idea is best captured in a:","brief statement of its main point",["copy of the whole text","single quotation","heading only"]),
 ("mcq","Which would best support the central idea 'recycling benefits the planet'?","It conserves resources and reduces waste.",["Bins can be heavy.","Trucks are loud.","It rained today."]),
 ("mcq","A detail unrelated to the main point is:","irrelevant to the central idea",["the central idea","the theme","essential"]),
 ("mcq","Two paragraphs that each explain a benefit of exercise together build the:","central idea",["plot","setting","rhyme"]),
 ("mcq","Read: \"The internet connects people, speeds up learning, and powers business, but raises privacy concerns.\" The central idea is that the internet is:","powerful but not without downsides",["only harmful","only fun","tiny"]),
 ("mcq","The central idea of an informational text answers:","what is this mostly about?",["who printed it?","how many pages?","what font?"]),
 ("mcq","An objective summary of central idea leaves out the reader's:","personal opinions",["the main point","key details","the topic"]),
 ("mcq","Read: \"Coral reefs shelter species, protect coasts, and may yield medicines, yet they are dying.\" The central idea is that reefs are:","valuable and endangered",["useless","dry","new"]),
 ("mcq","Headings and topic sentences often hint at a text's:","central idea",["price","author's age","binding"]),
 ("fill","The most important overall point of a text is its ____ idea. (one word)","central"),
 ("mcq","If you removed the supporting details, the central idea would be:","harder to fully understand or believe",["clearer always","longer","unchanged in proof"]),
 ("mcq","A well-developed central idea is backed by:","evidence and examples",["only the title","one word","the page count"]),
 ("mcq","Read: \"Volunteers cleaned the river, planted trees, and taught neighbors to recycle.\" The central idea is that the community:","worked to improve the environment",["went on vacation","watched TV","ignored the river"]),
 ("mcq","Determining the central idea helps a reader:","understand the text's purpose",["count words","pick a font","skip reading"]),
],
"theme": [
 ("mcq","A theme is a story's:","underlying message about life",["setting","narrator's name","page count"]),
 ("mcq","Theme differs from topic because theme is a:","complete idea or lesson",["single word","place","character name"]),
 ("mcq","Read: \"Though small and doubted, the girl's idea saved the village.\" A theme is:","everyone's contribution matters",["small things are useless","villages are old","ideas are bad"]),
 ("mcq","Authors usually reveal theme through:","characters' actions and changes",["the title page only","the font","the price"]),
 ("mcq","A story where greed leads to ruin develops a theme about the:","dangers of greed",["joy of greed","size of houses","weather"]),
 ("mcq","Two very different stories can share a theme such as:","courage in the face of fear",["the same exact plot","the same author","the same length"]),
 ("mcq","Read: \"After betraying his friend, he spent years earning back trust.\" A theme is:","trust is hard to rebuild",["betrayal is rewarded","friends are useless","time stops"]),
 ("mcq","A theme is best stated as a:","sentence about life or human nature",["single noun","question mark","setting"]),
 ("mcq","To identify theme, ask what the character or reader:","learns",["wears","eats","weighs"]),
 ("mcq","Read: \"She chose honesty even when lying was easier, and respected herself for it.\" The theme is about:","integrity / honesty",["winning at all costs","fear","luck"]),
 ("mcq","A recurring idea that appears throughout a story points to its:","theme",["index","glossary","title"]),
 ("mcq","Read: \"The rivals learned that together they could do what neither could alone.\" The theme is:","cooperation / teamwork",["rivalry is best","work alone","quitting"]),
 ("mcq","A symbol in a story often points toward the:","theme",["page number","author bio","font size"]),
 ("mcq","A theme is meant to apply:","beyond the single story, to real life",["only to one chapter","to the cover","to nothing"]),
 ("mcq","Read: \"Despite failing the first try, she kept practicing and improved.\" The theme is:","perseverance",["luck","laziness","fear"]),
 ("fill","The deeper message or lesson of a story is its ____. (one word)","theme"),
 ("mcq","Which is a theme rather than a topic?","Freedom is worth sacrificing for.",["war","a soldier","a country"]),
 ("mcq","Conflicting characters often help reveal a story's:","theme",["page count","setting only","font"]),
 ("mcq","Read: \"The proud king learned humility after losing everything.\" A theme is:","pride can lead to a fall",["kings are tall","castles crumble","gold is heavy"]),
 ("mcq","A strong theme statement is:","a general truth shown by the story",["the story's first line","the title","a character's name"]),
],
"summarizing": [
 ("mcq","An objective summary should:","stay neutral and factual",["include your opinion","add a new ending","exaggerate"]),
 ("mcq","A good summary is ____ than the original.","shorter",["longer","exactly equal","just the title"]),
 ("mcq","A summary should capture the central idea and the:","most important details",["every minor detail","author's pet","page color"]),
 ("mcq","When summarizing, restate ideas in your:","own words",["the author's exact words","a code","emojis only"]),
 ("mcq","Which should be LEFT OUT of an objective summary?","your personal feelings",["the main idea","key supporting points","the topic"]),
 ("mcq","Events in a narrative summary should appear in:","logical order",["random order","reverse only","no order"]),
 ("mcq","A summary of an argument should include the author's main:","claim and reasons",["favorite color","birthday","font"]),
 ("mcq","Summarizing a long text helps a reader:","grasp and recall the key points",["forget it","make it longer","change facts"]),
 ("mcq","The best one-sentence summary states the text's:","central idea",["smallest detail","page count","author bio"]),
 ("mcq","Adding 'I think the author is wrong' makes a summary:","no longer objective",["stronger always","required","shorter"]),
 ("mcq","To shorten a passage, you should:","combine ideas and cut minor details",["repeat sentences","add examples","copy it word for word"]),
 ("mcq","An objective summary of a news report focuses on:","the facts and main events",["your reaction","the reporter's looks","ads"]),
 ("mcq","A summary and the original should share the same:","central idea",["wording","length","number of pages"]),
 ("mcq","Which is the best summary of a story where a lost dog finds its way home after many trials?","A lost dog overcame obstacles to return home.",["Dogs are loyal.","The dog was brown.","Homes are nice."]),
 ("mcq","Rereading before summarizing helps you identify the:","most important ideas",["longest words","page numbers","font"]),
 ("fill","A brief, neutral retelling of a text's key points is a ____. (one word)","summary"),
 ("mcq","An effective summary answers mainly:","what happened and why it matters",["how you felt","the price","the publisher"]),
 ("mcq","Including direct quotes for every detail makes a summary:","too long and not concise",["perfect","objective","short"]),
 ("mcq","A paraphrase differs from a summary because a paraphrase:","restates a part in similar length",["is much shorter","adds opinion","is the title"]),
 ("mcq","Good summarizers focus on ideas that are:","central, not trivial",["trivial","longest","colorful"]),
],
"citing-evidence": [
 ("mcq","Text evidence is information you take ____ from the text to support an answer.","directly",["from memory only","from a friend","from the cover"]),
 ("mcq","To support a claim about a text, you should cite:","specific details or quotes",["your mood","a different book","the page color"]),
 ("mcq","An inference must be supported by:","evidence in the text",["a guess","the title alone","nothing"]),
 ("mcq","'The text states...' is a phrase used to:","introduce evidence",["end an essay","change topics","give an opinion"]),
 ("mcq","Strong evidence is:","relevant and from the text",["off-topic","made up","about the author's age"]),
 ("mcq","When asked 'how do you know?', a good reader:","points to text evidence",["guesses","ignores the text","talks about lunch"]),
 ("mcq","Read: \"The author writes that 'sea levels rose two feet.'\" Using that quote is an example of:","citing textual evidence",["personal opinion","summarizing the title","ignoring the text"]),
 ("mcq","A claim without evidence is:","weak / unsupported",["always correct","the central idea","a quote"]),
 ("mcq","Quotation marks around words copied from a text show they are the:","author's exact words",["your words","a summary","a title"]),
 ("mcq","Which best supports the claim 'the character was nervous'?","'Her hands trembled as she spoke.'",["The book is long.","It was Tuesday.","The cover is blue."]),
 ("mcq","Citing evidence makes your answer more:","convincing",["confusing","shorter only","colorful"]),
 ("mcq","To answer a text-based question, first:","find the relevant part of the text",["close the book","guess","read the cover"]),
 ("mcq","Paraphrased evidence still needs to be:","based on the text",["made up","about you","unrelated"]),
 ("mcq","A reader who supports ideas with text evidence is reading:","analytically / closely",["carelessly","not at all","only the title"]),
 ("mcq","Read: \"Explain how you know the setting is winter.\" Best evidence:","'Snow covered the silent streets.'",["I like winter.","The author is famous.","It has 200 pages."]),
 ("fill","Information taken directly from a text to support a point is text ____. (one word)","evidence"),
 ("mcq","Multiple pieces of evidence make an argument:","stronger",["weaker","off-topic","shorter only"]),
 ("mcq","If the text does not support your idea, you should:","revise your idea",["keep it anyway","blame the text","stop reading"]),
 ("mcq","Citing the page or paragraph helps a reader:","locate the evidence",["pick a font","count words","skip the text"]),
 ("mcq","Good evidence is both relevant and:","accurate (truly in the text)",["invented","about the cover","unrelated"]),
],
"authors-point-of-view": [
 ("mcq","An author's purpose for writing might be to inform, entertain, or:","persuade",["sleep","eat","drive"]),
 ("mcq","An author's point of view is their:","attitude or stance on a topic",["page count","handwriting","address"]),
 ("mcq","A text that argues you should recycle is mainly meant to:","persuade",["entertain","list facts only","tell a joke"]),
 ("mcq","Word choices that show strong feelings can reveal the author's:","point of view / bias",["page number","font","price"]),
 ("mcq","An encyclopedia entry's purpose is usually to:","inform",["persuade","entertain","sell"]),
 ("mcq","To find an author's purpose, ask:","why did they write this?",["how long is it?","who printed it?","what is the cover?"]),
 ("mcq","An editorial in a newspaper mainly expresses the writer's:","opinion",["only facts","a recipe","a story plot"]),
 ("mcq","If an author only presents one side of an issue, the text may be:","biased",["objective","fictional","a poem"]),
 ("mcq","A persuasive author often uses:","reasons and emotional appeals",["random numbers","no words","the title only"]),
 ("mcq","Read: \"Our town MUST build a new park now!\" The purpose is to:","persuade",["inform neutrally","entertain","instruct"]),
 ("mcq","A humorous short story's main purpose is to:","entertain",["persuade","inform","sell a product"]),
 ("mcq","Loaded words like 'shocking' or 'amazing' hint at the author's:","attitude",["page count","font","binding"]),
 ("mcq","Comparing two authors on the same topic can reveal different:","points of view",["page numbers","fonts","titles"]),
 ("mcq","An author who wants to teach a process will likely:","explain steps clearly",["tell a joke","argue loudly","write a poem"]),
 ("mcq","Recognizing point of view helps a reader judge a text's:","reliability and intent",["weight","color","price"]),
 ("fill","The reason an author writes a text is the author's ____. (one word)","purpose"),
 ("mcq","A balanced text presents:","more than one point of view",["only one side","no information","just images"]),
 ("mcq","An author's choice to include scary details may be intended to:","create a certain feeling in readers",["count pages","change the font","sell paper"]),
 ("mcq","A 'how-to' guide's purpose is to:","instruct",["persuade","entertain only","argue"]),
 ("mcq","Identifying purpose and point of view helps readers think:","critically",["less","not at all","only about length"]),
],
"word-meaning": [
 ("mcq","Read: \"The benevolent leader gave generously to the poor.\" \"Benevolent\" means:","kind / generous",["cruel","lazy","loud"]),
 ("mcq","Read: \"His incessant talking never stopped all day.\" \"Incessant\" means:","constant / nonstop",["quiet","short","rare"]),
 ("mcq","Read: \"The drought made the once-fertile land barren.\" \"Barren\" means:","empty / unable to grow life",["lush","wet","crowded"]),
 ("mcq","The prefix 'un-' in 'unhappy' means:","not",["very","again","before"]),
 ("mcq","The root 'aqua' in 'aquarium' relates to:","water",["fire","air","earth"]),
 ("mcq","Read: \"She was reluctant and hesitated to agree.\" \"Reluctant\" means:","unwilling",["eager","angry","tired"]),
 ("mcq","The suffix '-less' in 'fearless' means:","without",["full of","again","before"]),
 ("mcq","Read: \"The diplomat was tactful and never offended anyone.\" \"Tactful\" means:","sensitive in dealing with others",["rude","clumsy","loud"]),
 ("mcq","The prefix 'pre-' in 'preview' means:","before",["after","not","again"]),
 ("mcq","Read: \"The vast, immense desert stretched for miles.\" \"Immense\" means:","huge",["tiny","wet","cold"]),
 ("mcq","A word's denotation is its:","dictionary meaning",["feeling it suggests","rhyme","spelling only"]),
 ("mcq","A word's connotation is the:","feeling or idea it suggests",["dictionary meaning","number of letters","origin"]),
 ("mcq","'Cheap' and 'inexpensive' have similar denotations but different:","connotations",["spellings only","lengths","prefixes"]),
 ("mcq","The root 'bio' in 'biology' means:","life",["earth","water","light"]),
 ("mcq","Read: \"His ambiguous answer could mean two things.\" \"Ambiguous\" means:","unclear / having more than one meaning",["very clear","loud","short"]),
 ("fill","The prefix 're-' (as in 'redo') means to do something ____. (one word)","again"),
 ("mcq","Read: \"The meticulous artist checked every tiny detail.\" \"Meticulous\" means:","very careful",["careless","fast","lazy"]),
 ("mcq","Context clues are the:","surrounding words that hint at meaning",["dictionary only","page numbers","title"]),
 ("mcq","The root 'tele' in 'telephone' means:","far / distant",["near","loud","small"]),
 ("mcq","Read: \"They reached a unanimous decision; everyone agreed.\" \"Unanimous\" means:","in complete agreement",["divided","unsure","loud"]),
],
"text-structure": [
 ("mcq","A text organized by time order uses a ____ structure.","chronological / sequence",["compare-contrast","cause-effect","problem-solution"]),
 ("mcq","A text explaining reasons and results uses:","cause and effect",["sequence","description","compare"]),
 ("mcq","A text showing similarities and differences uses:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","A text that names an issue and offers fixes uses:","problem and solution",["sequence","description","compare"]),
 ("mcq","Signal words 'first, then, finally' point to a ____ structure.","sequence",["compare","cause-effect","problem-solution"]),
 ("mcq","Signal words 'because, therefore, as a result' point to:","cause and effect",["sequence","compare","description"]),
 ("mcq","Signal words 'similarly, however, unlike' point to:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","A biography told from birth to death follows a:","chronological structure",["compare","problem-solution","description"]),
 ("mcq","An essay on 'pollution and how to reduce it' uses:","problem and solution",["sequence","compare only","description"]),
 ("mcq","Identifying structure helps a reader:","follow and organize the ideas",["pick a font","count pages","ignore content"]),
 ("mcq","A passage describing a place's sights, sounds, and smells uses:","description",["sequence","cause-effect","problem-solution"]),
 ("mcq","An article comparing two energy sources side by side uses:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","'Deforestation caused habitat loss, which led to fewer species' shows:","cause and effect",["sequence","compare","description"]),
 ("mcq","Headings, subheadings, and signal words are clues to a text's:","structure",["price","author","font"]),
 ("mcq","A recipe or set of directions is usually organized by:","sequence",["compare","problem-solution","description"]),
 ("fill","A text arranged in time order uses a ____ (time-order) structure. (one word)","chronological"),
 ("mcq","A text may combine structures, like comparing the causes of two events, blending:","compare-contrast and cause-effect",["only description","only sequence","none"]),
 ("mcq","Recognizing problem-solution structure helps you find the author's proposed:","solution",["setting","rhyme","title"]),
 ("mcq","A timeline visual best matches a ____ text structure.","chronological / sequence",["compare","description","problem-solution"]),
 ("mcq","Knowing the structure first makes a complex text:","easier to understand",["longer","impossible","cheaper"]),
],
"figurative-language": [
 ("mcq","\"The world is a stage\" is a:","metaphor",["simile","fact","question"]),
 ("mcq","\"As brave as a lion\" is a:","simile",["metaphor","idiom","hyperbole"]),
 ("mcq","Giving human traits to nonhuman things is:","personification",["simile","hyperbole","onomatopoeia"]),
 ("mcq","\"I have a ton of homework\" is an exaggeration called:","hyperbole",["simile","metaphor","idiom"]),
 ("mcq","An expression like 'spill the beans' whose meaning isn't literal is an:","idiom",["simile","metaphor","onomatopoeia"]),
 ("mcq","Words like 'crash' and 'hiss' that imitate sounds are:","onomatopoeia",["similes","metaphors","idioms"]),
 ("mcq","\"The wind howled through the night\" uses:","personification",["a simile","hyperbole","an idiom"]),
 ("mcq","A simile compares two things using:","like or as",["is","and","the"]),
 ("mcq","A metaphor states that one thing:","is another",["is like another","is near another","is bigger"]),
 ("mcq","\"Her words were music to my ears\" is a:","metaphor",["fact","simile","idiom"]),
 ("mcq","\"He runs like the wind\" is a:","simile",["metaphor","idiom","onomatopoeia"]),
 ("mcq","'Break the ice' meaning to ease tension is an:","idiom",["a literal action","simile","fact"]),
 ("mcq","\"The old floor groaned under our feet\" gives the floor a human action, so it's:","personification",["a simile","hyperbole","an idiom"]),
 ("mcq","\"My backpack weighs a thousand pounds!\" is:","hyperbole",["a fact","a simile","onomatopoeia"]),
 ("mcq","Symbolism is when an object represents a larger:","idea",["sound","number","font"]),
 ("fill","A comparison using 'like' or 'as' is a ____. (one word)","simile"),
 ("mcq","\"Time is money\" is an example of a:","metaphor",["simile","onomatopoeia","fact"]),
 ("mcq","Authors use figurative language to:","create vivid images and deeper meaning",["state plain facts only","fill space","confuse readers"]),
 ("mcq","\"The thunder grumbled in the distance\" is:","personification",["a simile","an idiom","a fact"]),
 ("mcq","Which is NOT figurative language?","The bell rang at noon.",["She's a night owl.","Quiet as a mouse.","The stars winked."]),
],
"compare-texts": [
 ("mcq","Comparing two texts on the same topic helps reveal their different:","approaches and viewpoints",["page numbers","fonts","prices"]),
 ("mcq","A memoir and a news article about the same event differ most in:","point of view and tone",["the date","whether it happened","the planet"]),
 ("mcq","Two authors may present the same facts but reach different:","conclusions",["page counts","titles","fonts"]),
 ("mcq","A poem and an essay on nature differ in their:","form and style",["subject","truth","alphabet"]),
 ("mcq","Reading multiple sources on a topic helps a reader:","build a fuller understanding",["get less information","ignore facts","memorize fonts"]),
 ("mcq","A primary source is an account from:","someone who was there",["a later textbook only","fiction always","an unrelated topic"]),
 ("mcq","A secondary source:","analyzes or describes events after the fact",["is always an eyewitness","is fiction","has no facts"]),
 ("mcq","When two texts disagree, a careful reader:","weighs the evidence in each",["believes the longer one","ignores both","picks randomly"]),
 ("mcq","A documentary and a written report on whales are alike because both:","aim to inform about whales",["are poems","are fiction","have no facts"]),
 ("mcq","Comparing a story to its film version often shows the film:","changes or cuts some details",["adds nothing","is identical","has no characters"]),
 ("mcq","Different genres can explore the same theme, such as:","courage",["the same exact plot","the same author","the same length"]),
 ("mcq","Synthesizing sources means:","combining ideas from several texts",["copying one source","ignoring all","reading none"]),
 ("mcq","Two charts of the same data may differ in:","how they present it",["the facts","the truth","the topic"]),
 ("mcq","An author's bias can be spotted by comparing a text to:","other sources on the topic",["its page number","its font","its cover"]),
 ("mcq","Reading firsthand and secondhand accounts of an event reveals differences in:","detail and perspective",["the event itself","the year only","spelling"]),
 ("fill","Looking at how two texts are alike and different is to ____ them. (one word, starts with c)","compare"),
 ("mcq","A scientific article and an opinion blog on climate differ mainly in:","evidence and reliability",["the topic","the alphabet","the length only"]),
 ("mcq","When texts present conflicting information, the reader should check the:","sources and evidence",["page color","font size","author's age"]),
 ("mcq","Comparing how two poets describe the sea highlights each poet's:","style and word choice",["page count","publisher","price"]),
 ("mcq","Gathering several viewpoints before forming an opinion is a sign of:","critical reading",["lazy reading","skipping","guessing"]),
],
"plot-and-conflict": [
 ("mcq","The series of events in a story is the:","plot",["theme","setting","narrator"]),
 ("mcq","The problem the characters face is the:","conflict",["setting","title","genre"]),
 ("mcq","A struggle between two characters is an example of:","character vs. character conflict",["character vs. self","character vs. nature","no conflict"]),
 ("mcq","A character battling a storm shows:","character vs. nature",["character vs. character","character vs. self","no conflict"]),
 ("mcq","A character struggling with a tough decision shows:","character vs. self",["character vs. nature","character vs. character","setting"]),
 ("mcq","The part of the plot that builds tension toward the climax is the:","rising action",["resolution","exposition only","theme"]),
 ("mcq","The turning point of highest tension is the:","climax",["exposition","resolution","setting"]),
 ("mcq","The part where the conflict is resolved is the:","resolution",["rising action","climax","exposition"]),
 ("mcq","The beginning that introduces characters and setting is the:","exposition",["climax","resolution","conflict"]),
 ("mcq","After the climax, events that wind down are the:","falling action",["rising action","exposition","theme"]),
 ("mcq","A conflict between a person and society's rules is:","character vs. society",["character vs. nature","character vs. self","no conflict"]),
 ("mcq","The conflict usually drives the:","plot forward",["page numbers","font","title"]),
 ("mcq","Without a conflict, most stories would have:","little to no plot",["a better plot","more pages","a theme only"]),
 ("mcq","An internal conflict happens:","inside a character's mind",["between two armies","with the weather","on the cover"]),
 ("mcq","Read: \"Maya must choose between her dream and helping her family.\" This is mainly:","character vs. self",["character vs. nature","character vs. character","no conflict"]),
 ("fill","The main problem or struggle in a story is the ____. (one word)","conflict"),
 ("mcq","The correct order of plot parts is:","exposition, rising action, climax, falling action, resolution",["climax, exposition, resolution","resolution, climax, exposition","rising action, exposition, climax"]),
 ("mcq","A hero fighting a dragon is an example of:","character vs. character (or nature)",["character vs. self","no conflict","setting"]),
 ("mcq","The setting can create conflict when characters struggle against the:","environment",["title","font","author"]),
 ("mcq","Identifying the conflict helps a reader understand the story's:","main tension and direction",["page count","font","price"]),
],
}


# ===================================================== TOPIC REGISTRY (grade 6)

TOPICS6 = [
 # ---- MATH (computed, banded by difficulty, de-duplicated) ----
 ("math","ratios","Ratios","6.RP.A.1",
  "A ratio compares two quantities. Worksheets use larger numbers as they go.", G(m_ratios)),
 ("math","unit-rates","Unit Rates","6.RP.A.2",
  "A unit rate tells how much of one quantity per one of another, like miles per hour.", G(m_unit_rate)),
 ("math","percent","Percents","6.RP.A.3",
  "A percent is a part out of 100. To find a percent of a number, multiply and divide by 100.", G(m_percent)),
 ("math","divide-fractions","Dividing Fractions","6.NS.A.1",
  "To divide by a fraction, multiply by its reciprocal (flip the second fraction).", G(m_divide_fractions)),
 ("math","decimal-operations","Decimal Operations","6.NS.B.3",
  "Add, subtract, and multiply decimals carefully, keeping track of the decimal point.", G(m_decimal_ops)),
 ("math","gcf-lcm","GCF & LCM","6.NS.B.4",
  "The GCF is the biggest factor two numbers share; the LCM is the smallest multiple they share.", G(m_gcf_lcm)),
 ("math","integers","Integers & Absolute Value","6.NS.C.5",
  "Integers include negative numbers; absolute value is a number's distance from zero.", G(m_integers)),
 ("math","exponents","Exponents","6.EE.A.1",
  "An exponent tells how many times to multiply a base by itself, like 2^3 = 8.", G(m_exponents)),
 ("math","evaluate-expressions","Evaluating Expressions","6.EE.A.2",
  "Substitute the given value for the variable, then follow the order of operations.", G(m_evaluate)),
 ("math","one-step-equations","One-Step Equations","6.EE.B.7",
  "Use the inverse operation to get the variable by itself and solve.", G(m_one_step)),
 # ---- SCIENCE ----
 ("science","cells","Cells","MS-LS1-1",
  "Cells are the basic building blocks of all living things; some have specialized parts.", SCIENCE6["cells"]),
 ("science","body-systems","Body Systems","MS-LS1-3",
  "The body's organ systems work together to keep an organism alive and healthy.", SCIENCE6["body-systems"]),
 ("science","ecosystems-and-energy","Ecosystems & Energy","MS-LS2-3",
  "Energy flows and matter cycles through producers, consumers, and decomposers.", SCIENCE6["ecosystems-and-energy"]),
 ("science","weather-and-climate","Weather & Climate","MS-ESS2-5",
  "Weather is short-term; climate is long-term. Both depend on the atmosphere and oceans.", SCIENCE6["weather-and-climate"]),
 ("science","plate-tectonics","Plate Tectonics","MS-ESS2-3",
  "Earth's plates move slowly, shaping continents and causing earthquakes and volcanoes.", SCIENCE6["plate-tectonics"]),
 ("science","rock-cycle","The Rock Cycle","MS-ESS2-1",
  "Rocks change between igneous, sedimentary, and metamorphic forms over time.", SCIENCE6["rock-cycle"]),
 ("science","solar-system","The Solar System","MS-ESS1-3",
  "Gravity holds planets, moons, asteroids, and comets in orbit around the Sun.", SCIENCE6["solar-system"]),
 ("science","atoms-and-matter","Atoms & Matter","MS-PS1-1",
  "Matter is made of atoms; substances can be elements, compounds, or mixtures.", SCIENCE6["atoms-and-matter"]),
 ("science","energy-transfer","Energy & Its Transfer","MS-PS3-3",
  "Energy can be stored or moving and is transferred by conduction, convection, and radiation.", SCIENCE6["energy-transfer"]),
 ("science","forces-and-motion","Forces & Motion","MS-PS2-2",
  "Forces change motion; balanced forces keep it steady while unbalanced forces change it.", SCIENCE6["forces-and-motion"]),
 # ---- READING ----
 ("reading","central-idea","Central Idea","RI.6.2",
  "The central idea is a text's most important overall point, developed by details.", READING6["central-idea"]),
 ("reading","theme","Theme","RL.6.2",
  "A theme is a story's underlying message about life, shown through the characters.", READING6["theme"]),
 ("reading","summarizing","Objective Summary","RI.6.2",
  "An objective summary briefly restates the central idea and key details without opinion.", READING6["summarizing"]),
 ("reading","citing-evidence","Citing Text Evidence","RI.6.1",
  "Support your ideas and inferences with specific evidence taken from the text.", READING6["citing-evidence"]),
 ("reading","authors-point-of-view","Author's Purpose & View","RI.6.6",
  "Authors write to inform, persuade, or entertain, often revealing a point of view.", READING6["authors-point-of-view"]),
 ("reading","word-meaning","Word Meaning","RI.6.4",
  "Use context clues, prefixes, suffixes, and roots to determine word meanings.", READING6["word-meaning"]),
 ("reading","text-structure","Text Structure","RI.6.5",
  "Authors organize texts as sequence, cause-effect, compare-contrast, or problem-solution.", READING6["text-structure"]),
 ("reading","figurative-language","Figurative Language","L.6.5",
  "Similes, metaphors, personification, idioms, and hyperbole add meaning and imagery.", READING6["figurative-language"]),
 ("reading","compare-texts","Comparing Texts","RI.6.9",
  "Comparing texts and genres on a topic reveals different viewpoints and approaches.", READING6["compare-texts"]),
 ("reading","plot-and-conflict","Plot & Conflict","RL.6.3",
  "Plot is the sequence of events; conflict is the central struggle that drives the story.", READING6["plot-and-conflict"]),
 # ---- WRITING (reuses shared grammar generators) ----
 ("writing","nouns","Nouns","L.6.1", "A noun names a person, place, thing, or idea.", g_nouns),
 ("writing","action-verbs","Action Verbs","L.6.1", "A verb shows action or a state of being.", g_verbs),
 ("writing","adjectives","Adjectives","L.6.1", "An adjective describes a noun.", g_adjectives),
 ("writing","pronouns","Pronouns","L.6.1", "A pronoun takes the place of a noun.", g_pronouns),
 ("writing","subject-verb-agreement","Subject-Verb Agreement","L.6.1", "The verb must agree with its subject in number.", g_subject_verb),
 ("writing","past-tense-verbs","Past-Tense Verbs","L.6.1", "Past-tense verbs describe actions that already happened.", g_past_tense),
 ("writing","plural-nouns","Plural Nouns","L.6.1", "Plurals show more than one.", g_plurals),
 ("writing","capitalization","Capitalization","L.6.2", "Capitalize sentence beginnings, I, and proper nouns.", g_capitalization),
 ("writing","end-punctuation","End Punctuation","L.6.2", "End sentences with a period, question mark, or exclamation point.", g_end_punctuation),
 ("writing","commas-in-a-series","Commas in a Series","L.6.2", "Use commas to separate three or more items in a list.", g_commas_series),
]


if __name__ == "__main__":
    print(emit_curriculum(6, TOPICS6))
