#!/usr/bin/env python3
"""
TopicLeap Grade 8 curriculum seed generator.

Math is computed with 4 difficulty bands (worksheets get harder) and
de-duplicated; grammar is reused; science + reading are authored at grade-8
level (reusing topic slugs from earlier grades is fine — the database keys
topics by grade_level). 4 subjects x 10 topics x 20 questions, worksheets of 5.

Usage:
    python3 scripts/generate_grade8.py > supabase/seed/grade8_curriculum.sql
"""
import random
from decimal import Decimal

from generate_seed import (
    emit_curriculum, fill, mcq,
    g_nouns, g_verbs, g_adjectives, g_pronouns, g_subject_verb,
    g_past_tense, g_plurals, g_capitalization, g_end_punctuation, g_commas_series,
)
from generate_grade5 import gen_unique, _distractors, dstr, G

PI = Decimal("3.14")
TRIPLES = [(3, 4, 5), (6, 8, 10), (5, 12, 13), (8, 15, 17), (9, 12, 15),
           (7, 24, 25), (20, 21, 29), (12, 16, 20), (10, 24, 26), (15, 20, 25)]


# ============================================================ MATH (computed)

def m_exponent_rules(band, rng):
    base = rng.choice([[2, 3], [2, 3, 4], [2, 3, 4, 5], [2, 3, 5, 6]][band])
    form = rng.choice(["mul", "div", "pow"])
    if form == "mul":
        a, b = rng.randint(1, 3), rng.randint(1, 3)
        val = base ** (a + b)
        return fill(f"Simplify and evaluate:  {base}^{a} x {base}^{b} = ?", val)
    if form == "div":
        a = rng.randint(3, 5); b = rng.randint(1, a - 1)
        val = base ** (a - b)
        return fill(f"Simplify and evaluate:  {base}^{a} / {base}^{b} = ?", val)
    a = rng.randint(2, 3); b = rng.randint(2, 3)
    return fill(f"Simplify and evaluate:  ({base}^{a})^{b} = ?", base ** (a * b))


def m_scientific_notation(band, rng):
    a = rng.randint(1, 9)
    b = rng.randint(0, 9)
    n = [2, 3, 4, 5][band]
    value = (a * 10 + b) * 10 ** (n - 1)
    return fill(f"Write {a}.{b} x 10^{n} as a standard number (no commas).", value)


def m_roots(band, rng):
    if band == 0:
        n = rng.randint(2, 10)
        return fill(f"What is the square root of {n * n}?", n)
    if band == 1:
        n = rng.randint(11, 20)
        return fill(f"What is the square root of {n * n}?", n)
    if band == 2:
        n = rng.randint(2, 7)
        return fill(f"What is the cube root of {n ** 3}?", n)
    if rng.random() < 0.5:
        n = rng.randint(8, 10)
        return fill(f"What is the cube root of {n ** 3}?", n)
    n = rng.randint(21, 25)
    return fill(f"What is the square root of {n * n}?", n)


def m_linear_equations(band, rng):
    a = rng.randint(3, [5, 7, 9, 12][band])
    c = rng.randint(1, a - 1)
    x = rng.randint(2, [8, 10, 12, 15][band])
    b = rng.randint(1, [9, 12, 15, 20][band])
    d = (a - c) * x + b
    return fill(f"Solve for x:  {a}x + {b} = {c}x + {d}", x)


def m_slope(band, rng):
    x1 = rng.randint(0, 6)
    dx = rng.randint(1, [4, 5, 6, 8][band])
    x2 = x1 + dx
    m = rng.randint(1, [4, 6, 8, 9][band])
    if band >= 2 and rng.random() < 0.5:
        m = -m
    y1 = rng.randint(0, 6)
    y2 = y1 + m * dx
    return fill(f"Find the slope of the line through ({x1}, {y1}) and "
                f"({x2}, {y2}).", m)


def m_pythagorean(band, rng):
    base = TRIPLES[:4] if band == 0 else TRIPLES[:7] if band == 1 else TRIPLES
    a, b, c = rng.choice(base)
    k = [1, 1, 1, 2][band]
    a, b, c = a * k, b * k, c * k
    if rng.random() < 0.65:
        return fill(f"A right triangle has legs of {a} and {b}. What is the "
                    f"length of the hypotenuse?", c)
    return fill(f"A right triangle has a hypotenuse of {c} and one leg of {a}. "
                f"What is the other leg?", b)


def m_functions(band, rng):
    if band < 3:
        a = rng.randint(2, [5, 7, 9][band])
        b = rng.randint(1, [9, 12, 15][band])
        v = rng.randint(2, [8, 10, 12][band])
        return fill(f"If f(x) = {a}x + {b}, what is f({v})?", a * v + b)
    a = rng.randint(2, 5); b = rng.randint(1, 9); v = rng.randint(2, 6)
    return fill(f"If f(x) = {a}x^2 + {b}, what is f({v})?", a * v * v + b)


def m_volume_curved(band, rng):
    r = rng.randint([2, 3, 4, 5][band], [4, 6, 8, 10][band])
    h = rng.randint(3, [7, 9, 12, 15][band])
    if band % 2 == 0:
        correct = dstr(PI * r * r * h)
        cands = [dstr(PI * r * h), dstr(PI * r * r * h * 2), str(r * r * h),
                 dstr(PI * 2 * r * h)]
        return mcq(f"Find the volume of a cylinder with radius {r} and height "
                   f"{h}. Use 3.14 for pi. (V = pi x r x r x h)", correct,
                   _distractors(correct, cands, rng), rng)
    correct = dstr((PI * r * r * h) / 3)
    cands = [dstr(PI * r * r * h), dstr((PI * r * h) / 3), str(r * r * h),
             dstr(PI * r * r)]
    return mcq(f"Find the volume of a cone with radius {r} and height {h}. Use "
               f"3.14 for pi. (V = (1/3) x pi x r x r x h)", correct,
               _distractors(correct, cands, rng), rng)


def m_rational_irrational(band, rng):
    rational = [
        f"the square root of {rng.choice([4, 9, 16, 25, 36, 49, 64, 81, 100])}",
        f"the fraction {rng.randint(1, 9)}/{rng.randint(2, 9)}",
        f"the decimal 0.{rng.randint(1, 9)}{rng.randint(0, 9)}",
        f"the number {rng.randint(-9, 9)}",
        "the repeating decimal 0.333...",
    ]
    irrational = [
        f"the square root of {rng.choice([2, 3, 5, 7, 10, 11, 13, 15])}",
        "the number pi",
        "the decimal 0.1010010001... (never repeats)",
        "the square root of 20",
    ]
    if rng.random() < 0.5:
        item, ans = rng.choice(rational), "rational"
    else:
        item, ans = rng.choice(irrational), "irrational"
    return mcq(f"Is {item} rational or irrational?", ans,
               ["rational" if ans == "irrational" else "irrational",
                "both", "neither"], rng)


def m_slope_intercept(band, rng):
    m = rng.randint(2, [5, 7, 9, 12][band])
    b = rng.randint(1, [9, 12, 15, 20][band])
    if band >= 2 and rng.random() < 0.4:
        m = -m
    if rng.random() < 0.5:
        return fill(f"For the line y = {m}x + {b}, what is the slope?", m)
    return fill(f"For the line y = {m}x + {b}, what is the y-intercept?", b)


# ================================================= SCIENCE (authored, MS gr. 8)

SCIENCE8 = {
"forces-and-motion": [
 ("mcq","Newton's second law is written as the equation:","F = ma",["E = mc^2","V = IR","d = rt only"]),
 ("mcq","If the net force on an object is zero, its velocity is:","constant (unchanging)",["increasing","zero always","random"]),
 ("mcq","A 2 kg object accelerating at 3 m/s^2 experiences a net force of:","6 N",["1.5 N","5 N","9 N"]),
 ("mcq","Acceleration is the rate of change of:","velocity",["mass","force","distance"]),
 ("mcq","On a distance-time graph, a steeper line means a:","greater speed",["slower speed","object at rest","negative mass"]),
 ("mcq","A flat (horizontal) line on a distance-time graph means the object is:","at rest",["speeding up","slowing down","moving fastest"]),
 ("mcq","The product of an object's mass and velocity is its:","momentum",["acceleration","force","energy"]),
 ("mcq","Newton's third law says forces come in:","equal and opposite pairs",["single pushes","random sizes","no pairs"]),
 ("mcq","Inertia depends on an object's:","mass",["color","speed only","temperature"]),
 ("mcq","An unbalanced force will cause an object to:","accelerate",["stay at constant velocity","disappear","gain mass"]),
 ("mcq","Doubling the force on a fixed mass will ____ the acceleration.","double",["halve","not change","cube"]),
 ("mcq","Doubling the mass while keeping force constant will ____ the acceleration.","halve",["double","not change","triple"]),
 ("mcq","Friction and air resistance are forces that generally:","oppose motion",["speed motion up","create mass","add energy from nothing"]),
 ("mcq","A car turning a corner at constant speed is still accelerating because its ____ changes.","direction (velocity)",["mass","color","temperature"]),
 ("mcq","Velocity differs from speed because velocity includes:","direction",["mass","time only","temperature"]),
 ("fill","Newton's second law: Force = mass x ____ . (one word)","acceleration"),
 ("mcq","A rocket moves forward by expelling gas backward, demonstrating Newton's:","third law",["first law only","second law only","law of gravity"]),
 ("mcq","On a velocity-time graph, a straight slanted line shows:","constant acceleration",["constant speed","an object at rest","zero force"]),
 ("mcq","Momentum is conserved in a closed system during a:","collision",["temperature change","color change","name change"]),
 ("mcq","The SI unit of force is the:","newton",["joule","watt","meter"]),
],
"energy-transfer": [
 ("mcq","Kinetic energy depends on an object's mass and its:","speed (velocity)",["color","temperature only","charge"]),
 ("mcq","Gravitational potential energy depends on mass, gravity, and:","height",["color","speed","charge"]),
 ("mcq","The law of conservation of energy says energy is:","never created or destroyed",["always increasing","always lost","made from nothing"]),
 ("mcq","As a roller coaster descends, potential energy transforms into:","kinetic energy",["chemical energy","mass","sound only"]),
 ("mcq","Doing work on an object transfers ____ to it.","energy",["mass","color","charge"]),
 ("mcq","The SI unit of energy and work is the:","joule",["newton","watt","meter"]),
 ("mcq","Thermal energy always flows from ____ to colder regions.","hotter",["colder","equal","empty"]),
 ("mcq","A stretched spring stores ____ energy.","elastic potential",["kinetic","thermal","sound"]),
 ("mcq","When a moving car brakes, kinetic energy is mostly transformed into:","thermal energy (heat)",["new matter","light only","sound only"]),
 ("mcq","Power is the rate at which ____ is transferred.","energy (work)",["mass","force","distance"]),
 ("mcq","Chemical energy is stored in the:","bonds between atoms",["motion of objects","height of objects","color of objects"]),
 ("mcq","A pendulum at its highest point has the most:","potential energy",["kinetic energy","sound energy","mass"]),
 ("mcq","A pendulum at its lowest point has the most:","kinetic energy",["potential energy","chemical energy","mass"]),
 ("mcq","Efficiency compares useful output energy to total:","input energy",["mass","force","time only"]),
 ("mcq","Energy 'lost' to friction is usually transformed into:","heat",["nothing","new matter","light only"]),
 ("fill","Energy of motion is called ____ energy. (one word)","kinetic"),
 ("mcq","A solar panel transforms light energy into:","electrical energy",["sound","mass","gravity"]),
 ("mcq","Lifting a box increases its:","potential energy",["kinetic energy","thermal energy","charge"]),
 ("mcq","The total mechanical energy (KE + PE) of a system with no friction stays:","constant",["increasing","zero","random"]),
 ("mcq","Which is a unit of power?","watt",["joule","newton","meter"]),
],
"waves": [
 ("mcq","Waves transfer ____ without permanently transferring matter.","energy",["mass","atoms","temperature"]),
 ("mcq","The number of wave cycles per second is the:","frequency",["amplitude","wavelength","speed"]),
 ("mcq","Wave speed equals frequency times:","wavelength",["amplitude","period","mass"]),
 ("mcq","Sound is a ____ wave that needs a medium.","longitudinal (mechanical)",["transverse only","electromagnetic","light"]),
 ("mcq","Light is an ____ wave that can travel through a vacuum.","electromagnetic",["mechanical","sound","water"]),
 ("mcq","Higher frequency light corresponds to:","higher energy",["lower energy","no energy","slower speed"]),
 ("mcq","Increasing amplitude increases a wave's:","energy",["frequency","wavelength","speed"]),
 ("mcq","When a wave passes from one medium to another and bends, it is:","refracted",["reflected","absorbed","created"]),
 ("mcq","The electromagnetic spectrum ranges from radio waves to:","gamma rays",["sound waves","water waves","seismic waves"]),
 ("mcq","Digital signals are more reliable than analog because they:","resist noise and copy without loss",["are slower","use no energy","are louder"]),
 ("mcq","The bouncing of a wave off a surface is:","reflection",["refraction","diffraction only","absorption"]),
 ("mcq","Visible light is between ____ and ultraviolet on the spectrum.","infrared",["gamma rays","radio waves","sound"]),
 ("mcq","A higher-pitched sound has a higher:","frequency",["amplitude","wavelength","speed in air"]),
 ("mcq","If wave speed is constant and frequency increases, wavelength:","decreases",["increases","stays the same","becomes zero"]),
 ("mcq","Information can be sent over distances using patterns in:","light and radio waves",["matter only","gravity","shadows only"]),
 ("fill","Wave speed = frequency x ____ . (one word)","wavelength"),
 ("mcq","X-rays and microwaves are both types of:","electromagnetic waves",["sound waves","ocean waves","seismic waves"]),
 ("mcq","An echo is produced by the ____ of sound waves.","reflection",["refraction","absorption","creation"]),
 ("mcq","Compared to sound, light in air travels:","much faster",["slower","at the same speed","backward"]),
 ("mcq","The distance from one crest to the next is the:","wavelength",["amplitude","frequency","period"]),
],
"chemical-reactions": [
 ("mcq","In a chemical reaction, atoms are:","rearranged, not created or destroyed",["destroyed","created from nothing","turned to energy only"]),
 ("mcq","A balanced equation has equal numbers of each atom on:","both sides",["the left only","the right only","neither side"]),
 ("mcq","The principle that mass is the same before and after a reaction is:","conservation of mass",["conservation of energy","gravity","inertia"]),
 ("mcq","Evidence of a chemical reaction can include a color change, gas, or:","temperature change",["a change in shape only","melting only","dissolving only"]),
 ("mcq","A reaction that releases energy (heat) is:","exothermic",["endothermic","physical","neutral"]),
 ("mcq","A reaction that absorbs energy is:","endothermic",["exothermic","physical","instant"]),
 ("mcq","In 2H2 + O2 -> 2H2O, the substances on the left are the:","reactants",["products","catalysts","ions"]),
 ("mcq","A substance that speeds a reaction without being consumed is a:","catalyst",["reactant","product","precipitate"]),
 ("mcq","Atoms bond by sharing or transferring:","electrons",["protons","neutrons","nuclei"]),
 ("mcq","A covalent bond involves ____ electrons.","sharing",["transferring","destroying","creating"]),
 ("mcq","An ionic bond involves ____ electrons.","transferring",["sharing","destroying","creating"]),
 ("mcq","Rusting iron is an example of a:","chemical change",["physical change","phase change","mixture"]),
 ("mcq","Subscripts in a chemical formula indicate the number of:","atoms of each element",["molecules only","reactions","grams"]),
 ("mcq","Coefficients in a balanced equation indicate the number of:","molecules (or moles)",["atoms only","electrons","grams"]),
 ("mcq","If 8 g reacts with 12 g in a sealed flask, the products mass is:","20 g",["4 g","12 g","0 g"]),
 ("fill","The starting substances in a chemical reaction are the ____. (one word)","reactants"),
 ("mcq","Burning (combustion) typically combines a fuel with:","oxygen",["nitrogen","helium","gold"]),
 ("mcq","A precipitate forming when two solutions mix is a sign of a:","chemical reaction",["physical change","phase change","mixture"]),
 ("mcq","Endothermic reactions often make their surroundings feel:","colder",["warmer","unchanged","heavier"]),
 ("mcq","The properties of the products in a reaction are usually ____ the reactants.","different from",["identical to","heavier than always","lighter than always"]),
],
"atoms-and-periodic-table": [
 ("mcq","The number of protons in an atom defines its:","element (atomic number)",["mass number","charge","color"]),
 ("mcq","Atoms of the same element with different neutron counts are:","isotopes",["ions","molecules","compounds"]),
 ("mcq","An atom that has lost or gained electrons is an:","ion",["isotope","element","mixture"]),
 ("mcq","Vertical columns of the periodic table are:","groups (families)",["periods","rows only","cells"]),
 ("mcq","Elements in the same group tend to have similar:","chemical properties",["masses exactly","colors","prices"]),
 ("mcq","Across a period, atomic number ____ from left to right.","increases",["decreases","stays the same","is random"]),
 ("mcq","Most reactive metals are found on the ____ of the table.","far left",["far right","middle bottom","top right only"]),
 ("mcq","Noble gases are nearly unreactive because they have:","full outer electron shells",["no electrons","extra protons","no nucleus"]),
 ("mcq","The mass number equals protons plus:","neutrons",["electrons","ions","molecules"]),
 ("mcq","Valence electrons are the electrons in the:","outermost shell",["nucleus","innermost shell","cytoplasm"]),
 ("mcq","Two or more elements chemically combined form a:","compound",["mixture","isotope","ion"]),
 ("mcq","An element is a pure substance made of one kind of:","atom",["molecule","mixture","compound"]),
 ("mcq","Metals tend to ____ electrons to form positive ions.","lose",["gain","share only","destroy"]),
 ("mcq","Nonmetals tend to ____ electrons to form negative ions.","gain",["lose","destroy","create"]),
 ("mcq","Most of an atom's mass is concentrated in the:","nucleus",["electron cloud","shells","empty space"]),
 ("fill","Atoms of one element with different numbers of neutrons are called ____. (one word)","isotopes"),
 ("mcq","Reactivity of an element is mostly determined by its:","valence electrons",["number of neutrons","color","mass alone"]),
 ("mcq","Horizontal rows of the periodic table are:","periods",["groups","families","columns"]),
 ("mcq","The periodic table is arranged in order of increasing:","atomic number",["mass number","alphabet","density"]),
 ("mcq","A neutral atom has equal numbers of protons and:","electrons",["neutrons","ions","molecules"]),
],
"natural-selection": [
 ("mcq","Heritable traits that improve survival and reproduction tend to become:","more common over generations",["less common","random","extinct immediately"]),
 ("mcq","The raw material for new variation in populations comes from:","mutations",["studying","exercise","weather"]),
 ("mcq","An organism's reproductive success is a measure of its:","fitness",["height","speed only","age"]),
 ("mcq","Natural selection requires variation, heredity, and differences in:","survival and reproduction",["color only","names","habitats only"]),
 ("mcq","Fossils, anatomy, and DNA all provide ____ for evolution.","evidence",["disproof","randomness","opinions"]),
 ("mcq","Over very long times, accumulated changes can produce new:","species",["planets","minerals","seasons"]),
 ("mcq","Similar bones in a human arm and a whale fin are ____ structures.","homologous",["identical","unrelated","artificial"]),
 ("mcq","Selective breeding by humans is also called:","artificial selection",["natural selection","mutation","migration"]),
 ("mcq","Antibiotic resistance in bacteria evolves because resistant cells:","survive and reproduce more",["choose to resist","never reproduce","become viruses"]),
 ("mcq","If the environment changes, the best-adapted individuals are more likely to:","survive and pass on traits",["all die equally","stop reproducing","become plants"]),
 ("mcq","Genetic variation in a population generally helps it:","adapt to change",["stay identical","go extinct","stop evolving"]),
 ("mcq","Two populations separated for a long time may eventually be unable to:","interbreed (forming new species)",["survive at all","mutate","photosynthesize"]),
 ("mcq","Darwin's finches differ in beak shape because different shapes suit different:","foods",["weathers","colors","rocks"]),
 ("mcq","Traits that do not affect survival much tend to:","persist or drift, not be strongly selected",["always vanish","always spread","cause extinction"]),
 ("mcq","Comparing DNA sequences shows that closely related species share:","more similar genes",["no genes","identical genes always","random genes"]),
 ("fill","A heritable feature that improves survival is an ____. (one word)","adaptation"),
 ("mcq","Camouflage increases an animal's fitness by helping it:","avoid predators",["fly","photosynthesize","grow taller"]),
 ("mcq","Natural selection acts on ____ traits, not traits learned during life.","inherited",["learned","painted","temporary"]),
 ("mcq","A population's gene pool is the:","collection of all its alleles",["number of animals only","its habitat","its food"]),
 ("mcq","The scientist most associated with the theory of evolution by natural selection is:","Charles Darwin",["Isaac Newton","Gregor Mendel only","Albert Einstein"]),
],
"heredity-and-genes": [
 ("mcq","Genes are segments of:","DNA",["RNA only","protein","ATP"]),
 ("mcq","Different versions of the same gene are called:","alleles",["chromosomes","ribosomes","ions"]),
 ("mcq","An organism's genetic makeup is its:","genotype",["phenotype","habitat","niche"]),
 ("mcq","An organism's observable traits make up its:","phenotype",["genotype","allele","gene"]),
 ("mcq","A capital letter usually represents a ____ allele.","dominant",["recessive","mutated","missing"]),
 ("mcq","A trait expressed only when two recessive alleles are present is:","recessive",["dominant","codominant always","blended"]),
 ("mcq","A Punnett square predicts the ____ of offspring genotypes.","probabilities",["exact futures","habitats","food"]),
 ("mcq","A cross of Tt x Tt gives a 3:1 ratio of:","dominant to recessive phenotypes",["recessive to dominant","all recessive","all dominant"]),
 ("mcq","A permanent change in a DNA sequence is a:","mutation",["habitat","phenotype only","ion"]),
 ("mcq","Mutations can be harmful, helpful, or:","neutral",["always fatal","always beneficial","impossible"]),
 ("mcq","Offspring of sexual reproduction inherit ____ of their genes from each parent.","half",["all","none","three quarters"]),
 ("mcq","Sexual reproduction increases genetic:","variation",["sameness","extinction","mass"]),
 ("mcq","Tightly coiled DNA forms structures called:","chromosomes",["ribosomes","vacuoles","membranes"]),
 ("mcq","If both parents are Tt, what fraction of offspring are expected to be tt?","1/4",["1/2","3/4","0"]),
 ("mcq","Codominance is when ____ alleles are both fully expressed.","two different",["no","only recessive","only dominant"]),
 ("fill","Different versions of a gene are called ____. (one word)","alleles"),
 ("mcq","A mutation in a body (somatic) cell is:","not passed to offspring",["always passed on","always fatal","not real"]),
 ("mcq","Genetic engineering can change an organism's traits by altering its:","DNA",["habitat","diet only","behavior only"]),
 ("mcq","The passing of traits from parents to offspring is called:","heredity",["erosion","metamorphosis","respiration"]),
 ("mcq","Identical twins have the same genotype because they came from one:","fertilized egg",["sperm only","gene","chromosome"]),
],
"solar-system": [
 ("mcq","The force that keeps planets in orbit around the Sun is:","gravity",["friction","magnetism","inertia alone"]),
 ("mcq","Gravitational force between two objects increases with greater ____ and less distance.","mass",["color","temperature","speed"]),
 ("mcq","Earth's seasons are caused by the:","tilt of Earth's axis as it orbits",["distance changing a lot","Sun's brightness changing","Moon"]),
 ("mcq","A solar eclipse occurs when the ____ blocks sunlight to Earth.","Moon",["Sun","another planet","a comet"]),
 ("mcq","A lunar eclipse occurs when ____ shadow falls on the Moon.","Earth's",["the Sun's","Mars's","Jupiter's"]),
 ("mcq","The Moon shines because it ____ sunlight.","reflects",["produces","absorbs all","blocks"]),
 ("mcq","The inner planets are mostly ____ compared with the gas giants.","rocky and small",["gaseous and huge","made of ice only","stars"]),
 ("mcq","Tides on Earth are caused mainly by the gravity of the:","Moon",["Sun only","stars","other galaxies"]),
 ("mcq","One year is the time Earth takes to ____ the Sun.","orbit",["spin once","cross the Moon","heat up"]),
 ("mcq","One day is the time Earth takes to:","rotate once on its axis",["orbit the Sun","orbit the Moon","cool down"]),
 ("mcq","The Sun is best described as a:","star",["planet","moon","comet"]),
 ("mcq","Compared to the Sun, the planets are:","much smaller",["much larger","the same size","stars too"]),
 ("mcq","The phases of the Moon repeat about every:","month",["day","year","week"]),
 ("mcq","Gravity is what gives objects their:","weight",["color","temperature","charge"]),
 ("mcq","Models help us understand the solar system because the real distances are:","extremely large",["very small","exactly to scale on paper","unknown"]),
 ("fill","The force that holds planets in orbit around the Sun is ____. (one word)","gravity"),
 ("mcq","Astronomers measure huge space distances in units like the:","light-year",["meter only","mile only","kilogram"]),
 ("mcq","The closer a planet is to the Sun, generally the ____ its orbit (year).","shorter",["longer","colder","heavier"]),
 ("mcq","Earth, the Moon, and the Sun all interact through:","gravity",["friction","sound","magnetism only"]),
 ("mcq","A galaxy is a massive system of stars, gas, dust, and:","dark matter / planetary systems",["oceans","weather","continents"]),
],
"human-impact": [
 ("mcq","The buildup of carbon dioxide and methane in the atmosphere enhances the:","greenhouse effect",["ozone layer","water cycle only","tides"]),
 ("mcq","Burning fossil fuels is a major source of:","carbon dioxide emissions",["clean oxygen","fresh water","forests"]),
 ("mcq","Average global temperatures have been:","rising over the past century",["falling sharply","perfectly steady","unmeasurable"]),
 ("mcq","Renewable energy sources include solar, wind, and:","hydroelectric",["coal","oil","natural gas"]),
 ("mcq","Deforestation contributes to climate change partly by removing trees that absorb:","carbon dioxide",["oxygen","plastic","metal"]),
 ("mcq","Loss of habitat is a leading cause of declining:","biodiversity",["pollution","traffic","erosion"]),
 ("mcq","Reducing, reusing, and recycling helps conserve:","natural resources",["pollution","landfills","traffic"]),
 ("mcq","Ocean acidification is caused by oceans absorbing excess:","carbon dioxide",["oxygen","salt","plastic only"]),
 ("mcq","Scientists track climate using long-term data on temperature, ice, and:","sea level",["traffic","population names","stock prices"]),
 ("mcq","Switching from gasoline cars to electric and transit reduces:","greenhouse gas emissions",["clean air","forest cover","fresh water"]),
 ("mcq","A nonrenewable resource is one that:","forms far slower than we use it",["never runs out","regrows yearly","is unlimited"]),
 ("mcq","Protecting wetlands and forests helps maintain:","ecosystem services and biodiversity",["more pollution","faster warming","fewer species"]),
 ("mcq","Single-use plastics are a problem mainly because they:","persist and pollute for a long time",["decompose instantly","feed wildlife","clean oceans"]),
 ("mcq","Engineering solutions to climate include carbon capture and:","renewable energy",["burning more coal","clearing forests","wasting water"]),
 ("mcq","Human population growth increases demand for:","resources like water, food, and energy",["less of everything","nothing","only entertainment"]),
 ("fill","Using resources so they last for the future is called being ____. (one word)","sustainable"),
 ("mcq","Evidence that current warming is human-influenced includes the rise in CO2 from:","fossil fuel use",["volcanoes only","the Sun cooling","ocean cooling"]),
 ("mcq","Conserving energy at home (LED bulbs, insulation) helps reduce:","emissions and resource use",["biodiversity","clean air","forests"]),
 ("mcq","Restoring ecosystems (replanting, cleanups) can:","increase biodiversity",["cause extinction","add pollution","warm the planet"]),
 ("mcq","International cooperation on climate matters because the atmosphere is:","shared by all countries",["owned by one nation","not affected by humans","only regional"]),
],
"plate-tectonics": [
 ("mcq","Earth's lithosphere is broken into moving:","tectonic plates",["continents only","oceans","craters"]),
 ("mcq","Plates move because of ____ currents in the mantle.","convection",["evaporation","reflection","sound"]),
 ("mcq","At a divergent boundary, plates:","move apart, forming new crust",["collide","slide past","stop moving"]),
 ("mcq","At a convergent boundary, plates:","collide",["spread apart","slide past only","vanish"]),
 ("mcq","At a transform boundary, plates:","slide past each other",["collide head-on","spread apart","melt"]),
 ("mcq","Most earthquakes and volcanoes occur:","along plate boundaries",["randomly anywhere","in the sky","only midplate"]),
 ("mcq","Subduction is when one plate ____ beneath another.","sinks",["rises into the air","disappears","stops forever"]),
 ("mcq","New ocean floor forms at:","mid-ocean ridges",["beaches","mountain peaks","river deltas"]),
 ("mcq","Matching fossils and rock types on separate continents support:","continental drift / plate tectonics",["the water cycle","gravity","photosynthesis"]),
 ("mcq","The theory that continents were once joined as one landmass is:","Pangaea / continental drift",["the rock cycle","the food web","the water cycle"]),
 ("mcq","Mountains often form where plates:","collide and crust is pushed up",["spread apart only","stop existing","melt instantly"]),
 ("mcq","A sudden release of energy along a fault causes an:","earthquake",["eclipse","aurora","tide"]),
 ("mcq","Magma reaching the surface through a vent forms a:","volcano",["glacier","canyon","delta"]),
 ("mcq","The age of seafloor rocks ____ with distance from a mid-ocean ridge.","increases",["decreases","stays the same","is random"]),
 ("mcq","The Ring of Fire is a zone of frequent earthquakes and:","volcanoes",["hurricanes","deserts","glaciers"]),
 ("fill","Slow-moving currents in the mantle that drive plate motion are ____ currents. (one word)","convection"),
 ("mcq","Plates move at roughly the rate that:","fingernails grow",["a car drives","sound travels","light travels"]),
 ("mcq","Deep ocean trenches usually form at ____ boundaries.","convergent (subduction)",["divergent","transform only","midplate"]),
 ("mcq","Earth's interior heat that drives tectonics comes partly from:","radioactive decay and leftover heat",["the Moon","ocean tides","wind"]),
 ("mcq","Over millions of years, plate movements:","reshape continents and oceans",["change daily weather","stop gravity","create stars"]),
],
}


# ================================================= READING (authored, grade 8)

READING8 = {
"central-idea": [
 ("mcq","A central idea is best described as a text's:","most important controlling point",["first sentence","longest word","title"]),
 ("mcq","Two or more central ideas in a longer text are usually connected by a:","shared overall message or topic",["random list","page number","font"]),
 ("mcq","Read: \"Automation boosts productivity but also displaces some workers, forcing society to adapt.\" The central idea is that automation:","brings both gains and challenges",["is only good","is only bad","is unimportant"]),
 ("mcq","Supporting details strengthen a central idea by providing:","evidence and examples",["distractions","the title","page numbers"]),
 ("mcq","To analyze how a central idea develops, trace it across:","paragraphs and sections",["a single word","the cover","the index"]),
 ("mcq","An objective statement of a central idea omits the reader's:","personal judgments",["the main point","key evidence","topic"]),
 ("mcq","A detail unrelated to the controlling idea is:","irrelevant",["essential","central","the thesis"]),
 ("mcq","Read: \"Despite risks, vaccination has saved millions of lives by preventing disease outbreaks.\" The central idea is that vaccination is:","largely beneficial to public health",["dangerous","useless","new"]),
 ("mcq","In an argument, the central idea is usually the author's main:","claim or thesis",["counterexample","footnote","title"]),
 ("mcq","A strong reader determines a central idea by identifying the point that:","the details collectively support",["appears once","is shortest","is in bold"]),
 ("mcq","Read: \"Urban green spaces reduce heat, clean air, and improve residents' well-being.\" The central idea is that green spaces:","benefit cities in multiple ways",["are decorative only","are harmful","are rare"]),
 ("mcq","Section headings and topic sentences often signal a text's:","developing central ideas",["price","binding","font"]),
 ("mcq","Removing supporting details would leave a central idea:","less fully developed or proven",["clearer always","longer","unchanged in proof"]),
 ("mcq","Two central ideas in one article should be analyzed for how they:","relate to each other",["contradict the title","are printed","are paginated"]),
 ("mcq","Determining a central idea helps a reader understand the text's:","overall purpose and message",["word count","margins","font size"]),
 ("fill","The most important controlling point of a text is its ____ idea. (one word)","central"),
 ("mcq","Which best states a central idea?","Renewable energy is essential for a sustainable future.",["Wind turbines are tall.","It was a windy day.","Panels can be blue."]),
 ("mcq","A central idea differs from a supporting detail because it is:","broader and more important",["narrower","a single fact","the title only"]),
 ("mcq","Read: \"Reading widely builds vocabulary, empathy, and critical thinking.\" The central idea is that reading:","develops valuable skills",["is boring","is easy","wastes time"]),
 ("mcq","Analyzing the development of a central idea means examining the text's:","structure and evidence",["fonts","page numbers","cover art"]),
],
"theme-development": [
 ("mcq","A theme is a literary work's:","central message about life or human nature",["setting","narrator","title"]),
 ("mcq","Authors develop a theme through plot, conflict, and:","characters' choices and changes",["page numbers","fonts","margins"]),
 ("mcq","A theme differs from a subject because a theme is a:","complete insight or claim",["single noun","place","name"]),
 ("mcq","Read: \"Warned of the danger, the leaders ignored it and the city fell.\" A theme is:","ignoring wisdom invites disaster",["cities are old","warnings are fun","leaders are tall"]),
 ("mcq","A recurring symbol throughout a story often reinforces the:","theme",["index","page count","glossary"]),
 ("mcq","To analyze theme development, track how it emerges:","over the entire text",["only at the start","in the title only","never"]),
 ("mcq","Read: \"After years of revenge, he found only emptiness, not peace.\" A theme is:","revenge does not bring fulfillment",["revenge is rewarding","peace is impossible","time stops"]),
 ("mcq","A theme should be stated as a:","general statement about life",["plot summary","single word","setting"]),
 ("mcq","Two different works can explore the same theme, such as:","the cost of ambition",["the same plot","the same author","the same length"]),
 ("mcq","As a narrative unfolds, a theme typically becomes:","clearer through events and choices",["less important","random","the title"]),
 ("mcq","Read: \"She told the truth though it cost her everything, and kept her integrity.\" The theme concerns:","integrity and honesty",["winning at all costs","fear","luck"]),
 ("mcq","A dynamic character's growth often reveals the work's:","theme",["page count","font","cover"]),
 ("mcq","A well-developed theme applies:","beyond the story to human experience",["only to one scene","to the cover","to nothing"]),
 ("mcq","Read: \"The estranged siblings reconciled, realizing family mattered most.\" The theme is:","the importance of family / reconciliation",["family is a burden","money matters most","isolation is best"]),
 ("mcq","Which is a theme, not a topic?","Unchecked power can corrupt.",["a ruler","a kingdom","a war"]),
 ("fill","The deeper message or insight of a literary work is its ____. (one word)","theme"),
 ("mcq","Conflicts in a narrative often serve to develop its:","theme",["page number","setting only","font"]),
 ("mcq","Read: \"Mocked for years, the inventor persisted and transformed the world.\" The theme is:","perseverance can lead to greatness",["mockery wins","quit early","luck is all"]),
 ("mcq","A precise theme statement is a:","universal truth illustrated by the work",["plot recap","the title","a character's name"]),
 ("mcq","Tracing characters' responses to conflict helps a reader identify the:","theme",["publisher","page count","font"]),
],
"summarizing": [
 ("mcq","An objective summary remains:","neutral and free of personal opinion",["opinionated","exaggerated","fictional"]),
 ("mcq","A strong summary captures the central idea and the:","most significant supporting details",["every minor detail","your reaction","the page color"]),
 ("mcq","A summary should be ____ than the original text.","more concise",["longer","identical","just the title"]),
 ("mcq","Summaries should be written in:","the reader's own words",["the author's exact words","code","emojis"]),
 ("mcq","What does NOT belong in an objective summary?","the reader's evaluation",["the central idea","key points","the topic"]),
 ("mcq","In summarizing an argument, include the author's claim and:","main supporting reasons",["favorite color","birthday","font"]),
 ("mcq","Narrative summaries should preserve the:","logical order of events",["random order","reverse only","no order"]),
 ("mcq","Inserting 'this is wrong' into a summary makes it:","no longer objective",["stronger","required","shorter"]),
 ("mcq","To condense a passage, a reader should:","synthesize ideas and drop minor details",["repeat sentences","add new examples","copy it"]),
 ("mcq","A precise one-sentence summary states the text's:","central idea",["smallest detail","page count","author bio"]),
 ("mcq","Quoting extensively in a summary tends to make it:","too long and not concise",["objective","ideal","short"]),
 ("mcq","A summary and the source share the same:","central idea",["wording","length","page count"]),
 ("mcq","Which is the best summary of a study showing exercise improves memory and mood across ages?","Exercise benefits memory and mood for people of all ages.",["Exercise is fun.","People are different.","Gyms can be busy."]),
 ("mcq","An objective summary of a debate presents:","both sides' main points fairly",["only your side","only the loser","no points"]),
 ("mcq","Paraphrasing differs from summarizing because paraphrasing:","restates a passage at similar length",["is much shorter","adds opinion","is the title"]),
 ("fill","A concise, neutral restatement of a text's key points is a ____. (one word)","summary"),
 ("mcq","Effective summarizers focus on ideas that are:","central, not trivial",["trivial","longest","colorful"]),
 ("mcq","An objective summary answers primarily:","what the text says and why it matters",["how you felt","the price","the publisher"]),
 ("mcq","Before summarizing, a skilled reader:","identifies the central idea and key points",["chooses a font","counts pages","skips the text"]),
 ("mcq","Synthesizing multiple sources into one summary requires:","combining their key ideas accurately",["copying one source","ignoring all","inventing facts"]),
],
"textual-evidence": [
 ("mcq","The strongest support for an analysis is:","specific evidence drawn from the text",["a personal guess","the title only","an unrelated quote"]),
 ("mcq","An inference must be supported by:","clues and evidence in the text",["a wild guess","the cover","nothing"]),
 ("mcq","Strong textual evidence is relevant and:","accurate (truly stated in the text)",["invented","off-topic","about the author"]),
 ("mcq","Quotation marks indicate the words are the:","author's exact words",["reader's words","a summary","the title"]),
 ("mcq","Which best supports the claim 'the narrator is unreliable'?","'I'm sure I locked it,' he said, though the door stood open.",["The book is long.","It was a Tuesday.","The cover is gray."]),
 ("mcq","When asked to justify an interpretation, cite:","textual evidence",["a guess","the page color","the author's age"]),
 ("mcq","A claim with no supporting evidence is:","unsupported / weak",["always correct","the central idea","a quotation"]),
 ("mcq","Citing precise evidence makes an argument more:","convincing and credible",["confusing","shorter only","colorful"]),
 ("mcq","An explicit detail is one the text:","states directly",["only implies","never includes","puts in the title"]),
 ("mcq","An inference combines text evidence with the reader's:","background knowledge",["random guesses","the cover","page numbers"]),
 ("mcq","Paraphrased evidence must still be:","grounded in the text",["made up","about you","unrelated"]),
 ("mcq","Several relevant quotations make a point:","stronger and better supported",["weaker","off-topic","shorter only"]),
 ("mcq","If the text contradicts your claim, the best move is to:","revise your claim",["keep it anyway","blame the text","stop reading"]),
 ("mcq","Best evidence that a character feels guilt:","'He avoided their eyes and his voice faltered.'",["The story is sad.","It has 12 chapters.","The cover is blue."]),
 ("mcq","Identifying the strongest evidence means choosing details that are:","most relevant and convincing",["longest","most colorful","random"]),
 ("fill","Information taken directly from a text to support a point is text ____. (one word)","evidence"),
 ("mcq","Drawing a conclusion the text implies but does not state is an:","inference",["explicit fact","title","opinion only"]),
 ("mcq","A thorough analysis includes a claim, evidence, and:","reasoning that links them",["a guess","the title","page count"]),
 ("mcq","Citing the paragraph number helps readers:","locate and verify the evidence",["pick a font","count words","skip reading"]),
 ("mcq","Evidence should be chosen because it:","directly supports the claim",["is the longest","looks nice","is random"]),
],
"authors-perspective": [
 ("mcq","An author's purpose could be to inform, entertain, persuade, or:","explain a process",["sleep","drive","eat"]),
 ("mcq","An author's perspective is their:","stance or attitude toward the topic",["page count","handwriting","address"]),
 ("mcq","A persuasive essay primarily aims to:","convince the reader",["only list facts","tell a joke","sell paper"]),
 ("mcq","Emotionally charged word choice can reveal an author's:","bias / perspective",["page number","font","binding"]),
 ("mcq","A text presenting only one side of an issue is likely:","biased",["objective","fictional","a poem"]),
 ("mcq","To find the author's purpose, ask:","why was this written?",["how long is it?","who printed it?","what font?"]),
 ("mcq","Recognizing perspective helps a reader evaluate a text's:","reliability and intent",["weight","color","price"]),
 ("mcq","Rhetorical appeals to emotion are called:","pathos",["logos","ethos","kairos"]),
 ("mcq","Appeals to logic and evidence are called:","logos",["pathos","ethos","kairos"]),
 ("mcq","Appeals to the author's credibility are called:","ethos",["pathos","logos","kairos"]),
 ("mcq","A satirical piece uses humor or irony mainly to:","criticize or make a point",["report neutrally","teach arithmetic","sell shoes"]),
 ("mcq","A balanced informational text presents:","multiple viewpoints fairly",["only one side","no information","just images"]),
 ("mcq","An author who emphasizes alarming statistics likely intends to:","persuade or warn readers",["count pages","change fonts","sell paper"]),
 ("mcq","Tone is the author's ____ toward the subject; mood is what the reader feels.","attitude",["page count","font","spelling"]),
 ("mcq","Detecting an author's bias is easier when you:","compare the text with other sources",["read only that text","ignore evidence","check the font"]),
 ("fill","The reason an author writes a text is the author's ____. (one word)","purpose"),
 ("mcq","An author selects details and word choice to shape the reader's:","perception and feelings",["page numbers","margins","index"]),
 ("mcq","A 'how-to' manual's main purpose is to:","instruct or explain",["persuade","entertain only","argue"]),
 ("mcq","Two authors may report the same facts yet convey different:","perspectives",["page counts","fonts","titles"]),
 ("mcq","Considering purpose and perspective encourages readers to think:","critically",["less","not at all","only about length"]),
],
"word-connotation": [
 ("mcq","A word's denotation is its:","literal dictionary meaning",["emotional association","rhyme","origin"]),
 ("mcq","A word's connotation is its:","emotional or implied association",["dictionary definition","letter count","spelling"]),
 ("mcq","'Frugal' and 'stingy' share a denotation but differ in:","connotation",["spelling only","length","prefix"]),
 ("mcq","Which has the more POSITIVE connotation?","confident",["arrogant","cocky","smug"]),
 ("mcq","Which has the more NEGATIVE connotation?","nosy",["curious","interested","inquisitive"]),
 ("mcq","Read: \"A delicate aroma drifted from the kitchen.\" \"Aroma\" carries a ____ connotation.","positive",["negative","strictly neutral","no"]),
 ("mcq","Read: \"A foul stench rose from the drain.\" \"Stench\" carries a ____ connotation.","negative",["positive","neutral","no"]),
 ("mcq","Authors choose words with particular connotations to:","shape readers' attitudes",["count pages","fill space","change fonts"]),
 ("mcq","The Greek root 'chrono' (as in chronological) relates to:","time",["water","light","sound"]),
 ("mcq","The root 'dict' (as in predict, dictate) relates to:","speaking / saying",["seeing","hearing","writing only"]),
 ("mcq","'Youthful' vs 'immature': the more negative term is:","immature",["youthful","both equal","neither"]),
 ("mcq","Read: \"His relentless effort finally paid off.\" \"Relentless\" here connotes:","determined persistence (positive)",["cruelty","laziness","fear"]),
 ("mcq","Recognizing connotation explains why synonyms are not always:","interchangeable",["spelled alike","the same length","nouns"]),
 ("mcq","The prefix 'anti-' (as in antifreeze) means:","against",["before","again","without"]),
 ("mcq","Read: \"The economical design saved fuel and money.\" \"Economical\" connotes being:","efficient (positive)",["wasteful","cheap-quality","careless"]),
 ("fill","The feelings and associations attached to a word are its ____. (one word)","connotation"),
 ("mcq","Choosing 'cheap' rather than 'affordable' adds a more ____ tone.","negative",["positive","neutral","formal"]),
 ("mcq","The root 'photo' (as in photograph) relates to:","light",["sound","water","earth"]),
 ("mcq","Words with strong connotations are especially common in:","persuasive and literary writing",["math proofs","phone books","tax forms"]),
 ("mcq","Read: \"She was slender,\" suggests a ____ impression compared with \"she was scrawny.\"","more positive",["more negative","identical","no"]),
],
"text-structure": [
 ("mcq","A text arranged in time order uses a ____ structure.","chronological / sequence",["compare-contrast","cause-effect","problem-solution"]),
 ("mcq","A text explaining reasons and their results uses:","cause and effect",["sequence","description","compare"]),
 ("mcq","A text examining similarities and differences uses:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","A text that raises an issue and proposes remedies uses:","problem and solution",["sequence","description","compare"]),
 ("mcq","Signal words 'consequently, thus, due to' indicate:","cause and effect",["sequence","compare","description"]),
 ("mcq","Signal words 'conversely, likewise, in contrast' indicate:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","Signal words 'initially, subsequently, ultimately' indicate:","sequence",["compare","cause-effect","problem-solution"]),
 ("mcq","Analyzing structure helps a reader see how the author:","organizes and emphasizes ideas",["picks a cover","sets the price","chooses a font"]),
 ("mcq","An article on 'why coral reefs are dying and how to protect them' uses:","problem and solution with cause-effect",["sequence only","description only","none"]),
 ("mcq","A passage that paints a detailed picture of a setting uses:","description",["sequence","cause-effect","problem-solution"]),
 ("mcq","A historical account from earliest to latest events uses a ____ structure.","chronological",["compare","problem-solution","description"]),
 ("mcq","Recognizing problem-solution structure helps you find the author's:","proposed solution",["setting","rhyme","title"]),
 ("mcq","Authors sometimes combine structures, like comparing the causes of two events, blending:","compare-contrast and cause-effect",["only sequence","only description","none"]),
 ("mcq","A 'pros and cons' section most likely uses:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","'Pollution increased; consequently, species declined' demonstrates:","cause and effect",["sequence","compare","description"]),
 ("fill","A text organized strictly by time order uses a ____ structure. (one word)","chronological"),
 ("mcq","Understanding text structure first makes a complex text:","easier to analyze and recall",["longer","impossible","cheaper"]),
 ("mcq","How an author orders and connects ideas is part of a text's:","structure",["price","author bio","font"]),
 ("mcq","Cause-effect structure answers the question:","why did this happen and what resulted?",["what comes first?","how are they alike?","what is the issue?"]),
 ("mcq","A flowchart of steps best matches a ____ structure.","sequence / chronological",["compare","description","problem-solution"]),
],
"figurative-tone": [
 ("mcq","\"The news was a punch to the gut\" is a:","metaphor",["simile","idiom","fact"]),
 ("mcq","\"She fought like a tiger\" is a:","simile",["metaphor","idiom","hyperbole"]),
 ("mcq","Giving human qualities to nonhuman things is:","personification",["a simile","hyperbole","onomatopoeia"]),
 ("mcq","\"I'm so hungry I could eat a horse\" is:","hyperbole",["a simile","a metaphor","an idiom"]),
 ("mcq","'Bite the bullet,' meaning to endure hardship, is an:","idiom",["literal action","simile","fact"]),
 ("mcq","Tone is the author's ____ toward the subject.","attitude",["page count","font","spelling"]),
 ("mcq","A passage using 'bleak, hollow, gray' creates a ____ tone.","somber / melancholy",["cheerful","comic","excited"]),
 ("mcq","Verbal irony is saying the opposite of what one:","truly means",["spells","measures","prints"]),
 ("mcq","Mood is the feeling created in the:","reader",["author only","printer","margins"]),
 ("mcq","Words imitating sounds, like 'clang' and 'sizzle,' are:","onomatopoeia",["similes","metaphors","idioms"]),
 ("mcq","An allusion is a reference to a well-known person, event, or:","work (e.g., from history or literature)",["page number","font","margin"]),
 ("mcq","Symbolism is when something concrete represents an abstract:","idea",["sound","number","font"]),
 ("mcq","\"Time devoured the old city\" gives time a human/animal action, so it is:","personification",["a simile","hyperbole","an idiom"]),
 ("mcq","A sarcastic tone usually conveys:","mockery or scorn",["sincere praise","neutral facts","fear only"]),
 ("mcq","\"Her smile was sunshine\" is a:","metaphor",["simile","idiom","onomatopoeia"]),
 ("fill","An author's attitude toward the subject is the ____. (one word)","tone"),
 ("mcq","Figurative language and word choice together create:","tone and mood",["page numbers","margins","the index"]),
 ("mcq","An understatement deliberately makes something seem:","less important than it is",["more important","louder","colorful"]),
 ("mcq","\"The thunder roared and the wind shrieked\" mainly uses:","personification",["statistics","an idiom","an allusion"]),
 ("mcq","Which is NOT figurative language?","The meeting starts at nine.",["He's drowning in homework.","Quiet as a tomb.","The stars blinked."]),
],
"compare-authors": [
 ("mcq","Comparing two texts on the same topic highlights their differing:","approaches and perspectives",["page numbers","fonts","prices"]),
 ("mcq","A firsthand memoir and a researched article on one event differ most in:","point of view and type of detail",["the date","whether it occurred","the planet"]),
 ("mcq","When two authors disagree, a critical reader:","weighs the evidence and reasoning in each",["believes the longer text","ignores both","picks randomly"]),
 ("mcq","Reading several sources on a topic helps a reader develop a:","more balanced, informed view",["narrower view","less knowledge","ignorance of facts"]),
 ("mcq","A primary source is created by someone who:","witnessed or took part in the event",["wrote a later textbook","invented a story","studied an unrelated topic"]),
 ("mcq","A secondary source typically:","analyzes or interprets events afterward",["is always firsthand","is fiction","contains no facts"]),
 ("mcq","Two authors may present the same facts yet reach different:","conclusions",["page counts","titles","fonts"]),
 ("mcq","Comparing a novel to its film adaptation often reveals the film:","omits or alters details",["adds nothing","is identical","has no characters"]),
 ("mcq","Synthesizing sources means:","integrating ideas across multiple texts",["copying one source","ignoring all","reading none"]),
 ("mcq","Differences in tone between two articles on one event reflect each author's:","perspective and purpose",["page count","font","binding"]),
 ("mcq","An author's bias is easier to detect when you:","compare the text against other accounts",["read only that text","ignore evidence","check the font"]),
 ("mcq","Evaluating conflicting sources requires checking each source's:","credibility and evidence",["page color","font size","author's age"]),
 ("mcq","A scientific report differs from an opinion column mainly in its:","use of evidence and objectivity",["topic","alphabet","length"]),
 ("mcq","Comparing how two writers describe the same setting reveals each one's:","style and word choice",["page count","publisher","price"]),
 ("mcq","Two infographics of the same data may differ in:","emphasis and presentation",["the facts","the truth","the topic"]),
 ("fill","Examining how two texts are alike and different is to ____ them. (one word, starts with c)","compare"),
 ("mcq","Considering multiple viewpoints before forming a conclusion demonstrates:","critical reading",["lazy reading","skimming","guessing"]),
 ("mcq","Reading an eyewitness account alongside a historian's analysis gives the reader:","a fuller understanding of the event",["less information","only opinions","only fiction"]),
 ("mcq","When sources conflict, the most reliable is usually the one with:","stronger evidence and credibility",["the most pages","the prettiest font","the oldest cover"]),
 ("mcq","Comparing texts across genres on one theme shows how form affects:","meaning and impact",["page count","price","binding"]),
],
"plot-character-development": [
 ("mcq","The arrangement of events in a narrative is the:","plot",["theme","setting","tone"]),
 ("mcq","The central struggle that drives a story is the:","conflict",["setting","genre","title"]),
 ("mcq","A character who undergoes significant change is:","dynamic",["static / flat","minor only","the narrator"]),
 ("mcq","A complex, multi-faceted character is described as:","round",["flat","static only","off-page"]),
 ("mcq","The moment of greatest tension and turning point is the:","climax",["exposition","resolution","setting"]),
 ("mcq","Events that build tension before the climax are the:","rising action",["resolution","exposition","falling action"]),
 ("mcq","Events after the climax that lead to the ending are the:","falling action",["rising action","exposition","climax"]),
 ("mcq","A struggle within a character's own mind is:","internal conflict",["external conflict","setting","tone"]),
 ("mcq","A struggle against another character, nature, or society is:","external conflict",["internal conflict","theme","plot only"]),
 ("mcq","The reason a character behaves a certain way is their:","motivation",["height","clothing","name"]),
 ("mcq","Characterization is the way an author reveals a character's:","personality and traits",["page count","font","cover"]),
 ("mcq","How a character responds to conflict reveals their:","values and growth",["address","shoe size","favorite color"]),
 ("mcq","Read: \"Maya must betray a friend to save many strangers.\" This is mainly:","internal conflict (a moral dilemma)",["external conflict only","setting","tone"]),
 ("mcq","Character development means a character:","grows or changes meaningfully over the story",["never changes","is described once","is just named"]),
 ("mcq","Subplots are secondary storylines that usually:","support or complicate the main plot",["replace the title","number the pages","design the cover"]),
 ("fill","The central problem that drives a story is the ____. (one word)","conflict"),
 ("mcq","A foil is a character who, by contrast, highlights another character's:","traits",["page number","font","setting"]),
 ("mcq","A flashback interrupts the plot to show:","an earlier event",["a future event for certain","the ending","the title"]),
 ("mcq","Comparing a character at the beginning and end reveals their:","development (or lack of change)",["page count","font","price"]),
 ("mcq","Analyzing plot and characters together helps a reader interpret the story's:","theme and meaning",["page count","font","price"]),
],
}


# ===================================================== TOPIC REGISTRY (grade 8)

TOPICS8 = [
 # ---- MATH (computed, banded by difficulty, de-duplicated) ----
 ("math","exponent-rules","Exponent Rules","8.EE.A.1",
  "Use the laws of exponents to multiply, divide, and raise powers to powers.", G(m_exponent_rules)),
 ("math","scientific-notation","Scientific Notation","8.EE.A.3",
  "Scientific notation writes very large or small numbers as a number times a power of ten.", G(m_scientific_notation)),
 ("math","roots","Square & Cube Roots","8.EE.A.2",
  "A square root undoes squaring; a cube root undoes cubing.", G(m_roots)),
 ("math","linear-equations","Linear Equations","8.EE.C.7",
  "Solve equations with variables on both sides by collecting like terms.", G(m_linear_equations)),
 ("math","slope","Slope","8.EE.B.6",
  "Slope is the rate of change: the rise (change in y) divided by the run (change in x).", G(m_slope)),
 ("math","pythagorean-theorem","Pythagorean Theorem","8.G.B.7",
  "In a right triangle, a^2 + b^2 = c^2, where c is the hypotenuse.", G(m_pythagorean)),
 ("math","functions","Functions","8.F.A.1",
  "A function pairs each input with exactly one output. Evaluate f(x) by substituting.", G(m_functions)),
 ("math","volume-cylinders-cones","Volume of Cylinders & Cones","8.G.C.9",
  "Cylinder volume = pi x r x r x h; a cone is one-third of that. Use 3.14 for pi.", G(m_volume_curved)),
 ("math","rational-irrational","Rational & Irrational Numbers","8.NS.A.1",
  "Rational numbers can be written as fractions; irrational numbers (like pi) cannot.", G(m_rational_irrational)),
 ("math","slope-intercept","Slope-Intercept Form","8.F.B.4",
  "In y = mx + b, m is the slope and b is the y-intercept.", G(m_slope_intercept)),
 # ---- SCIENCE (grade-8 content; slugs shared with earlier grades) ----
 ("science","forces-and-motion","Forces & Motion","MS-PS2-2",
  "Newton's laws and graphs describe how forces change an object's motion.", SCIENCE8["forces-and-motion"]),
 ("science","energy-transfer","Energy & Its Conservation","MS-PS3-5",
  "Energy changes form and is conserved; work transfers energy to objects.", SCIENCE8["energy-transfer"]),
 ("science","waves","Waves & Information","MS-PS4-3",
  "Waves carry energy and information; light and sound have measurable properties.", SCIENCE8["waves"]),
 ("science","chemical-reactions","Chemical Reactions","MS-PS1-2",
  "Reactions rearrange atoms and conserve mass; bonds form by sharing or transferring electrons.", SCIENCE8["chemical-reactions"]),
 ("science","atoms-and-periodic-table","Atoms & the Periodic Table","MS-PS1-1",
  "Atomic structure and the periodic table explain elements' properties and reactivity.", SCIENCE8["atoms-and-periodic-table"]),
 ("science","natural-selection","Evolution & Natural Selection","MS-LS4-4",
  "Natural selection, supported by fossil, anatomical, and DNA evidence, shapes species over time.", SCIENCE8["natural-selection"]),
 ("science","heredity-and-genes","Genetics & Heredity","MS-LS3-2",
  "Genes made of DNA pass traits to offspring; mutations create variation.", SCIENCE8["heredity-and-genes"]),
 ("science","solar-system","Gravity & the Solar System","MS-ESS1-2",
  "Gravity governs orbits, tides, eclipses, and the motions of the solar system.", SCIENCE8["solar-system"]),
 ("science","human-impact","Climate & Human Impact","MS-ESS3-5",
  "Human activities affect Earth's climate and systems; solutions reduce harm.", SCIENCE8["human-impact"]),
 ("science","plate-tectonics","Plate Tectonics","MS-ESS2-3",
  "Moving plates, driven by mantle convection, reshape Earth and cause quakes and volcanoes.", SCIENCE8["plate-tectonics"]),
 # ---- READING (grade-8 content; slugs shared with earlier grades) ----
 ("reading","central-idea","Central Idea & Analysis","RI.8.2",
  "Determine central ideas and analyze how they develop through supporting details.", READING8["central-idea"]),
 ("reading","theme-development","Theme Development","RL.8.2",
  "Analyze how a theme develops over the course of a text through plot and character.", READING8["theme-development"]),
 ("reading","summarizing","Objective Summary","RI.8.2",
  "Summarize a text's central ideas and key details objectively.", READING8["summarizing"]),
 ("reading","textual-evidence","Citing Strong Evidence","RI.8.1",
  "Cite the strongest textual evidence to support analysis and inferences.", READING8["textual-evidence"]),
 ("reading","authors-perspective","Author's Purpose & Rhetoric","RI.8.6",
  "Analyze an author's purpose, perspective, and use of rhetorical appeals.", READING8["authors-perspective"]),
 ("reading","word-connotation","Word Meaning & Connotation","L.8.5",
  "Analyze denotation, connotation, roots, and affixes to determine meaning.", READING8["word-connotation"]),
 ("reading","text-structure","Text Structure","RI.8.5",
  "Analyze how a text's structure organizes information and develops ideas.", READING8["text-structure"]),
 ("reading","figurative-tone","Figurative Language & Tone","L.8.5",
  "Interpret figurative language and analyze how word choice creates tone and mood.", READING8["figurative-tone"]),
 ("reading","compare-authors","Analyzing Conflicting Sources","RI.8.9",
  "Analyze how two texts present and interpret the same topic or event differently.", READING8["compare-authors"]),
 ("reading","plot-character-development","Plot & Character Development","RL.8.3",
  "Analyze how dialogue and events drive plot and reveal character.", READING8["plot-character-development"]),
 # ---- WRITING (reuses shared grammar generators) ----
 ("writing","nouns","Nouns","L.8.1", "A noun names a person, place, thing, or idea.", g_nouns),
 ("writing","action-verbs","Action Verbs","L.8.1", "A verb shows action or a state of being.", g_verbs),
 ("writing","adjectives","Adjectives","L.8.1", "An adjective describes a noun.", g_adjectives),
 ("writing","pronouns","Pronouns","L.8.1", "A pronoun takes the place of a noun.", g_pronouns),
 ("writing","subject-verb-agreement","Subject-Verb Agreement","L.8.1", "The verb must agree with its subject in number.", g_subject_verb),
 ("writing","past-tense-verbs","Past-Tense Verbs","L.8.1", "Past-tense verbs describe actions that already happened.", g_past_tense),
 ("writing","plural-nouns","Plural Nouns","L.8.1", "Plurals show more than one.", g_plurals),
 ("writing","capitalization","Capitalization","L.8.2", "Capitalize sentence beginnings, I, and proper nouns.", g_capitalization),
 ("writing","end-punctuation","End Punctuation","L.8.2", "End sentences with a period, question mark, or exclamation point.", g_end_punctuation),
 ("writing","commas-in-a-series","Commas in a Series","L.8.2", "Use commas to separate three or more items in a list.", g_commas_series),
]


if __name__ == "__main__":
    print(emit_curriculum(8, TOPICS8))
