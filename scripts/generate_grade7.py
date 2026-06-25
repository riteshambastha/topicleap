#!/usr/bin/env python3
"""
TopicLeap Grade 7 curriculum seed generator.

Math is computed with 4 difficulty bands (worksheets get harder) and
de-duplicated; grammar is reused; science + reading are authored.
4 subjects x 10 topics x 20 questions, worksheets of 5.

Usage:
    python3 scripts/generate_grade7.py > supabase/seed/grade7_curriculum.sql
"""
import random
from decimal import Decimal

from generate_seed import (
    emit_curriculum, fill, mcq,
    g_nouns, g_verbs, g_adjectives, g_pronouns, g_subject_verb,
    g_past_tense, g_plurals, g_capitalization, g_end_punctuation, g_commas_series,
)
from generate_grade5 import gen_unique, _distractors, dstr, G


# ============================================================ MATH (computed)

def m_proportions(band, rng):
    a = rng.randint(2, [6, 9, 12, 15][band])
    b = rng.randint(2, [6, 9, 12, 15][band])
    m = rng.randint(2, [6, 8, 10, 12][band])
    c = a * m
    x = b * m
    return fill(f"Solve the proportion:  {a}/{b} = {c}/x .  x = ?", x)


def m_unit_rate(band, rng):
    if band <= 1:
        h = rng.randint(2, [6, 9][band])
        rate = rng.randint([3, 8][band], [12, 30][band])
        return fill(f"A car goes {h * rate} miles in {h} hours. What is the "
                    f"speed in miles per hour?", rate)
    k = rng.randint(3, [8, 12][band - 2])
    per = rng.randint([2, 5][band - 2], [9, 20][band - 2])
    return fill(f"{k} notebooks cost ${k * per}. What is the cost per "
                f"notebook, in dollars?", per)


def m_percent(band, rng):
    nbase = [100, 200, 400, 500][band]
    n = nbase * rng.randint(1, 3)
    p = rng.choice([[10, 25, 50], [10, 20, 40, 75], [5, 15, 60, 80], [12, 30, 45, 90]][band])
    val = p * n // 100
    if band == 0:
        return fill(f"What is {p}% of {n}?", val)
    if band == 1:
        return fill(f"A ${n} item is {p}% off. How many dollars do you save?", val)
    if band == 2:
        return fill(f"A ${n} bill has a {p}% tip added. How many dollars is the "
                    f"tip?", val)
    return fill(f"A price of ${n} increases by {p}%. What is the new price in "
                f"dollars?", n + val)


def m_add_sub_int(band, rng):
    hi = [12, 20, 50, 99][band]
    a, b = rng.randint(1, hi), rng.randint(1, hi)
    t = rng.random()
    if t < 0.34:
        return fill(f"-{a} + {b} = ?", -a + b)
    if t < 0.67:
        return fill(f"{a} - {b} = ?", a - b)
    return fill(f"-{a} - {b} = ?", -a - b)


def m_mul_div_int(band, rng):
    hi = [9, 12, 12, 15][band]
    a, b = rng.randint(2, hi), rng.randint(2, hi)
    t = rng.random()
    if t < 0.34:
        return fill(f"-{a} x {b} = ?", -a * b)
    if t < 0.67:
        return fill(f"-{a} x -{b} = ?", a * b)
    return fill(f"{a * b} / -{b} = ?", -a)


def m_order_ops_int(band, rng):
    if band == 0:
        a, b, c = rng.randint(2, 9), rng.randint(2, 9), rng.randint(2, 9)
        return fill(f"{a} + {b} x (-{c}) = ?", a + b * (-c))
    if band == 1:
        a, b, c = rng.randint(2, 9), rng.randint(2, 9), rng.randint(2, 9)
        return fill(f"(-{a}) x {b} + {c} = ?", (-a) * b + c)
    if band == 2:
        a, b, c, d = rng.randint(2, 9), rng.randint(2, 9), rng.randint(2, 9), rng.randint(2, 9)
        return fill(f"-{a} + {b} x {c} - {d} = ?", -a + b * c - d)
    a, b, c, d = rng.randint(3, 12), rng.randint(2, 9), rng.randint(2, 9), rng.randint(2, 9)
    return fill(f"{a} x (-{b}) - {c} x {d} = ?", a * (-b) - c * d)


def m_two_step(band, rng):
    a = rng.randint(2, [5, 8, 9, 12][band])
    x = rng.randint(2, [9, 12, 15, 20][band])
    b = rng.randint(1, [9, 15, 20, 30][band])
    if band % 2 == 0:
        return fill(f"Solve for x:  {a}x + {b} = {a * x + b}", x)
    return fill(f"Solve for x:  {a}x - {b} = {a * x - b}", x)


def m_like_terms(band, rng):
    a = rng.randint(2, [6, 8, 10, 12][band])
    b = rng.randint(2, [6, 8, 10, 12][band])
    c = rng.randint(1, [6, 9, 12, 20][band])
    correct = f"{a + b}x + {c}"
    wrong = [f"{a * b}x + {c}", f"{a + b}x + {c + 1}", f"{a + b + c}x"]
    return mcq(f"Simplify:  {a}x + {c} + {b}x", correct,
               _distractors(correct, wrong, rng), rng)


def m_circle(band, rng):
    PI = Decimal("3.14")
    r = rng.randint([2, 4, 6, 8][band], [5, 9, 14, 20][band])
    if band % 2 == 0:
        correct = dstr(PI * r * r)
        cands = [dstr(PI * 2 * r), dstr(PI * r), str(r * r), dstr(PI * r * r * 2)]
        return mcq(f"Find the AREA of a circle with radius {r}. Use 3.14 for pi. "
                   f"(area = pi x r x r)", correct, _distractors(correct, cands, rng), rng)
    correct = dstr(PI * 2 * r)
    cands = [dstr(PI * r * r), dstr(PI * r), str(2 * r), dstr(PI * 4 * r)]
    return mcq(f"Find the CIRCUMFERENCE of a circle with radius {r}. Use 3.14 for "
               f"pi. (C = 2 x pi x r)", correct, _distractors(correct, cands, rng), rng)


def m_volume(band, rng):
    if band <= 1:
        hi = [5, 9][band]
        l, w, h = (rng.randint(2, hi) for _ in range(3))
        return fill(f"A rectangular prism is {l} by {w} by {h} units. What is its "
                    f"volume in cubic units?", l * w * h)
    # triangular prism: (1/2 * base * height) * length, keep integer
    base = rng.choice([4, 6, 8, 10, 12])
    th = rng.randint(2, [7, 10][band - 2])
    length = rng.randint(3, [9, 15][band - 2])
    vol = (base * th // 2) * length
    return fill(f"A triangular prism has a triangle base of {base} and height "
                f"{th}, and a length of {length}. Volume = (1/2 x base x height) "
                f"x length = ?", vol)


# ================================================= SCIENCE (authored, MS gr. 7)

SCIENCE7 = {
"photosynthesis-respiration": [
 ("mcq","In photosynthesis, plants use sunlight, water, and carbon dioxide to make:","glucose (sugar) and oxygen",["soil and rocks","only water","carbon only"]),
 ("mcq","Which gas do plants take IN during photosynthesis?","carbon dioxide",["oxygen","nitrogen","helium"]),
 ("mcq","Which gas do plants RELEASE during photosynthesis?","oxygen",["carbon dioxide","hydrogen","methane"]),
 ("mcq","Cellular respiration releases energy from food using:","oxygen",["sunlight","soil","nitrogen"]),
 ("mcq","Respiration produces carbon dioxide, water, and:","energy (ATP)",["sugar","soil","sunlight"]),
 ("mcq","Photosynthesis happens in plant cell parts called:","chloroplasts",["mitochondria","nuclei","ribosomes"]),
 ("mcq","Cellular respiration happens mainly in the:","mitochondria",["chloroplasts","cell wall","nucleus"]),
 ("mcq","Photosynthesis and respiration are nearly:","opposite processes",["the same process","unrelated","both only in animals"]),
 ("mcq","Where does the energy for photosynthesis originally come from?","the Sun",["the soil","the air","the Moon"]),
 ("mcq","Animals get the energy stored by plants by:","eating them (and respiring)",["photosynthesizing","absorbing sunlight","drinking only"]),
 ("mcq","The green pigment that captures light energy is:","chlorophyll",["glucose","oxygen","water"]),
 ("mcq","Both plants and animals carry out:","cellular respiration",["only photosynthesis","neither","only digestion"]),
 ("mcq","During the day, plants do photosynthesis and also:","respiration",["only sleep","only freeze","stop all activity"]),
 ("mcq","The products of photosynthesis become the reactants of:","respiration",["digestion only","evaporation","erosion"]),
 ("mcq","If a plant gets no light, it cannot:","make food (glucose)",["take in water","have roots","respire ever"]),
 ("fill","The process plants use to make food from sunlight is ____. (one word)","photosynthesis"),
 ("mcq","Energy released by respiration is stored briefly in a molecule called:","ATP",["DNA","H2O","CO2"]),
 ("mcq","Carbon cycles between plants and animals through photosynthesis and:","respiration",["erosion","evaporation","gravity"]),
 ("mcq","Most of a plant's mass comes from carbon dioxide and:","water",["soil minerals only","sunlight as matter","rocks"]),
 ("mcq","Which equation best summarizes photosynthesis?","CO2 + water + light -> glucose + oxygen",["glucose -> rocks","oxygen -> CO2 only","water -> light"]),
],
"matter-and-energy-in-ecosystems": [
 ("mcq","Energy enters most ecosystems as:","sunlight",["soil","wind","rock"]),
 ("mcq","Matter such as carbon and water is:","recycled through the ecosystem",["created daily","destroyed","only in plants"]),
 ("mcq","Energy moves through an ecosystem and is mostly lost as:","heat",["matter","light","sound"]),
 ("mcq","Decomposers return nutrients (matter) to the:","soil",["Sun","atmosphere only","ocean only"]),
 ("mcq","An energy pyramid shows that available energy decreases as you go:","up the levels",["down the levels","into the Sun","sideways"]),
 ("mcq","About how much energy passes to the next trophic level?","roughly 10%",["100%","90%","0%"]),
 ("mcq","Producers capture energy and store it as:","chemical energy in food",["heat","light","sound"]),
 ("mcq","Unlike energy, matter in an ecosystem is:","conserved and cycled",["used up forever","made from nothing","turned to light"]),
 ("mcq","The carbon cycle moves carbon between organisms, the air, and the:","ground/oceans",["Moon","Sun","stars"]),
 ("mcq","Burning fossil fuels adds carbon dioxide to the:","atmosphere",["soil only","oceans only","Sun"]),
 ("mcq","If decomposers vanished, nutrients would:","stay locked in dead matter",["increase in soil","turn to energy","disappear"]),
 ("mcq","A food web models the flow of energy and the transfer of:","matter (nutrients)",["money","sound","light only"]),
 ("mcq","Because energy is lost at each step, ecosystems need a constant input of:","sunlight",["decomposers","predators","rocks"]),
 ("mcq","Water cycles through ecosystems by evaporation, condensation, and:","precipitation",["respiration only","combustion","erosion"]),
 ("mcq","The total amount of matter in a closed ecosystem stays:","about the same",["always rising","always zero","random"]),
 ("fill","Energy that enters ecosystems comes mainly from the ____. (one word)","Sun"),
 ("mcq","Nitrogen-fixing bacteria help cycle ____ into a usable form for plants.","nitrogen",["oxygen","carbon only","gold"]),
 ("mcq","A drop in the producer population would most likely cause consumers to:","decline",["increase","make food","become producers"]),
 ("mcq","Energy flows in ____ direction(s) through a food chain.","one",["two","no","random"]),
 ("mcq","Matter and energy are both essential, but only ____ is recycled.","matter",["energy","sunlight","heat"]),
],
"natural-selection": [
 ("mcq","Traits that help an organism survive and reproduce are:","favored by natural selection",["always lost","harmful","random only"]),
 ("mcq","Differences among individuals of a species are called:","variation",["extinction","mutation only","adaptation"]),
 ("mcq","Organisms with helpful traits are more likely to:","survive and have offspring",["die first","never reproduce","become plants"]),
 ("mcq","Over many generations, helpful traits become:","more common",["less common","random","extinct"]),
 ("mcq","A heritable trait that improves survival is an:","adaptation",["accident","habitat","fossil"]),
 ("mcq","Natural selection acts on traits that are:","inherited",["learned in life","painted on","temporary"]),
 ("mcq","The source of new variation in a population is:","mutation",["studying","exercise","weather"]),
 ("mcq","Camouflage is an adaptation that helps prey:","avoid predators",["fly","photosynthesize","swim faster only"]),
 ("mcq","If the environment changes, organisms best suited to it will:","be more likely to survive",["all die equally","become extinct first","stop reproducing"]),
 ("mcq","The scientist who proposed natural selection was:","Charles Darwin",["Isaac Newton","Albert Einstein","Marie Curie"]),
 ("mcq","Fossils provide evidence that species have:","changed over time",["always stayed the same","never existed","appeared yesterday"]),
 ("mcq","A population of fast-running prey likely evolved that way because slow ones:","were caught more often",["ran faster","stopped eating","grew wings"]),
 ("mcq","Selective breeding by humans is similar to natural selection but the selecting is done by:","people",["the weather","predators","the Sun"]),
 ("mcq","Antibiotic-resistant bacteria are an example of:","natural selection in action",["learning","photosynthesis","erosion"]),
 ("mcq","Which is NOT required for natural selection?","every individual being identical",["variation","heredity","differences in survival"]),
 ("fill","A heritable feature that helps an organism survive is an ____. (one word)","adaptation"),
 ("mcq","Over a long time, accumulated changes can lead to new:","species",["planets","minerals","seasons"]),
 ("mcq","Beak shapes of finches differ because different shapes help eat different:","foods",["weather","rocks","colors"]),
 ("mcq","Traits that do NOT help survival tend to become:","less common over time",["more common","mandatory","instant"]),
 ("mcq","Natural selection explains how populations:","adapt to their environment",["create themselves","never change","ignore the environment"]),
],
"heredity-and-genes": [
 ("mcq","The molecule that carries genetic information is:","DNA",["RNA only","ATP","glucose"]),
 ("mcq","A segment of DNA that codes for a trait is a:","gene",["cell","organ","ribosome"]),
 ("mcq","Offspring inherit genes from:","both parents",["only the mother","the environment","no one"]),
 ("mcq","Different versions of a gene are called:","alleles",["cells","proteins","organs"]),
 ("mcq","A trait that is expressed when at least one allele is present is:","dominant",["recessive","blended","extinct"]),
 ("mcq","A trait shown only when both alleles match is:","recessive",["dominant","mutated","learned"]),
 ("mcq","An organism's genetic makeup is its:","genotype",["phenotype","habitat","niche"]),
 ("mcq","An organism's observable traits make up its:","phenotype",["genotype","allele","gene"]),
 ("mcq","A Punnett square is used to predict:","offspring trait probabilities",["the weather","population size","extinction"]),
 ("mcq","Humans have two copies of each gene because they get one from:","each parent",["the soil","only the father","the environment"]),
 ("mcq","A change in a DNA sequence is a:","mutation",["habitat","cell wall","fossil"]),
 ("mcq","Sexual reproduction increases genetic:","variation",["sameness","extinction","mass"]),
 ("mcq","Traits like eye color are determined mostly by:","genes",["practice","diet alone","weather"]),
 ("mcq","If both parents are carriers of a recessive allele, offspring:","may show the recessive trait",["never show it","are identical","have no genes"]),
 ("mcq","Chromosomes are made of tightly coiled:","DNA",["sugar","water","minerals"]),
 ("fill","A segment of DNA that codes for a trait is called a ____. (one word)","gene"),
 ("mcq","The passing of traits from parents to offspring is:","heredity",["erosion","evaporation","gravity"]),
 ("mcq","Identical twins have the same:","DNA",["fingerprints exactly","thoughts","memories"]),
 ("mcq","A dominant allele is often shown with a:","capital letter",["lowercase letter","number","symbol only"]),
 ("mcq","Genetic variation is important because it helps a species:","adapt and survive",["stay identical","go extinct","stop reproducing"]),
],
"chemical-reactions": [
 ("mcq","In a chemical reaction, the starting substances are the:","reactants",["products","mixtures","elements only"]),
 ("mcq","The new substances formed are the:","products",["reactants","catalysts","atoms only"]),
 ("mcq","A chemical reaction forms substances with:","new properties",["the same exact properties","no atoms","no mass"]),
 ("mcq","In any reaction, the total mass of reactants equals the total mass of:","products",["nothing","the catalyst","the gas only"]),
 ("mcq","This equality of mass is the law of:","conservation of mass",["gravity","motion","reflection"]),
 ("mcq","Signs of a chemical change include a color change, gas, light, or:","temperature change",["a new shape only","melting only","dissolving only"]),
 ("mcq","Rusting iron is a:","chemical change",["physical change","phase change","mixture"]),
 ("mcq","A substance that speeds up a reaction without being used up is a:","catalyst",["reactant","product","mixture"]),
 ("mcq","Atoms are rearranged in a reaction, but they are never:","created or destroyed",["counted","named","colored"]),
 ("mcq","Burning (combustion) usually combines a fuel with:","oxygen",["nitrogen","helium","gold"]),
 ("mcq","A balanced chemical equation has equal numbers of each atom on:","both sides",["the left only","the right only","neither side"]),
 ("mcq","Mixing baking soda and vinegar produces a gas, a sign of a:","chemical reaction",["physical change","phase change","mixture"]),
 ("mcq","Which is a physical change, not chemical?","ice melting",["wood burning","iron rusting","baking a cake"]),
 ("mcq","Energy is often absorbed or released in a:","chemical reaction",["pure mixture","simple sorting","physical move"]),
 ("mcq","A reaction that releases heat is:","exothermic",["endothermic","frozen","neutral always"]),
 ("fill","In a chemical reaction, the substances you start with are the ____. (one word)","reactants"),
 ("mcq","A reaction that absorbs heat (feels cold) is:","endothermic",["exothermic","physical","instant"]),
 ("mcq","Subscripts in a formula like H2O tell the number of:","atoms of each element",["molecules only","reactions","grams"]),
 ("mcq","Photosynthesis and respiration are both examples of:","chemical reactions",["physical changes","mixtures","phase changes"]),
 ("mcq","If 10 g reacts with 5 g in a sealed container, the products weigh:","15 g",["5 g","0 g","150 g"]),
],
"atoms-and-periodic-table": [
 ("mcq","The smallest unit of an element is an:","atom",["molecule","compound","mixture"]),
 ("mcq","The center of an atom is the:","nucleus",["electron cloud","shell","orbit only"]),
 ("mcq","Positively charged particles in the nucleus are:","protons",["electrons","neutrons","ions"]),
 ("mcq","Particles in the nucleus with no charge are:","neutrons",["protons","electrons","photons"]),
 ("mcq","Negatively charged particles outside the nucleus are:","electrons",["protons","neutrons","atoms"]),
 ("mcq","The number of protons in an atom is its:","atomic number",["mass number","charge","weight"]),
 ("mcq","The periodic table arranges elements by:","atomic number",["color","price","alphabet"]),
 ("mcq","Vertical columns in the periodic table are called:","groups",["periods","rows only","cells"]),
 ("mcq","Horizontal rows in the periodic table are called:","periods",["groups","columns","families"]),
 ("mcq","Elements in the same group often have similar:","chemical properties",["colors","prices","masses exactly"]),
 ("mcq","Most elements on the left and center of the table are:","metals",["nonmetals","gases only","liquids only"]),
 ("mcq","A neutral atom has equal numbers of protons and:","electrons",["neutrons","molecules","ions"]),
 ("mcq","An atom that gains or loses electrons becomes an:","ion",["isotope","element","mixture"]),
 ("mcq","Atoms of the same element with different numbers of neutrons are:","isotopes",["ions","molecules","compounds"]),
 ("mcq","Two or more elements chemically combined form a:","compound",["mixture","isotope","ion"]),
 ("fill","The positively charged particle in an atom's nucleus is the ____. (one word)","proton"),
 ("mcq","The mass number of an atom is the number of protons plus:","neutrons",["electrons","ions","molecules"]),
 ("mcq","Noble gases (far right) are known for being:","very unreactive",["highly explosive","always metals","liquids"]),
 ("mcq","An element is a substance made of only one kind of:","atom",["molecule","mixture","compound"]),
 ("mcq","Most of an atom's volume is taken up by the:","electron cloud (mostly empty space)",["nucleus","protons","neutrons"]),
],
"newtons-laws": [
 ("mcq","An object stays at rest or in motion unless acted on by a force. This is:","Newton's first law (inertia)",["the second law","the third law","gravity"]),
 ("mcq","The resistance of an object to a change in motion is:","inertia",["friction","acceleration","gravity"]),
 ("mcq","Force equals mass times acceleration is:","Newton's second law",["the first law","the third law","conservation"]),
 ("mcq","For every action there is an equal and opposite reaction is:","Newton's third law",["the first law","the second law","inertia"]),
 ("mcq","If mass stays the same and force increases, acceleration:","increases",["decreases","stays zero","reverses time"]),
 ("mcq","A heavier object needs ____ force to reach the same acceleration as a lighter one.","more",["less","no","negative"]),
 ("mcq","A rocket pushes gas down and is pushed up — an example of the:","third law",["first law","second law","law of gravity"]),
 ("mcq","A seatbelt protects you in a crash because of your body's:","inertia",["acceleration","mass only","gravity"]),
 ("mcq","Unbalanced forces cause an object to:","accelerate (change motion)",["stay still always","disappear","reverse time"]),
 ("mcq","In F = ma, if force is 20 N and mass is 4 kg, acceleration is:","5 m/s^2",["80 m/s^2","16 m/s^2","24 m/s^2"]),
 ("mcq","Friction is a force that:","opposes motion",["always speeds things up","creates mass","is gravity"]),
 ("mcq","When you push a wall, the wall pushes back on you with:","equal and opposite force",["no force","double force","half force"]),
 ("mcq","An object moving at constant velocity has a net force of:","zero",["increasing","huge","negative"]),
 ("mcq","Acceleration is a change in:","velocity over time",["mass","color","temperature"]),
 ("mcq","The same force on a lighter cart vs a heavier cart gives the lighter cart:","greater acceleration",["less acceleration","no motion","more mass"]),
 ("fill","Force = mass x ____ (Newton's second law). (one word)","acceleration"),
 ("mcq","Inertia depends on an object's:","mass",["color","speed only","temperature"]),
 ("mcq","Swimmers push water backward to move forward — this shows the:","third law",["first law","second law","law of gravity"]),
 ("mcq","If no net force acts on a moving object, it will:","keep moving at constant velocity",["stop instantly","speed up","reverse"]),
 ("mcq","The unit of force is the:","newton (N)",["gram","meter","second"]),
],
"energy-and-heat": [
 ("mcq","Heat naturally flows from ____ objects to colder ones.","hotter",["colder","the same","frozen"]),
 ("mcq","Thermal energy is related to the motion of an object's:","particles",["color","price","shape"]),
 ("mcq","Heat transfer through direct contact is:","conduction",["convection","radiation","insulation"]),
 ("mcq","Heat transfer by moving fluids (liquids/gases) is:","convection",["conduction","radiation","reflection"]),
 ("mcq","Heat transfer by waves through space is:","radiation",["conduction","convection","friction"]),
 ("mcq","A material that slows heat transfer is an:","insulator",["conductor","catalyst","ion"]),
 ("mcq","Metals are usually good ____ of heat.","conductors",["insulators","gases","mixtures"]),
 ("mcq","Temperature measures the average ____ energy of particles.","kinetic",["potential only","chemical","sound"]),
 ("mcq","Adding heat to a substance generally makes its particles move:","faster",["slower","not at all","backward"]),
 ("mcq","Energy is conserved, meaning it can change form but is never:","created or destroyed",["transferred","stored","moved"]),
 ("mcq","A pot of water heating with rising and sinking currents shows:","convection",["radiation only","conduction only","insulation"]),
 ("mcq","Feeling the Sun's warmth on your skin is an example of:","radiation",["conduction","convection","friction"]),
 ("mcq","Potential energy is energy that is:","stored",["moving","lost","heat only"]),
 ("mcq","Kinetic energy is energy of:","motion",["position","color","sound only"]),
 ("mcq","A thermos keeps drinks hot or cold by reducing:","heat transfer",["mass","gravity","color"]),
 ("fill","Heat transfer through direct contact between objects is ____. (one word)","conduction"),
 ("mcq","When two objects of different temperatures touch, heat flows until they:","reach the same temperature",["explode","freeze","gain mass"]),
 ("mcq","A roller coaster car has the most potential energy at the:","top of the hill",["bottom","middle going fast","start of the brakes"]),
 ("mcq","Rubbing hands together turns motion into:","heat (thermal energy)",["light","mass","sound only"]),
 ("mcq","The total energy in a closed system:","stays the same",["always increases","always decreases","becomes zero"]),
],
"waves": [
 ("mcq","A wave transfers ____ from one place to another.","energy",["matter permanently","mass","color"]),
 ("mcq","The height of a wave from rest to crest is its:","amplitude",["wavelength","frequency","speed"]),
 ("mcq","The distance between two crests is the:","wavelength",["amplitude","frequency","period"]),
 ("mcq","The number of waves passing a point per second is the:","frequency",["amplitude","wavelength","speed"]),
 ("mcq","Sound waves need a ____ to travel.","medium (like air)",["vacuum","shadow","magnet"]),
 ("mcq","Light waves can travel through:","empty space (a vacuum)",["only water","only metal","only air"]),
 ("mcq","Higher frequency sound has a higher:","pitch",["volume only","speed only","color"]),
 ("mcq","Larger amplitude usually means a ____ sound.","louder",["quieter","higher-pitch","faster"]),
 ("mcq","In a transverse wave, particles move ____ to the wave's direction.","perpendicular (up and down)",["parallel","in circles only","not at all"]),
 ("mcq","In a longitudinal wave, particles move ____ to the wave's direction.","parallel (back and forth)",["perpendicular","in circles","not at all"]),
 ("mcq","When a wave bounces off a surface, it is:","reflected",["refracted","absorbed","created"]),
 ("mcq","When a wave bends passing into a new material, it is:","refracted",["reflected","absorbed","amplified"]),
 ("mcq","An echo is caused by sound being:","reflected",["refracted","created","absorbed fully"]),
 ("mcq","Light travels ____ than sound.","much faster",["slower","at the same speed","backward"]),
 ("mcq","Visible light is part of the ____ spectrum.","electromagnetic",["sound","seismic","water"]),
 ("fill","The distance between two crests of a wave is its ____. (one word)","wavelength"),
 ("mcq","We can use patterns in waves to:","send and store information",["create matter","stop time","make gravity"]),
 ("mcq","Ocean waves and a slinky pushed back and forth are both:","ways energy travels as waves",["matter being created","light only","sound only"]),
 ("mcq","Radio, microwaves, and X-rays are all types of:","electromagnetic waves",["sound waves","water waves","seismic waves"]),
 ("mcq","If frequency goes up while speed stays the same, wavelength goes:","down",["up","to zero","negative"]),
],
"human-impact": [
 ("mcq","Burning fossil fuels increases carbon dioxide, contributing to:","climate change",["cooler oceans","more forests","cleaner air"]),
 ("mcq","Cutting down forests for land is called:","deforestation",["reforestation","erosion","recycling"]),
 ("mcq","A way to reduce waste is to reduce, reuse, and:","recycle",["remove","ruin","rush"]),
 ("mcq","Renewable resources include solar, wind, and:","hydropower",["coal","oil","natural gas"]),
 ("mcq","Pollution that runs off into rivers and oceans harms:","aquatic life",["only the air","only rocks","nothing"]),
 ("mcq","Protecting many species and ecosystems preserves:","biodiversity",["pollution","traffic","erosion"]),
 ("mcq","Overfishing can cause fish populations to:","collapse / decline",["increase","become plants","make oxygen"]),
 ("mcq","The greenhouse effect traps heat using gases like:","carbon dioxide and methane",["oxygen","nitrogen only","helium"]),
 ("mcq","Switching to electric vehicles and renewables helps reduce:","greenhouse gas emissions",["clean water","forests","oxygen"]),
 ("mcq","Habitat destruction is a leading cause of species:","extinction",["creation","migration only","photosynthesis"]),
 ("mcq","Plastic in the ocean is harmful because it:","does not break down quickly and harms wildlife",["feeds fish","cleans water","makes oxygen"]),
 ("mcq","Conserving water and energy at home helps protect:","natural resources",["pollution","landfills' growth","traffic"]),
 ("mcq","Planting trees can help by absorbing:","carbon dioxide",["oxygen","plastic","metal"]),
 ("mcq","Nonrenewable resources like oil and coal:","can run out",["never run out","grow back fast","are unlimited"]),
 ("mcq","Acid rain is caused mainly by pollution from:","burning fossil fuels",["planting trees","recycling","solar panels"]),
 ("fill","Using resources in a way that does not run them out is called being ____. (one word)","sustainable"),
 ("mcq","Restoring a damaged ecosystem is called:","restoration / reforestation",["pollution","deforestation","extinction"]),
 ("mcq","Which human action most helps reduce air pollution?","using public transit or biking",["idling cars","burning trash","clearing forests"]),
 ("mcq","Monitoring data over time helps scientists:","track human impact and plan solutions",["ignore problems","stop the seasons","create matter"]),
 ("mcq","Conservation means using resources:","wisely so they last",["as fast as possible","never at all","only once"]),
],
}


# ================================================= READING (authored, grade 7)

READING7 = {
"central-idea": [
 ("mcq","The central idea of a text is the:","most important overall point",["first sentence","longest word","author's name"]),
 ("mcq","Supporting details function to:","develop and explain the central idea",["change the topic","end the text","list sources"]),
 ("mcq","A text may develop its central idea over:","the whole passage",["a single word","the title only","the page number"]),
 ("mcq","Read: \"Renewable energy is growing because it is cleaner, increasingly cheaper, and more reliable than before.\" The central idea is that renewable energy is:","becoming more practical and appealing",["expensive","useless","disappearing"]),
 ("mcq","To determine a central idea, a strong reader looks for the point that:","the details all support",["appears only once","is in the title","is the shortest"]),
 ("mcq","An objective summary of a central idea avoids the reader's:","personal opinions",["main point","key details","topic"]),
 ("mcq","Two paragraphs explaining different benefits of sleep together build the:","central idea",["plot","setting","rhyme scheme"]),
 ("mcq","Read: \"Although social media connects people, it can also spread misinformation quickly.\" The central idea is that social media:","has both benefits and drawbacks",["is only good","is only bad","is unimportant"]),
 ("mcq","A detail that does not relate to the main point is:","irrelevant",["essential","central","the thesis"]),
 ("mcq","The central idea of an argument is usually the author's main:","claim",["counterexample","footnote","title"]),
 ("mcq","Read: \"Coral reefs support fisheries, protect coasts, and may yield medicines, but warming seas threaten them.\" The central idea is that reefs are:","valuable yet endangered",["worthless","new","dry"]),
 ("mcq","Headings and topic sentences often signal the:","central idea of a section",["page count","font","price"]),
 ("mcq","A well-developed central idea is supported by:","evidence and examples",["one word","the title","the cover"]),
 ("mcq","Identifying the central idea helps a reader grasp the text's:","overall purpose",["word count","binding","font"]),
 ("mcq","If you removed the supporting details, the central idea would be:","harder to prove or understand fully",["clearer always","longer","unchanged in proof"]),
 ("fill","The most important overall point of a text is its ____ idea. (one word)","central"),
 ("mcq","A central idea differs from a theme because central idea is common in:","informational texts",["only poems","only the title","only fiction"]),
 ("mcq","Read: \"Volunteers restored the wetland, replanting native grasses and removing trash.\" The central idea is that volunteers:","worked to restore the ecosystem",["went on vacation","caused harm","ignored it"]),
 ("mcq","Determining how a central idea is conveyed means tracing it through the text's:","details and structure",["fonts","page numbers","margins"]),
 ("mcq","Which best states a central idea?","Pollinators are essential to global food production.",["Bees have wings.","It was warm out.","Flowers can be yellow."]),
],
"theme-development": [
 ("mcq","A theme is a story's:","central message about life",["setting","narrator","title"]),
 ("mcq","Authors develop theme through plot events and:","character choices",["page numbers","fonts","margins"]),
 ("mcq","Theme differs from topic because theme is a:","complete idea or insight",["single noun","place","name"]),
 ("mcq","Read: \"Though warned, the crew ignored the storm signs and lost their ship.\" A theme is:","ignoring wisdom has consequences",["storms are fun","ships are old","sailing is easy"]),
 ("mcq","A recurring symbol in a story often reinforces the:","theme",["index","glossary","page count"]),
 ("mcq","To trace theme development, note how it appears:","across the whole text",["only at the start","in the title only","never"]),
 ("mcq","Read: \"After betraying a friend, the boy spent years rebuilding that trust.\" A theme is:","trust, once broken, is hard to restore",["betrayal pays off","friends are useless","time stops"]),
 ("mcq","A theme is best stated as a:","sentence about life or human nature",["single word","question","setting"]),
 ("mcq","Two stories can share a theme such as:","perseverance overcomes hardship",["the same plot","the same author","the same length"]),
 ("mcq","As a story progresses, a theme usually becomes:","clearer through events",["less important","random","the title"]),
 ("mcq","Read: \"She chose honesty though lying was easier, and respected herself.\" The theme concerns:","integrity",["winning at all costs","fear","luck"]),
 ("mcq","A character who changes often reveals the story's:","theme",["page count","font","cover"]),
 ("mcq","A theme applies:","beyond the single story to life",["only to one chapter","to the cover","to nothing"]),
 ("mcq","Read: \"The rivals discovered they achieved more together than apart.\" The theme is:","cooperation / unity",["rivalry is best","work alone","quit early"]),
 ("mcq","Which is a theme, not a topic?","Power can corrupt even good people.",["a king","a castle","war"]),
 ("fill","The deeper message or lesson of a story is its ____. (one word)","theme"),
 ("mcq","Conflicts in a story often help develop its:","theme",["page number","setting only","font"]),
 ("mcq","Read: \"Despite repeated failures, the inventor refused to quit and finally succeeded.\" The theme is:","perseverance",["luck","laziness","fear"]),
 ("mcq","A strong theme statement is a:","general truth shown by the story",["plot summary","the title","a character's name"]),
 ("mcq","Tracking how characters respond to events helps you identify:","theme",["page count","the publisher","the font"]),
],
"summarizing": [
 ("mcq","An objective summary should remain:","neutral and factual",["opinionated","exaggerated","fictional"]),
 ("mcq","A summary is ____ than the original.","shorter",["longer","equal","just the title"]),
 ("mcq","A good summary captures the central idea and the:","most important details",["all minor details","author's opinion of you","page color"]),
 ("mcq","Summaries should be written in:","your own words",["the author's exact words","code","emojis"]),
 ("mcq","What should be LEFT OUT of an objective summary?","your personal reaction",["the main idea","key points","the topic"]),
 ("mcq","Narrative summaries keep events in:","logical order",["random order","reverse only","no order"]),
 ("mcq","Summarizing an argument means including the author's:","claim and key reasons",["favorite color","birthday","font"]),
 ("mcq","An effective one-sentence summary states the text's:","central idea",["smallest detail","page count","author bio"]),
 ("mcq","Inserting 'I disagree' into a summary makes it:","no longer objective",["stronger","required","shorter"]),
 ("mcq","To condense a passage, you should:","combine ideas and cut minor details",["repeat sentences","add examples","copy it"]),
 ("mcq","Which is the best summary of a story where a stranded hiker uses wits to survive and is rescued?","A stranded hiker survived by thinking clearly until rescue arrived.",["Hiking is fun.","The hiker was tall.","Mountains are tall."]),
 ("mcq","A summary and the original should share the same:","central idea",["wording","length","page count"]),
 ("mcq","Quoting every detail makes a summary:","too long and not concise",["objective","perfect","short"]),
 ("mcq","Before summarizing, a careful reader:","identifies the main points",["picks a font","counts pages","skips the text"]),
 ("mcq","A summary of a news report focuses on:","the key facts and events",["the reporter's looks","ads","page color"]),
 ("fill","A brief, neutral retelling of a text's key points is a ____. (one word)","summary"),
 ("mcq","A paraphrase differs from a summary because it:","restates a part at similar length",["is much shorter","adds opinion","is the title"]),
 ("mcq","Good summaries focus on ideas that are:","central, not trivial",["trivial","longest","colorful"]),
 ("mcq","An objective summary answers mainly:","what happened and why it matters",["how you felt","the price","the publisher"]),
 ("mcq","Rereading before summarizing helps ensure you captured the:","most important ideas",["longest words","page numbers","fonts"]),
],
"textual-evidence": [
 ("mcq","Textual evidence is information taken ____ from the text.","directly",["from memory","from a friend","from the cover"]),
 ("mcq","To support an inference, you must cite:","evidence from the text",["a guess","the title only","nothing"]),
 ("mcq","Strong evidence is both relevant and:","accurate (truly in the text)",["invented","off-topic","about the author"]),
 ("mcq","Quotation marks indicate words that are the:","author's exact words",["your words","a summary","a title"]),
 ("mcq","Which best supports the claim 'the character felt anxious'?","'Her hands trembled and her voice shook.'",["The book is long.","It was Friday.","The cover is red."]),
 ("mcq","When asked 'how do you know?', a strong reader:","points to text evidence",["guesses","ignores the text","changes topic"]),
 ("mcq","A claim without supporting evidence is:","weak / unsupported",["always true","the central idea","a quote"]),
 ("mcq","Citing evidence makes an argument more:","convincing",["confusing","shorter","colorful"]),
 ("mcq","An explicit detail is one the text states:","directly",["only by hinting","never","in the title"]),
 ("mcq","An inference is supported by combining text clues with:","prior knowledge",["random guesses","the cover","page numbers"]),
 ("mcq","Paraphrased evidence must still be:","based on the text",["made up","about you","unrelated"]),
 ("mcq","Multiple relevant quotes make a point:","stronger",["weaker","off-topic","shorter only"]),
 ("mcq","If the text contradicts your claim, you should:","revise the claim",["keep it anyway","blame the text","stop reading"]),
 ("mcq","Best evidence that a setting is wartime:","'Sirens wailed as soldiers marched past ruined homes.'",["War is bad.","The author is old.","It has 300 pages."]),
 ("mcq","Citing the paragraph or line helps a reader:","locate the evidence",["choose a font","count words","skip reading"]),
 ("fill","Information taken directly from a text to support a point is text ____. (one word)","evidence"),
 ("mcq","Drawing a conclusion the text strongly implies but doesn't state is an:","inference",["explicit fact","opinion only","a title"]),
 ("mcq","Evidence should be chosen because it is:","relevant to the claim",["the longest","colorful","random"]),
 ("mcq","A reader who supports ideas with evidence is reading:","analytically",["carelessly","not at all","only the cover"]),
 ("mcq","Strong analysis combines a claim, evidence, and:","explanation of how it supports the claim",["a guess","the title","the page count"]),
],
"authors-perspective": [
 ("mcq","An author's purpose may be to inform, entertain, or:","persuade",["sleep","drive","eat"]),
 ("mcq","An author's perspective is their:","attitude toward the topic",["page count","handwriting","address"]),
 ("mcq","An editorial mainly expresses the writer's:","opinion",["only facts","a recipe","a plot"]),
 ("mcq","Loaded or emotional word choices reveal the author's:","bias / perspective",["page number","font","binding"]),
 ("mcq","A text presenting only one side of an issue is likely:","biased",["objective","fictional","a poem"]),
 ("mcq","To find an author's purpose, ask:","why did they write this?",["how long is it?","who printed it?","what font?"]),
 ("mcq","A persuasive author often uses reasons and:","emotional appeals",["random numbers","no words","page counts"]),
 ("mcq","An informational article's main purpose is to:","inform",["persuade","entertain","sell"]),
 ("mcq","Comparing two authors on one topic can reveal different:","perspectives",["page numbers","fonts","titles"]),
 ("mcq","Read: \"We MUST act now to save our river!\" The purpose is to:","persuade",["inform neutrally","entertain","instruct"]),
 ("mcq","Recognizing perspective helps a reader judge a text's:","reliability and intent",["weight","color","price"]),
 ("mcq","An author who includes vivid, scary details likely wants to:","create suspense or fear in readers",["count pages","change fonts","sell paper"]),
 ("mcq","A balanced text presents:","more than one viewpoint",["only one side","no information","just images"]),
 ("mcq","Tone is the author's ____ toward the subject.","attitude",["page count","font","spelling"]),
 ("mcq","A satirical article uses humor mainly to:","criticize or make a point",["report neutrally","teach math","sell shoes"]),
 ("fill","The reason an author writes a text is the author's ____. (one word)","purpose"),
 ("mcq","Detecting bias often means comparing a text to:","other sources",["its page number","its font","its cover"]),
 ("mcq","An author's word choice and details together create:","tone and perspective",["page numbers","margins","the index"]),
 ("mcq","A 'how-to' guide's purpose is to:","instruct",["persuade","entertain only","argue"]),
 ("mcq","Considering purpose and perspective helps readers think:","critically",["less","not at all","only about length"]),
],
"word-connotation": [
 ("mcq","A word's denotation is its:","dictionary meaning",["feeling it suggests","rhyme","origin"]),
 ("mcq","A word's connotation is the:","feeling or association it carries",["dictionary meaning","number of letters","spelling"]),
 ("mcq","'Thrifty' and 'cheap' have similar denotations but different:","connotations",["spellings only","lengths","prefixes"]),
 ("mcq","Which word has a more POSITIVE connotation?","slender",["scrawny","skinny","bony"]),
 ("mcq","Which word has a more NEGATIVE connotation?","stubborn",["determined","persistent","firm"]),
 ("mcq","Read: \"The aroma of bread filled the kitchen.\" \"Aroma\" has a ____ connotation.","positive",["negative","neutral only","no"]),
 ("mcq","Read: \"A stench filled the alley.\" \"Stench\" has a ____ connotation.","negative",["positive","neutral","no"]),
 ("mcq","Authors choose words with certain connotations to:","shape the reader's feelings",["count pages","fill space","change fonts"]),
 ("mcq","The prefix 'mis-' in 'misjudge' means:","wrongly",["again","before","not"]),
 ("mcq","The root 'spect' (as in inspect) relates to:","seeing / looking",["hearing","water","fire"]),
 ("mcq","'Childish' vs 'childlike': the more negative word is:","childish",["childlike","both equal","neither"]),
 ("mcq","Read: \"The diplomat's tactful reply avoided offense.\" \"Tactful\" connotes being:","considerate",["rude","careless","loud"]),
 ("mcq","Connotation helps explain why synonyms aren't always:","interchangeable",["spelled alike","the same length","nouns"]),
 ("mcq","The suffix '-ous' (as in 'courageous') often means:","full of",["without","before","again"]),
 ("mcq","Read: \"He was a curious child, always asking questions.\" \"Curious\" connotes:","eager to learn (positive)",["annoying","lazy","fearful"]),
 ("fill","The feelings or ideas associated with a word are its ____. (one word)","connotation"),
 ("mcq","Choosing 'pushy' instead of 'assertive' adds a ____ tone.","negative",["positive","neutral","no"]),
 ("mcq","The root 'aud' (as in audible) relates to:","hearing",["seeing","water","light"]),
 ("mcq","Words with strong connotations are common in:","persuasive and poetic writing",["math problems","phone books","tax forms"]),
 ("mcq","Read: \"Her economical use of words made the essay tight.\" \"Economical\" here connotes being:","efficient (positive)",["wasteful","boring","rude"]),
],
"text-structure": [
 ("mcq","A text organized by time order uses a ____ structure.","chronological / sequence",["compare-contrast","cause-effect","problem-solution"]),
 ("mcq","A text explaining reasons and results uses:","cause and effect",["sequence","description","compare"]),
 ("mcq","A text showing similarities and differences uses:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","A text presenting an issue and remedies uses:","problem and solution",["sequence","description","compare"]),
 ("mcq","Signal words 'because, therefore, as a result' indicate:","cause and effect",["sequence","compare","description"]),
 ("mcq","Signal words 'however, similarly, unlike' indicate:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","Signal words 'first, next, finally' indicate:","sequence",["compare","cause-effect","problem-solution"]),
 ("mcq","Identifying structure helps a reader:","follow and connect ideas",["pick a font","count pages","ignore content"]),
 ("mcq","An article on 'why bees are declining and how to help' uses:","problem and solution (with cause-effect)",["sequence only","description only","none"]),
 ("mcq","A passage detailing a place's sights, sounds, and smells uses:","description",["sequence","cause-effect","problem-solution"]),
 ("mcq","A timeline of events matches a ____ structure.","chronological",["compare","problem-solution","description"]),
 ("mcq","Headings and signal words are clues to a text's:","structure",["price","author","font"]),
 ("mcq","An author may combine structures, such as comparing the causes of two events, blending:","compare-contrast and cause-effect",["only sequence","only description","none"]),
 ("mcq","Recognizing problem-solution structure helps you locate the author's:","proposed solution",["setting","rhyme","title"]),
 ("mcq","'Deforestation reduced habitat, which lowered species numbers' shows:","cause and effect",["sequence","compare","description"]),
 ("fill","A text arranged strictly in time order uses a ____ structure. (one word)","chronological"),
 ("mcq","Knowing structure first makes a complex text:","easier to analyze",["longer","impossible","cheaper"]),
 ("mcq","A pros-and-cons article most likely uses:","compare and contrast",["sequence","cause-effect","problem-solution"]),
 ("mcq","Cause-effect structure answers the question:","why did this happen and what resulted?",["what comes first?","how are they alike?","what is the problem?"]),
 ("mcq","Analyzing structure reveals how an author:","organizes and emphasizes ideas",["chooses a cover","sets the price","picks a font"]),
],
"figurative-tone": [
 ("mcq","\"The city never sleeps\" gives the city a human trait, so it is:","personification",["a simile","hyperbole","an idiom"]),
 ("mcq","\"As cold as ice\" is a:","simile",["metaphor","idiom","hyperbole"]),
 ("mcq","\"Her words were daggers\" is a:","metaphor",["simile","idiom","onomatopoeia"]),
 ("mcq","\"I've said this a thousand times\" is an exaggeration called:","hyperbole",["simile","metaphor","idiom"]),
 ("mcq","'Hit the books' meaning to study is an:","idiom",["literal action","simile","fact"]),
 ("mcq","Tone is the author's ____ toward the subject.","attitude",["page count","font","spelling"]),
 ("mcq","Word choice and details combine to create:","tone and mood",["page numbers","margins","the index"]),
 ("mcq","A passage with words like 'gloomy, silent, cold' creates a ____ mood.","somber / eerie",["cheerful","funny","excited"]),
 ("mcq","A passage with 'sunny, laughing, bright' creates a ____ mood.","cheerful",["gloomy","tense","angry"]),
 ("mcq","Words that imitate sounds, like 'buzz' or 'clang', are:","onomatopoeia",["similes","metaphors","idioms"]),
 ("mcq","Symbolism is when an object stands for a larger:","idea",["sound","number","font"]),
 ("mcq","A sarcastic tone often means the writer says the opposite of what they:","truly mean",["spell","print","measure"]),
 ("mcq","\"Time is a thief\" is a metaphor suggesting time:","steals moments away",["is a person","is metal","is fast only"]),
 ("mcq","An author's nostalgic tone suggests a feeling of:","fond looking back",["anger","fear","boredom"]),
 ("mcq","\"The thunder grumbled\" is an example of:","personification",["a simile","hyperbole","an idiom"]),
 ("fill","An author's attitude toward the subject is the ____. (one word)","tone"),
 ("mcq","Figurative language is used to:","create vivid images and meaning",["state plain facts only","fill space","confuse"]),
 ("mcq","\"My backpack weighs a ton\" is an example of:","hyperbole",["a fact","a simile","onomatopoeia"]),
 ("mcq","Mood is the feeling created in the:","reader",["author only","printer","margins"]),
 ("mcq","Which is NOT figurative language?","The class ended at noon.",["She's a shining star.","Quiet as a mouse.","The wind whispered."]),
],
"compare-authors": [
 ("mcq","Comparing two texts on a topic reveals their different:","approaches and viewpoints",["page numbers","fonts","prices"]),
 ("mcq","A memoir and a news article on the same event differ most in:","perspective and tone",["the date","whether it happened","the planet"]),
 ("mcq","Two authors may share facts yet reach different:","conclusions",["page counts","titles","fonts"]),
 ("mcq","Reading multiple sources helps a reader:","form a fuller, balanced view",["learn less","ignore facts","memorize fonts"]),
 ("mcq","A primary source is an account from:","someone who experienced the event",["a later textbook only","fiction always","an unrelated topic"]),
 ("mcq","A secondary source typically:","analyzes events after the fact",["is always firsthand","is fiction","has no facts"]),
 ("mcq","When two texts disagree, a careful reader:","weighs the evidence in each",["believes the longer one","ignores both","picks at random"]),
 ("mcq","A documentary and an essay on whales are alike because both aim to:","inform about whales",["entertain only","be fiction","avoid facts"]),
 ("mcq","Comparing a novel to its film often shows the film:","changes or cuts details",["adds nothing","is identical","has no characters"]),
 ("mcq","Two authors writing about courage may differ in their:","examples and emphasis",["the theme exactly","the alphabet","the length only"]),
 ("mcq","Synthesizing sources means:","combining ideas across texts",["copying one","ignoring all","reading none"]),
 ("mcq","An author's bias is easier to spot when you:","compare with other accounts",["read only that text","ignore evidence","check the font"]),
 ("mcq","Firsthand and secondhand accounts often differ in:","detail and point of view",["the event itself","the year only","spelling"]),
 ("mcq","A scientific report and an opinion blog differ mainly in:","evidence and reliability",["the topic","the alphabet","the length"]),
 ("mcq","Comparing how two writers describe a city highlights each writer's:","style and word choice",["page count","publisher","price"]),
 ("fill","Examining how two texts are alike and different is to ____ them. (one word, starts with c)","compare"),
 ("mcq","When sources conflict, the reader should evaluate the:","credibility and evidence of each",["page color","font","author's age"]),
 ("mcq","Two charts of the same data can differ in:","how they present it",["the facts","the truth","the topic"]),
 ("mcq","Considering multiple viewpoints before forming an opinion shows:","critical reading",["lazy reading","guessing","skimming only"]),
 ("mcq","Reading an eyewitness account and a historian's analysis of one event gives a reader:","a more complete understanding",["less information","only opinions","only fiction"]),
],
"plot-character-development": [
 ("mcq","The sequence of events in a story is the:","plot",["theme","setting","tone"]),
 ("mcq","The central problem characters face is the:","conflict",["setting","genre","title"]),
 ("mcq","A character who changes over the story is:","dynamic",["flat / static","minor only","the narrator"]),
 ("mcq","A character who stays the same is:","static",["dynamic","the protagonist always","the villain"]),
 ("mcq","The turning point of greatest tension is the:","climax",["exposition","resolution","setting"]),
 ("mcq","Events that build tension before the climax are the:","rising action",["resolution","exposition","falling action"]),
 ("mcq","The part where the conflict is resolved is the:","resolution",["rising action","climax","exposition"]),
 ("mcq","A reason a character acts a certain way is their:","motivation",["height","clothes","name"]),
 ("mcq","A struggle within a character's own mind is:","internal conflict",["external conflict","setting","plot only"]),
 ("mcq","A struggle against another person or nature is:","external conflict",["internal conflict","theme","tone"]),
 ("mcq","Characters are revealed through their words, actions, and:","thoughts",["page numbers","fonts","margins"]),
 ("mcq","The way a character responds to conflict reveals their:","traits and values",["shoe size","address","favorite color"]),
 ("mcq","Read: \"Maya must choose loyalty to her team or her own dream.\" This is mainly:","internal conflict",["external conflict only","setting","tone"]),
 ("mcq","Character development means a character:","grows or changes meaningfully",["stays exactly the same","is described once","is named"]),
 ("mcq","The plot usually moves forward because of the:","conflict",["page count","font","title"]),
 ("fill","The main problem or struggle that drives a story is the ____. (one word)","conflict"),
 ("mcq","Comparing a character at the start and end shows their:","development (or lack of it)",["page count","font","cover"]),
 ("mcq","Subplots are:","secondary storylines that support the main plot",["the title","page numbers","the cover"]),
 ("mcq","A flashback in a plot:","shows an earlier event",["predicts the future","ends the story","lists characters"]),
 ("mcq","Understanding plot and character together helps a reader grasp the story's:","meaning and theme",["page count","font","price"]),
],
}


# ===================================================== TOPIC REGISTRY (grade 7)

TOPICS7 = [
 # ---- MATH (computed, banded by difficulty, de-duplicated) ----
 ("math","proportions","Proportions","7.RP.A.2",
  "A proportion sets two ratios equal. Cross-multiply to solve for the unknown.", G(m_proportions)),
 ("math","unit-rates","Unit Rates","7.RP.A.1",
  "A unit rate gives the amount per single unit, like miles per hour or cost per item.", G(m_unit_rate)),
 ("math","percent-problems","Percent Problems","7.RP.A.3",
  "Use percents to solve real problems: percent of a number, discounts, tips, and increases.", G(m_percent)),
 ("math","add-subtract-integers","Adding & Subtracting Integers","7.NS.A.1",
  "Add and subtract positive and negative numbers using a number line or rules of signs.", G(m_add_sub_int)),
 ("math","multiply-divide-integers","Multiplying & Dividing Integers","7.NS.A.2",
  "A negative times a positive is negative; a negative times a negative is positive.", G(m_mul_div_int)),
 ("math","order-of-operations","Order of Operations with Integers","7.NS.A.3",
  "Follow order of operations carefully, watching the signs of negative numbers.", G(m_order_ops_int)),
 ("math","two-step-equations","Two-Step Equations","7.EE.B.4",
  "Undo addition or subtraction first, then multiplication or division, to solve for x.", G(m_two_step)),
 ("math","combining-like-terms","Combining Like Terms","7.EE.A.1",
  "Add the coefficients of like terms to simplify an expression.", G(m_like_terms)),
 ("math","circles","Area & Circumference of Circles","7.G.B.4",
  "Area = pi x r x r; circumference = 2 x pi x r. Use 3.14 as an estimate for pi.", G(m_circle)),
 ("math","volume-of-prisms","Volume of Prisms","7.G.B.6",
  "Volume of a prism is the area of its base times its length (or height).", G(m_volume)),
 # ---- SCIENCE ----
 ("science","photosynthesis-respiration","Photosynthesis & Respiration","MS-LS1-6",
  "Plants make food in photosynthesis; cells release that energy in respiration.", SCIENCE7["photosynthesis-respiration"]),
 ("science","matter-and-energy-in-ecosystems","Matter & Energy in Ecosystems","MS-LS2-3",
  "Energy flows one way and is lost as heat; matter is recycled through ecosystems.", SCIENCE7["matter-and-energy-in-ecosystems"]),
 ("science","natural-selection","Natural Selection","MS-LS4-4",
  "Helpful inherited traits become more common over generations as organisms survive.", SCIENCE7["natural-selection"]),
 ("science","heredity-and-genes","Heredity & Genes","MS-LS3-2",
  "Genes made of DNA carry traits from parents to offspring; alleles can be dominant or recessive.", SCIENCE7["heredity-and-genes"]),
 ("science","chemical-reactions","Chemical Reactions","MS-PS1-2",
  "Reactions rearrange atoms to form new substances while conserving mass.", SCIENCE7["chemical-reactions"]),
 ("science","atoms-and-periodic-table","Atoms & the Periodic Table","MS-PS1-1",
  "Atoms are made of protons, neutrons, and electrons; the periodic table organizes the elements.", SCIENCE7["atoms-and-periodic-table"]),
 ("science","newtons-laws","Newton's Laws of Motion","MS-PS2-2",
  "Newton's three laws describe inertia, force = mass x acceleration, and action-reaction.", SCIENCE7["newtons-laws"]),
 ("science","energy-and-heat","Energy & Heat","MS-PS3-3",
  "Energy changes form and is conserved; heat moves by conduction, convection, and radiation.", SCIENCE7["energy-and-heat"]),
 ("science","waves","Waves","MS-PS4-1",
  "Waves carry energy; amplitude, wavelength, and frequency describe them.", SCIENCE7["waves"]),
 ("science","human-impact","Human Impact on Earth","MS-ESS3-3",
  "Human activities affect Earth's systems; conservation and clean energy reduce harm.", SCIENCE7["human-impact"]),
 # ---- READING ----
 ("reading","central-idea","Central Idea & Analysis","RI.7.2",
  "Determine a central idea and analyze how details develop it over the text.", READING7["central-idea"]),
 ("reading","theme-development","Theme Development","RL.7.2",
  "Trace how a theme develops through the plot and characters' choices.", READING7["theme-development"]),
 ("reading","summarizing","Objective Summary","RI.7.2",
  "Summarize a text's central idea and key points objectively, without opinion.", READING7["summarizing"]),
 ("reading","textual-evidence","Textual Evidence & Inference","RI.7.1",
  "Cite specific evidence to support both explicit answers and inferences.", READING7["textual-evidence"]),
 ("reading","authors-perspective","Author's Purpose & Perspective","RI.7.6",
  "Analyze an author's purpose, perspective, and how word choice reveals it.", READING7["authors-perspective"]),
 ("reading","word-connotation","Word Meaning & Connotation","L.7.5",
  "Distinguish denotation from connotation and use clues, roots, and affixes for meaning.", READING7["word-connotation"]),
 ("reading","text-structure","Text Structure","RI.7.5",
  "Analyze how an author organizes a text and how the structure shapes ideas.", READING7["text-structure"]),
 ("reading","figurative-tone","Figurative Language & Tone","L.7.5",
  "Identify figurative language and analyze how word choice creates tone and mood.", READING7["figurative-tone"]),
 ("reading","compare-authors","Comparing Authors & Accounts","RI.7.9",
  "Compare how different authors present the same topic or event.", READING7["compare-authors"]),
 ("reading","plot-character-development","Plot & Character Development","RL.7.3",
  "Analyze how plot events and characters develop and interact over a story.", READING7["plot-character-development"]),
 # ---- WRITING (reuses shared grammar generators) ----
 ("writing","nouns","Nouns","L.7.1", "A noun names a person, place, thing, or idea.", g_nouns),
 ("writing","action-verbs","Action Verbs","L.7.1", "A verb shows action or a state of being.", g_verbs),
 ("writing","adjectives","Adjectives","L.7.1", "An adjective describes a noun.", g_adjectives),
 ("writing","pronouns","Pronouns","L.7.1", "A pronoun takes the place of a noun.", g_pronouns),
 ("writing","subject-verb-agreement","Subject-Verb Agreement","L.7.1", "The verb must agree with its subject in number.", g_subject_verb),
 ("writing","past-tense-verbs","Past-Tense Verbs","L.7.1", "Past-tense verbs describe actions that already happened.", g_past_tense),
 ("writing","plural-nouns","Plural Nouns","L.7.1", "Plurals show more than one.", g_plurals),
 ("writing","capitalization","Capitalization","L.7.2", "Capitalize sentence beginnings, I, and proper nouns.", g_capitalization),
 ("writing","end-punctuation","End Punctuation","L.7.2", "End sentences with a period, question mark, or exclamation point.", g_end_punctuation),
 ("writing","commas-in-a-series","Commas in a Series","L.7.2", "Use commas to separate three or more items in a list.", g_commas_series),
]


if __name__ == "__main__":
    print(emit_curriculum(7, TOPICS7))
