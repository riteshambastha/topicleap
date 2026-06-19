#!/usr/bin/env python3
"""
TopicLeap Grade 3 curriculum seed generator.

Reuses the shared engine in generate_seed.py (SQL emission, lesson builder,
worksheet chunking). Math is computed (grade-3 appropriate numbers); grammar
reuses the shared generators; science + reading are authored to grade-3
standards. 4 subjects x 10 topics x 20 questions, split into 5-question
worksheets.

Usage:
    python3 scripts/generate_grade3.py > supabase/seed/grade3_curriculum.sql
"""
import random

from generate_seed import (
    QUESTIONS_PER_TOPIC,
    SUBJECTS,
    build_bank,
    emit_curriculum,
    fill,
    mcq,
    # reuse the grammar generators (basics overlap grades 3 & 4)
    g_nouns,
    g_verbs,
    g_adjectives,
    g_pronouns,
    g_subject_verb,
    g_past_tense,
    g_plurals,
    g_capitalization,
    g_end_punctuation,
    g_commas_series,
)

NQ = QUESTIONS_PER_TOPIC


# ============================================================ MATH (computed)

def g3_place_value(rng):
    qs, used = [], set()
    while len(qs) < NQ:
        n = rng.randint(100, 9999)
        s = str(n)
        idx = rng.randint(0, len(s) - 1)
        d = int(s[idx])
        if d == 0 or (n, idx) in used:
            continue
        used.add((n, idx))
        place = 10 ** (len(s) - 1 - idx)
        qs.append(fill(f"What is the value of the digit {d} in {n}? "
                       f"(Write just the number, e.g. 300)", d * place))
    return qs


def g3_rounding(rng):
    qs = []
    for i in range(NQ):
        place = 10 if i % 2 == 0 else 100
        name = "ten" if place == 10 else "hundred"
        n = rng.randint(place * 2, place * 9 + place - 1)
        rem = n % place
        rounded = n - rem if rem < place / 2 else n - rem + place
        qs.append(fill(f"Round {n} to the nearest {name}.", rounded))
    return qs


def g3_add_sub(rng):
    qs = []
    for i in range(NQ):
        a = rng.randint(120, 899)
        b = rng.randint(20, a - 10)
        if i % 2 == 0:
            qs.append(fill(f"Add: {a} + {b} = ?", a + b))
        else:
            qs.append(fill(f"Subtract: {a} - {b} = ?", a - b))
    return qs


def g3_mult_facts(rng):
    qs, seen = [], set()
    while len(qs) < NQ:
        a = rng.randint(2, 10)
        b = rng.randint(2, 10)
        if (a, b) in seen:
            continue
        seen.add((a, b))
        qs.append(fill(f"Multiply: {a} x {b} = ?", a * b))
    return qs


def g3_division(rng):
    qs, seen = [], set()
    while len(qs) < NQ:
        b = rng.randint(2, 10)
        q = rng.randint(2, 10)
        n = b * q
        if (n, b) in seen:
            continue
        seen.add((n, b))
        qs.append(fill(f"Divide: {n} / {b} = ?", q))
    return qs


def g3_equal_groups(rng):
    qs = []
    for i in range(NQ):
        g = rng.randint(2, 9)
        m = rng.randint(2, 9)
        if i % 2 == 0:
            qs.append(fill(f"There are {g} groups with {m} in each group. "
                           f"How many in all?", g * m))
        else:
            total = g * m
            qs.append(fill(f"{total} things are shared equally into {g} groups. "
                           f"How many in each group?", m))
    return qs


def g3_unit_fractions(rng):
    qs = []
    for i in range(NQ):
        if i % 2 == 0:
            d = rng.choice([2, 3, 4, 5, 6, 8])
            qs.append(fill(f"The fraction 1/{d} means 1 out of how many equal "
                           f"parts?", d))
        else:
            # which is bigger: larger denominator = smaller piece
            d1, d2 = rng.sample([2, 3, 4, 6, 8], 2)
            bigger = f"1/{min(d1, d2)}"
            smaller = f"1/{max(d1, d2)}"
            qs.append(mcq(f"Which fraction is bigger: 1/{d1} or 1/{d2}?",
                          bigger, [smaller, "They are equal", "Neither"], rng))
    return qs


def g3_compare_fractions(rng):
    qs = []
    for _ in range(NQ):
        d = rng.choice([3, 4, 5, 6, 8])
        x = rng.randint(1, d - 1)
        y = rng.randint(1, d - 1)
        while y == x:
            y = rng.randint(1, d - 1)
        f1, f2 = f"{x}/{d}", f"{y}/{d}"
        correct = f1 if x > y else f2
        other = f2 if correct == f1 else f1
        qs.append(mcq(f"Which fraction is greater: {f1} or {f2}?",
                      correct, [other, "They are equal", f"{x + y}/{d}"], rng))
    return qs


def g3_area(rng):
    qs, seen = [], set()
    while len(qs) < NQ:
        l = rng.randint(2, 12)
        w = rng.randint(2, 12)
        if (l, w) in seen:
            continue
        seen.add((l, w))
        qs.append(fill(f"A rectangle is {l} units long and {w} units wide. "
                       f"What is its area in square units?", l * w))
    return qs


def g3_perimeter(rng):
    qs, seen = [], set()
    while len(qs) < NQ:
        l = rng.randint(2, 15)
        w = rng.randint(2, 15)
        if (l, w) in seen:
            continue
        seen.add((l, w))
        qs.append(fill(f"A rectangle is {l} units long and {w} units wide. "
                       f"What is its perimeter (add up all 4 sides)?", 2 * (l + w)))
    return qs


# ============================================== SCIENCE (authored, NGSS gr. 3)

SCIENCE3 = {
"forces-and-motion": [
 ("mcq","A push or a pull is called a:","force",["color","sound","shadow"]),
 ("mcq","To make a still ball start rolling, you must:","push or pull it",["look at it","name it","wait"]),
 ("mcq","Kicking a soccer ball is an example of a:","push",["pull","melt","freeze"]),
 ("mcq","Opening a drawer toward you is an example of a:","pull",["push","spin","drop"]),
 ("mcq","The bigger the force on an object, usually the:","more its motion changes",["less it moves","colder it gets","quieter it gets"]),
 ("mcq","Which makes a wagon speed up more?","a hard push",["a gentle tap","no push","a whisper"]),
 ("mcq","Friction is a force that:","slows things down",["speeds things up forever","makes light","makes sound only"]),
 ("mcq","A ball rolling on grass stops sooner than on smooth floor because of more:","friction",["gravity to space","sunlight","wind"]),
 ("mcq","Gravity is a force that pulls objects:","down toward Earth",["up to the sky","sideways always","apart"]),
 ("mcq","When you drop a ball, it falls because of:","gravity",["friction","magnets","sound"]),
 ("mcq","To change the direction of a moving cart, you can:","push it from the side",["close your eyes","say stop","add a sticker"]),
 ("mcq","Which needs a bigger push to move?","a heavy box",["an empty box","a feather","a balloon"]),
 ("mcq","A force can change an object's:","speed and direction",["name","color only","smell"]),
 ("mcq","Pulling a sled up a hill is harder because gravity pulls it:","downhill",["uphill","sideways","up"]),
 ("mcq","Pressing the brakes on a bike uses friction to:","slow it down",["speed it up","make it fly","change its color"]),
 ("mcq","Which surface has the LEAST friction?","smooth ice",["rough sandpaper","a gravel road","carpet"]),
 ("fill","A push or a pull is called a ____. (one word)","force"),
 ("mcq","If no force acts on a still object, it will:","stay still",["start moving on its own","disappear","grow"]),
 ("mcq","Throwing a ball harder makes it go:","faster and farther",["slower","backward","nowhere"]),
 ("mcq","Two people pulling a rope are each using a:","pull (force)",["push only","sound","light"]),
],
"balanced-and-unbalanced-forces": [
 ("mcq","When two forces are equal and opposite, they are:","balanced",["unbalanced","gone","magnetic"]),
 ("mcq","In a tug-of-war where nobody moves, the forces are:","balanced",["unbalanced","zero people","huge"]),
 ("mcq","Balanced forces on a still object make it:","stay still",["speed up","fall apart","glow"]),
 ("mcq","Unbalanced forces cause an object's motion to:","change",["stay exactly the same","disappear","freeze"]),
 ("mcq","A book resting on a table has forces that are:","balanced",["unbalanced","spinning","missing"]),
 ("mcq","If one team in tug-of-war pulls harder, the forces become:","unbalanced",["balanced","equal","silent"]),
 ("mcq","When forces are unbalanced, the object moves toward the:","stronger force",["weaker force","ceiling always","past"]),
 ("mcq","A parked car with the brake on stays still because forces are:","balanced",["unbalanced","invisible","magnetic"]),
 ("mcq","Pushing a swing harder on one side makes the forces:","unbalanced",["balanced","gone","cold"]),
 ("mcq","Balanced forces add up to a total push of:","zero",["one hundred","a lot","infinity"]),
 ("mcq","A floating boat that stays in place has forces that are:","balanced",["unbalanced","upward only","spinning"]),
 ("mcq","To start a still object moving, you need forces that are:","unbalanced",["balanced","equal","zero"]),
 ("mcq","Which shows balanced forces?","a rope not moving in tug-of-war",["a car speeding up","a falling apple","a kicked ball"]),
 ("mcq","Which shows unbalanced forces?","a sled sliding downhill",["a book sitting still","a parked bike","a resting cat"]),
 ("mcq","When you stop pushing a rolling cart, friction is an:","unbalanced force that slows it",["balanced force","light","sound"]),
 ("fill","Forces that are equal and opposite are called ____. (one word)","balanced"),
 ("mcq","If forces on an object are balanced, its speed:","does not change",["always increases","always decreases","doubles"]),
 ("mcq","An arrow flying forward then slowing shows forces that became:","unbalanced (air pushes back)",["balanced","zero","magnetic"]),
 ("mcq","Two equal teams in tug-of-war keep the flag:","in the middle",["moving fast","off the ground","spinning"]),
 ("mcq","A magnet pulling a paperclip until they stick shows an:","unbalanced force",["balanced force","no force","sound force"]),
],
"patterns-of-motion": [
 ("mcq","A swing going back and forth shows a motion that is:","repeating (a pattern)",["random","stopped","one-time"]),
 ("mcq","Because motion follows patterns, we can:","predict where it goes next",["never guess","stop time","make new matter"]),
 ("mcq","A bouncing ball usually bounces:","a little lower each time",["higher forever","sideways only","not at all"]),
 ("mcq","The hands of a clock move in a pattern that:","repeats every hour",["never repeats","is random","stops at noon"]),
 ("mcq","A merry-go-round spins in a motion that is:","round and round (circular)",["straight only","zig-zag","backward only"]),
 ("mcq","A pendulum swings in a pattern, so its next swing is:","easy to predict",["impossible to know","always different","invisible"]),
 ("mcq","Day and night happen in a repeating:","pattern",["accident","sound","force"]),
 ("mcq","A jump rope spinning makes a motion that is:","repeating",["one-time","random","still"]),
 ("mcq","If a toy car goes around a loop track the same way each time, the motion is:","predictable",["unpredictable","frozen","new each time"]),
 ("mcq","A heartbeat is a motion pattern that:","repeats steadily",["happens once","is random","never changes speed ever"]),
 ("mcq","Waves at the beach roll in a pattern that is:","repeating",["one-time","random","backward only"]),
 ("mcq","Knowing a pattern of motion helps you:","catch a bouncing ball",["change its color","make it vanish","stop gravity"]),
 ("mcq","A seesaw goes up and down in a motion that is:","repeating",["random","still","one-way"]),
 ("mcq","The Moon's phases follow a:","repeating pattern",["random order","straight line","single event"]),
 ("mcq","A spinning top slows and then:","falls over (pattern ends)",["spins forever","flies away","grows"]),
 ("fill","Motion that repeats over and over is called a ____. (one word)","pattern"),
 ("mcq","Which motion is easiest to predict?","a swing that swings the same each time",["a leaf in a gusty wind","a bouncing surprise toy","a popping balloon"]),
 ("mcq","A train on a track moves in a path that is:","fixed and predictable",["totally random","invisible","backward only"]),
 ("mcq","A ball rolled the same way down the same ramp will:","go about the same distance",["go a wildly different way","disappear","float"]),
 ("mcq","Patterns in motion repeat, which makes them:","predictable",["impossible","magic","silent"]),
],
"magnets-and-forces": [
 ("mcq","A magnet can pull objects made of:","iron",["plastic","wood","glass"]),
 ("mcq","Magnets can push or pull without:","touching",["any poles","metal","Earth"]),
 ("mcq","Two north poles brought together will:","push apart (repel)",["pull together","melt","glow"]),
 ("mcq","A north pole and a south pole will:","pull together (attract)",["repel","vanish","spin"]),
 ("mcq","Which object would a magnet attract?","a steel paperclip",["a rubber band","a paper cup","a wooden block"]),
 ("mcq","A magnet's force is strongest at its:","poles",["middle","color","weight"]),
 ("mcq","Magnetism is a force that works:","across a small distance",["only by touching with glue","only underwater","only at night"]),
 ("mcq","Which would NOT stick to a magnet?","a plastic spoon",["an iron nail","a steel pin","a metal washer"]),
 ("mcq","A compass needle is a small:","magnet",["battery","light","clock"]),
 ("mcq","Two magnets that snap together were showing:","attraction",["repulsion","friction only","gravity only"]),
 ("mcq","If two magnets push apart, their facing poles are:","the same",["opposite","missing","melted"]),
 ("mcq","Earth itself acts like a giant:","magnet",["battery","mirror","fossil"]),
 ("mcq","You can make a paperclip move with a magnet held:","near it (not touching)",["a mile away","underwater only","in the dark only"]),
 ("mcq","Magnets are useful for:","holding notes on a fridge",["making sound","growing plants","cooling soup"]),
 ("mcq","Which pair would attract?","north pole and south pole",["north and north","south and south","two plastics"]),
 ("fill","When opposite poles pull together, we say they ____. (one word)","attract"),
 ("mcq","A stronger magnet can pick up:","more paperclips",["fewer paperclips","no metal","only plastic"]),
 ("mcq","Magnetic force can pass through a thin sheet of:","paper",["thick steel easily","lead","nothing"]),
 ("mcq","Sorting metal cans with a giant magnet works because cans have:","iron/steel",["plastic","glass","wood"]),
 ("mcq","Like poles (both south) will:","repel",["attract","stick","melt"]),
],
"life-cycles": [
 ("mcq","The stages a living thing goes through is called its:","life cycle",["habitat","force","weather"]),
 ("mcq","A butterfly starts its life as an:","egg",["adult","cocoon first","old butterfly"]),
 ("mcq","After hatching, a butterfly is a:","caterpillar (larva)",["frog","bird","seed"]),
 ("mcq","A caterpillar forms a chrysalis and becomes a:","butterfly",["beetle","fish","flower"]),
 ("mcq","A frog begins life as an egg, then becomes a:","tadpole",["caterpillar","chick","puppy"]),
 ("mcq","A plant's life cycle often starts with a:","seed",["flower first","fruit first","leaf first"]),
 ("mcq","Most living things' life cycles end with:","death",["birth","an egg","a seed"]),
 ("mcq","A chicken's life cycle begins with an:","egg",["adult hen only","chick that never grows","feather"]),
 ("mcq","Which is the correct order for a butterfly?","egg, caterpillar, chrysalis, butterfly",["butterfly, egg, chick","seed, sprout, tree","tadpole, frog"]),
 ("mcq","Seeds grow into seedlings, then into:","adult plants",["animals","rocks","clouds"]),
 ("mcq","A tadpole grows legs and loses its tail to become a:","frog",["fish","snake","bird"]),
 ("mcq","All life cycles include being born, growing, and:","reproducing",["flying","melting","shrinking only"]),
 ("mcq","A young dog is called a:","puppy",["calf","chick","fawn"]),
 ("mcq","Reproduction means living things:","make more of their own kind",["change color","get colder","stop eating"]),
 ("mcq","Which animal hatches from an egg?","a chicken",["a dog","a cat","a horse"]),
 ("fill","The stages of growth and change in a living thing make up its life ____. (one word)","cycle"),
 ("mcq","A flower can become a fruit that holds:","seeds",["rocks","water only","air"]),
 ("mcq","A baby cow is called a:","calf",["puppy","kitten","cub"]),
 ("mcq","Plants and animals both grow and then:","make new offspring",["turn to stone","stop the cycle forever after birth","become weather"]),
 ("mcq","The chrysalis stage is when a caterpillar:","changes into a butterfly",["lays eggs","eats the most","flies"]),
],
"traits-and-inheritance": [
 ("mcq","A feature passed from parents to offspring is a:","trait",["force","habitat","season"]),
 ("mcq","Puppies often look like their:","parents",["food","owners' cars","toys"]),
 ("mcq","Eye color in people is mostly a:","inherited trait",["choice","weather event","sound"]),
 ("mcq","Offspring inherit traits from:","their parents",["the weather","their friends","the soil"]),
 ("mcq","A tall plant often has seeds that grow into plants that are:","tall too",["always short","made of metal","blue"]),
 ("mcq","Which is an inherited trait of a dog?","fur color",["a leash it wears","its name","its collar"]),
 ("mcq","Baby animals usually resemble but are not exactly like their:","parents",["rocks","houses","food"]),
 ("mcq","The flower color of a plant is passed down from the:","parent plant",["gardener","pot","sun only"]),
 ("mcq","Inherited means a trait is:","passed from parent to offspring",["learned at school","bought in a store","made by weather"]),
 ("mcq","Kittens in one litter may have different:","fur patterns",["numbers of parents","planets","alphabets"]),
 ("mcq","A trait you are born with is:","inherited",["learned","painted on","temporary always"]),
 ("mcq","Which is most likely inherited?","the shape of a leaf",["a sticker on a tree","a fence around it","a sign"]),
 ("mcq","Tall parents are more likely to have children who are:","tall",["always short","made of plastic","green"]),
 ("mcq","Offspring are similar to their parents but also show:","small differences",["no differences ever","opposite traits only","no traits"]),
 ("mcq","A calf inherits its coat color from its:","parents",["barn","farmer","feed"]),
 ("fill","A feature passed from parents to their young is called a ____. (one word)","trait"),
 ("mcq","Which of these is an inherited plant trait?","petal color",["the label on the pot","the water can","the shelf"]),
 ("mcq","Baby birds usually have feathers like their:","parents",["nest","tree","sky"]),
 ("mcq","Inherited traits help us see that offspring:","belong to the same kind as their parents",["have no parents","are rocks","never grow"]),
 ("mcq","Which is NOT an inherited trait?","a haircut",["natural hair color","eye color","ear shape"]),
],
"variation-of-traits": [
 ("mcq","Differences in traits among the same kind of animal are called:","variation",["weather","force","habitat"]),
 ("mcq","Some dogs of the same breed have slightly different:","sizes",["numbers of legs always 6","planets","alphabets"]),
 ("mcq","Variation means individuals of one kind are:","not all exactly alike",["all identical","not living","made of metal"]),
 ("mcq","Some traits are influenced by the environment, like a plant getting:","more sunlight and growing taller",["a new name","a fence","a sticker"]),
 ("mcq","Two sunflower seeds from the same plant may grow to be:","different heights",["the same exact height always","animals","rocks"]),
 ("mcq","A trait that can change with food and care is:","an animal's weight",["its species","its number of eyes","its skeleton count"]),
 ("mcq","Children in one family may have different:","hair colors",["sets of parents","planets","languages at birth"]),
 ("mcq","Variation in a group can help some individuals:","survive better in their environment",["fly to space","stop aging","turn to stone"]),
 ("mcq","A plant grown in the dark may be:","paler and weaker",["greener and stronger","made of plastic","a different species"]),
 ("mcq","Which difference is caused mostly by the environment?","a sun-tanned vs. pale leaf",["eye color","number of petals at birth","seed type"]),
 ("mcq","Even identical-looking puppies can differ in:","behavior",["number of parents","planet","alphabet"]),
 ("mcq","Variation is important because it makes a group:","more able to handle change",["all the same","unable to grow","invisible"]),
 ("mcq","Two tomato plants given different water may produce:","different amounts of fruit",["the same exact fruit","metal","no plants ever"]),
 ("mcq","Which is a trait that varies among house cats?","fur length",["having whiskers at all","being a mammal","having a heart"]),
 ("mcq","Differences between individuals are:","normal and natural",["always a sickness","impossible","man-made only"]),
 ("fill","Differences in traits among the same kind of living thing are called ____. (one word)","variation"),
 ("mcq","A puppy that gets more exercise may grow:","stronger muscles",["a new species","extra eyes","wings"]),
 ("mcq","Some flower plants are tall and some short; this is:","variation",["weather","gravity","friction"]),
 ("mcq","Environment can affect traits such as:","a plant's size",["its kind/species","its number of seed types","its DNA letters at birth"]),
 ("mcq","Which best shows variation?","students in a class are different heights",["all clocks show 3:00","all squares have 4 sides","ice is frozen water"]),
],
"adaptations-and-survival": [
 ("mcq","A body part or behavior that helps an animal survive is an:","adaptation",["accident","weather","force"]),
 ("mcq","A polar bear's thick fur is an adaptation for:","staying warm in the cold",["swimming in lava","flying","digging gold"]),
 ("mcq","A cactus stores water in its thick stem to survive in the:","desert",["ocean","arctic","forest floor"]),
 ("mcq","Camouflage helps an animal:","hide from predators",["glow at night","fly higher","swim faster only"]),
 ("mcq","A duck's webbed feet are an adaptation for:","swimming",["climbing trees","digging","flying high"]),
 ("mcq","Sharp claws help a hawk to:","catch prey",["stay warm","see color","sing"]),
 ("mcq","A giraffe's long neck helps it:","reach high leaves",["swim","dig tunnels","hide underground"]),
 ("mcq","Animals that are well-suited to their habitat are more likely to:","survive",["disappear","melt","stop eating"]),
 ("mcq","A fish's gills are an adaptation for:","breathing underwater",["breathing on land","flying","digging"]),
 ("mcq","Thick fur and fat help animals survive in a:","cold climate",["hot desert","volcano","city street"]),
 ("mcq","A chameleon changing color is an adaptation for:","camouflage",["cooking","flying","reading"]),
 ("mcq","Plants in shady forests often have wide leaves to:","catch more sunlight",["scare animals","stay cold","make sound"]),
 ("mcq","An owl's night vision is an adaptation for:","hunting in the dark",["swimming","digging","flying to space"]),
 ("mcq","If a habitat changes, animals that cannot adapt may:","struggle to survive",["instantly grow wings","turn to stone","become plants"]),
 ("mcq","A turtle's hard shell is an adaptation for:","protection",["swimming fast only","flying","seeing color"]),
 ("fill","A body part or behavior that helps an animal survive is an ____. (one word)","adaptation"),
 ("mcq","Webbed feet, gills, and fins all help animals live:","in or near water",["in the desert","in space","underground only"]),
 ("mcq","A desert fox's big ears help it:","stay cool",["swim","fly","dig gold"]),
 ("mcq","Spines on a porcupine are an adaptation for:","defense",["flying","swimming","singing"]),
 ("mcq","Birds that eat seeds often have beaks that are:","strong for cracking",["long and thin only","flat like a duck's only","made of metal"]),
],
"habitats-and-environment-change": [
 ("mcq","The place where a plant or animal naturally lives is its:","habitat",["adaptation","trait","force"]),
 ("mcq","A habitat provides an animal with food, water, and:","shelter",["homework","money","toys"]),
 ("mcq","If a pond dries up, the fish living there will:","lose their habitat",["grow wings","become birds","be fine forever"]),
 ("mcq","Cutting down a forest can cause animals to:","lose their homes",["gain new planets","stop needing food","turn to stone"]),
 ("mcq","Which animal best fits a desert habitat?","a lizard",["a polar bear","a whale","a penguin"]),
 ("mcq","When the environment changes, some animals:","move to a new area",["instantly adapt perfectly","disappear by magic","grow gills always"]),
 ("mcq","A habitat with lots of trees and shade is a:","forest",["desert","ocean","tundra"]),
 ("mcq","Pollution in a river can harm the:","fish and plants living there",["weather of space","Moon","alphabet"]),
 ("mcq","Which change is helpful to a habitat?","planting new trees",["dumping trash","draining a pond","burning a forest"]),
 ("mcq","Animals depend on plants in their habitat for:","food and oxygen",["homework","cars","money"]),
 ("mcq","A polar bear is best suited to a habitat that is:","cold and icy",["hot and sandy","a rainforest","a city park"]),
 ("mcq","If a habitat can no longer meet an animal's needs, the animal may:","move, adapt, or die",["grow a new species instantly","become a rock","make weather"]),
 ("mcq","Building a road through a forest can:","split up animal habitats",["help all animals fly","cool the Sun","create fossils fast"]),
 ("mcq","Wetlands are habitats with lots of:","water and plants",["sand and no water","ice only","lava"]),
 ("mcq","A change like a flood can:","force animals to find new homes",["make animals immortal","stop time","turn water to metal"]),
 ("fill","The natural home of a plant or animal is its ____. (one word)","habitat"),
 ("mcq","Which best helps protect habitats?","keeping rivers clean",["littering","cutting all trees","draining lakes"]),
 ("mcq","A fish is best suited to a habitat that is:","watery",["dry desert","icy mountain top","inside a cave with no water"]),
 ("mcq","When food becomes scarce in a habitat, animals may:","migrate to find more",["stop being hungry","grow wheavier","turn into plants"]),
 ("mcq","Which living thing fits an ocean habitat?","a dolphin",["a camel","a cactus","a polar bear"]),
],
"weather-and-climate": [
 ("mcq","The day-to-day state of the air (sunny, rainy, windy) is:","weather",["climate","gravity","a habitat"]),
 ("mcq","The usual weather of a place over many years is its:","climate",["weather today","force","adaptation"]),
 ("mcq","A tool that measures temperature is a:","thermometer",["ruler","scale","clock"]),
 ("mcq","Rain, snow, and hail are all kinds of:","precipitation",["climate","wind","sunshine"]),
 ("mcq","A place that is hot and dry most of the year has a:","desert climate",["polar climate","rainy climate","ocean of ice"]),
 ("mcq","Scientists who study and predict weather are:","meteorologists",["dentists","pilots","chefs"]),
 ("mcq","A tool that shows wind direction is a:","wind vane",["thermometer","ruler","scale"]),
 ("mcq","Which describes climate, not today's weather?","summers here are usually hot",["it is raining right now","the wind is gusty today","it snowed this morning"]),
 ("mcq","Very cold, icy regions near the poles have a:","polar climate",["desert climate","tropical climate","city climate"]),
 ("mcq","Weather can change:","from day to day",["only once a year","never","only on the Moon"]),
 ("mcq","A rain gauge measures the amount of:","rainfall",["wind","temperature","sunlight"]),
 ("mcq","Knowing the climate helps people decide:","what clothes to pack for a season",["the alphabet","their height","their name"]),
 ("mcq","A hot, wet climate with lots of rain supports a:","rainforest",["desert","tundra","glacier"]),
 ("mcq","Which is an example of weather?","a thunderstorm this afternoon",["the region is usually dry","winters are cold here","summers are warm here"]),
 ("mcq","Climate is described using patterns over a:","long time (years)",["single hour","single minute","single second"]),
 ("fill","The day-to-day condition of the air is called ____. (one word)","weather"),
 ("mcq","People in a snowy climate often build homes with:","steep roofs so snow slides off",["no walls","sand floors","ice furniture only"]),
 ("mcq","Which tool helps predict if a storm is coming?","weather instruments and maps",["a dictionary","a calculator","a paintbrush"]),
 ("mcq","A region near the equator usually has a climate that is:","warm",["freezing","snowy all year","without any sun"]),
 ("mcq","Both weather and climate are about the:","air and sky conditions",["ocean floor rocks","inside of volcanoes","colors of cars"]),
],
}


# ============================================ READING (authored, grade 3)

READING3 = {
"main-idea": [
 ("mcq","Read: \"Sam's dog Biscuit can do tricks. He can sit, roll over, and shake hands.\" What is the main idea?","Biscuit can do tricks.",["Sam has a cat.","Biscuit is brown.","Sam likes pizza."]),
 ("mcq","Read: \"Rain helps the Earth. It fills rivers, waters plants, and gives animals water to drink.\" The main idea is that rain:","helps living things",["is cold","falls at night","is loud"]),
 ("mcq","Read: \"Maria cleaned her room. She made her bed, picked up toys, and put away books.\" What is the main idea?","Maria cleaned her room.",["Maria has many toys.","Maria likes books.","Maria is tired."]),
 ("mcq","Read: \"Bees are busy. They fly to flowers, gather nectar, and make honey.\" The passage is mostly about:","what bees do",["the color of flowers","how to bake","rainy days"]),
 ("mcq","Read: \"Our class went to the farm. We saw cows, fed goats, and picked apples.\" The main idea is that the class:","visited a farm",["ate lunch","stayed home","read a book"]),
 ("mcq","Read: \"Winter is fun. You can build snowmen, go sledding, and drink hot cocoa.\" The main idea is that winter:","is fun",["is short","is warm","has no snow"]),
 ("mcq","Read: \"Tom loves the library. He reads books, uses computers, and joins story time.\" What is the main idea?","Tom enjoys many things at the library.",["Tom is hungry.","The library is far.","Tom has a bike."]),
 ("mcq","Read: \"Plants need care. They need water, sunlight, and good soil to grow.\" The main idea is that plants:","need care to grow",["are green","are tall","smell nice"]),
 ("mcq","Read: \"The fire truck is helpful. It carries water, ladders, and brave firefighters.\" The passage is mostly about:","how the fire truck helps",["the color red","loud sirens only","a cat in a tree"]),
 ("mcq","Read: \"Ducks are great swimmers. Their webbed feet push the water and their feathers keep them dry.\" The main idea is that ducks:","are good at swimming",["are yellow","quack loudly","eat bread"]),
 ("mcq","Read: \"Mom planted a garden. She grew tomatoes, beans, and carrots.\" The main idea is that Mom:","planted a vegetable garden",["bought a car","cooked dinner","went to work"]),
 ("mcq","Read: \"Recess is the best. We run, play games, and laugh with friends.\" The main idea is that recess:","is fun with friends",["is short","is quiet","is indoors"]),
 ("mcq","Read: \"The ocean is full of life. Fish swim, crabs crawl, and whales dive deep.\" The passage is mostly about:","animals in the ocean",["sand on the beach","a sailboat","the weather"]),
 ("mcq","Read: \"Birds build nests. They gather twigs, grass, and leaves to make a cozy home.\" The main idea is that birds:","build nests for a home",["fly south","sing songs","eat worms"]),
 ("mcq","Read: \"Exercise keeps you healthy. It makes your body strong and your heart happy.\" The main idea is that exercise:","keeps you healthy",["is boring","needs a ball","is at night"]),
 ("fill","Read: \"Brushing your teeth keeps them clean and healthy.\" In one word, the passage is mostly about keeping teeth ____. ","clean"),
 ("mcq","Read: \"The park has lots to do. You can swing, slide, and climb.\" The main idea is that the park:","has fun things to do",["is empty","is closed","is small"]),
 ("mcq","Read: \"Grandpa tells great stories about pirates, dragons, and faraway lands.\" The passage is mostly about:","Grandpa's stories",["a real pirate","a pet dragon","a long trip"]),
 ("mcq","Read: \"Apples are tasty and good for you. They are sweet, crunchy, and full of vitamins.\" The main idea is that apples:","are tasty and healthy",["are red only","grow fast","are heavy"]),
 ("mcq","Read: \"The bakery smells wonderful. There is fresh bread, warm cookies, and sweet cake.\" The passage is mostly about:","good things at the bakery",["a long line","the cash register","a closed door"]),
],
"key-details": [
 ("mcq","Read: \"Lily has a red kite. She flies it in the park on windy days.\" Where does Lily fly her kite?","in the park",["at school","in her room","at the store"]),
 ("mcq","Read: \"The picnic had sandwiches, juice, and grapes.\" Which food was at the picnic?","grapes",["pizza","soup","cake"]),
 ("mcq","Read: \"Max woke up early to walk his dog before school.\" When did Max walk his dog?","before school",["after dinner","at midnight","at lunch"]),
 ("mcq","Read: \"The turtle moved slowly across the warm sand.\" How did the turtle move?","slowly",["quickly","backward","by flying"]),
 ("mcq","Read: \"Ana painted a picture of a blue whale.\" What did Ana paint?","a blue whale",["a red car","a green tree","a yellow sun"]),
 ("mcq","Read: \"It rained all morning, so we played games inside.\" Why did they play inside?","because it rained",["it was sunny","it was night","school was closed"]),
 ("mcq","Read: \"The store opens at nine and closes at five.\" When does the store open?","at nine",["at five","at noon","at night"]),
 ("mcq","Read: \"Ben gave his sister three stickers.\" How many stickers did Ben give?","three",["one","five","ten"]),
 ("mcq","Read: \"The cat hid under the bed during the storm.\" Where did the cat hide?","under the bed",["in a tree","on the roof","in the car"]),
 ("mcq","Read: \"Grandma made soup with carrots, onions, and beans.\" Which is in the soup?","carrots",["apples","candy","ice"]),
 ("mcq","Read: \"They hiked up the tall mountain to see the view.\" Why did they hike up?","to see the view",["to swim","to sleep","to shop"]),
 ("mcq","Read: \"The bus was late because of heavy traffic.\" Why was the bus late?","heavy traffic",["it was new","it was empty","it was raining candy"]),
 ("mcq","Read: \"Jada planted sunflower seeds in May.\" What did Jada plant?","sunflower seeds",["beans","trees","grass"]),
 ("mcq","Read: \"The puppy chewed the slipper while we were out.\" What did the puppy chew?","the slipper",["the sofa","a bone","the door"]),
 ("mcq","Read: \"We saw fireworks on the Fourth of July.\" When did they see fireworks?","on the Fourth of July",["on New Year","at school","on Monday"]),
 ("fill","Read: \"Sara's favorite color is purple.\" What is Sara's favorite color? (one word)","purple"),
 ("mcq","Read: \"The library is next to the bakery on Main Street.\" Where is the library?","next to the bakery",["on the hill","by the lake","in the park"]),
 ("mcq","Read: \"Leo read for thirty minutes before bed.\" How long did Leo read?","thirty minutes",["all day","one hour","one minute"]),
 ("mcq","Read: \"The robins built their nest in the oak tree.\" Where did the robins build their nest?","in the oak tree",["on the ground","in a barn","under a rock"]),
 ("mcq","Read: \"Dad fixed the bike with a wrench and some oil.\" What did Dad use to fix the bike?","a wrench and oil",["a spoon","glue","tape only"]),
],
"story-sequence": [
 ("mcq","Read: \"First Mia got dressed. Next she ate breakfast. Then she went to school.\" What did Mia do FIRST?","got dressed",["ate breakfast","went to school","came home"]),
 ("mcq","Read: \"Jack planted a seed, watered it, and watched it grow.\" What did Jack do LAST?","watched it grow",["planted a seed","watered it","picked a flower"]),
 ("mcq","Read: \"We packed a bag, drove to the beach, and built a sandcastle.\" What happened SECOND?","drove to the beach",["packed a bag","built a sandcastle","swam"]),
 ("mcq","Read: \"The bell rang, the kids lined up, and they walked inside.\" What happened FIRST?","the bell rang",["kids walked inside","kids lined up","class started"]),
 ("mcq","Read: \"Dad mixed the batter, poured it in a pan, and baked a cake.\" What did Dad do right after mixing?","poured it in a pan",["baked the cake","ate the cake","washed dishes"]),
 ("mcq","Read: \"She tied her shoes, grabbed her ball, and ran outside.\" What did she do LAST?","ran outside",["tied her shoes","grabbed her ball","sat down"]),
 ("mcq","Read: \"The sun set, the stars came out, and we fell asleep.\" What happened FIRST?","the sun set",["we fell asleep","the stars came out","the sun rose"]),
 ("mcq","Read: \"He read the recipe, gathered the food, and started cooking.\" What did he do BEFORE cooking?","gathered the food",["ate dessert","washed up","set the table"]),
 ("mcq","Read: \"We bought tickets, found our seats, and watched the show.\" What came SECOND?","found our seats",["bought tickets","watched the show","went home"]),
 ("mcq","Read: \"The seed sprouted, grew leaves, and then bloomed.\" What happened LAST?","it bloomed",["it sprouted","it grew leaves","it was picked"]),
 ("mcq","Read: \"Tom woke up, brushed his teeth, then made his bed.\" What did Tom do FIRST?","woke up",["made his bed","brushed his teeth","went out"]),
 ("mcq","Read: \"They climbed the hill, ate lunch, and rolled down.\" What did they do right after climbing?","ate lunch",["rolled down","slept","drove home"]),
 ("mcq","Read: \"First fill the tub, next add bubbles, then hop in.\" What is the LAST step?","hop in",["fill the tub","add bubbles","drain it"]),
 ("mcq","Read: \"The dog barked, the cat ran, and the bird flew off.\" What happened FIRST?","the dog barked",["the bird flew","the cat ran","the sun set"]),
 ("mcq","Read: \"We washed the car, dried it, and then waxed it.\" What came right after washing?","drying it",["waxing it","driving it","parking it"]),
 ("fill","Read: \"First you put on socks, then your shoes.\" What do you put on first? (one word)","socks"),
 ("mcq","Read: \"She wrote the letter, sealed the envelope, and mailed it.\" What did she do LAST?","mailed it",["wrote the letter","sealed the envelope","read it"]),
 ("mcq","Read: \"The light turned green, the cars moved, and we crossed.\" What happened FIRST?","the light turned green",["we crossed","the cars stopped","it got dark"]),
 ("mcq","Read: \"He picked apples, washed them, and made a pie.\" What did he do BEFORE making the pie?","washed the apples",["ate the pie","sold apples","planted a tree"]),
 ("mcq","Read: \"They set up the tent, lit a fire, and roasted marshmallows.\" What came SECOND?","lit a fire",["set up the tent","roasted marshmallows","slept"]),
],
"cause-and-effect": [
 ("mcq","Read: \"It started to rain, so we ran inside.\" Why did they run inside?","because it rained",["it was sunny","they were tired","it was lunch"]),
 ("mcq","Read: \"Ed forgot his umbrella, so he got wet.\" What was the effect?","he got wet",["he stayed dry","he ran fast","he was warm"]),
 ("mcq","Read: \"The plant got sunlight and water, so it grew.\" Why did the plant grow?","it got sunlight and water",["it was dark","it was cold","nobody touched it"]),
 ("mcq","Read: \"She practiced every day, so she got better at piano.\" What caused her to improve?","she practiced every day",["she quit","she slept","it was easy"]),
 ("mcq","Read: \"The ice cream melted because it was hot outside.\" Why did it melt?","it was hot outside",["it was frozen","it was night","it was tiny"]),
 ("mcq","Read: \"He dropped the cup, so it broke.\" What was the effect of dropping the cup?","it broke",["it floated","it grew","nothing happened"]),
 ("mcq","Read: \"The dog was hungry, so it barked at its bowl.\" Why did the dog bark?","it was hungry",["it was full","it was sleepy","it was cold"]),
 ("mcq","Read: \"Because the road was icy, the bus went slowly.\" Why did the bus go slowly?","the road was icy",["it was sunny","it was new","it was empty"]),
 ("mcq","Read: \"We watered the seeds, so they sprouted.\" What was the effect?","the seeds sprouted",["the seeds dried up","nothing grew","it snowed"]),
 ("mcq","Read: \"The wind blew hard, so the kite flew high.\" What made the kite fly high?","the strong wind",["the heavy kite","the rain","the dark"]),
 ("mcq","Read: \"Mia studied for the test, so she did well.\" Why did Mia do well?","she studied",["she was late","she slept in","she guessed"]),
 ("mcq","Read: \"The power went out, so we lit candles.\" What was the cause?","the power went out",["we lit candles","it was morning","the lights were on"]),
 ("mcq","Read: \"He left the gate open, so the dog ran out.\" What was the effect?","the dog ran out",["the dog slept","the gate closed","the dog ate"]),
 ("mcq","Read: \"Because it was cold, she wore a coat.\" Why did she wear a coat?","it was cold",["it was hot","it was sunny","it was loud"]),
 ("mcq","Read: \"The baby was sleepy, so she cried.\" Why did the baby cry?","she was sleepy",["she was happy","she ate","she ran"]),
 ("fill","Read: \"He didn't water the plant, so it ____.\" Fill the effect word (it dried up and...). (one word)","wilted"),
 ("mcq","Read: \"The team practiced hard, so they won.\" What caused the win?","practicing hard",["the rain","the bus","the snacks"]),
 ("mcq","Read: \"It snowed all night, so school was closed.\" Why was school closed?","it snowed all night",["it was summer","it was sunny","it was Friday"]),
 ("mcq","Read: \"The volcano erupted, so people moved away.\" What was the effect?","people moved away",["people moved closer","it was quiet","nothing changed"]),
 ("mcq","Read: \"She turned off the light, so the room got dark.\" What made the room dark?","turning off the light",["the sun","the lamp on","the window"]),
],
"context-clues": [
 ("mcq","Read: \"The tiny ant was so small I could barely see it.\" What does \"tiny\" mean?","very small",["very big","very loud","very fast"]),
 ("mcq","Read: \"She was joyful and smiled all day.\" What does \"joyful\" mean?","very happy",["very sad","very tired","very angry"]),
 ("mcq","Read: \"The soup was hot, so he let it cool down.\" What does \"hot\" mean here?","very warm",["very cold","very sweet","empty"]),
 ("mcq","Read: \"The path was narrow, so only one person could pass.\" What does \"narrow\" mean?","not wide",["very tall","bright","heavy"]),
 ("mcq","Read: \"He was exhausted after running and fell asleep fast.\" What does \"exhausted\" mean?","very tired",["excited","hungry","cold"]),
 ("mcq","Read: \"The huge elephant was the biggest animal there.\" What does \"huge\" mean?","very big",["very small","very quiet","very fast"]),
 ("mcq","Read: \"The room was silent; nobody made a sound.\" What does \"silent\" mean?","very quiet",["very loud","very bright","very cold"]),
 ("mcq","Read: \"She is generous and shares her snacks.\" What does \"generous\" mean?","willing to share",["selfish","mean","sleepy"]),
 ("mcq","Read: \"The shy puppy hid behind the chair.\" What does \"shy\" mean?","timid or fearful",["loud","brave","huge"]),
 ("mcq","Read: \"It was freezing, so we wore thick coats.\" What does \"freezing\" mean?","very cold",["very hot","very wet","very dry"]),
 ("mcq","Read: \"The bag was heavy and hard to lift.\" What does \"heavy\" mean?","weighs a lot",["weighs little","is empty","is small"]),
 ("mcq","Read: \"The old, ancient house was over 100 years old.\" What does \"ancient\" mean?","very old",["brand new","colorful","tiny"]),
 ("mcq","Read: \"She spoke in a faint whisper we could barely hear.\" What does \"faint\" mean here?","weak or soft",["very loud","sweet","bright"]),
 ("mcq","Read: \"The cup was empty, so he filled it with water.\" What does \"empty\" mean?","nothing inside",["full","heavy","broken"]),
 ("mcq","Read: \"The clever fox found a smart way out.\" What does \"clever\" mean?","smart",["silly","slow","tired"]),
 ("fill","Read: \"The room was bright because the sun shone in.\" What does \"bright\" mean? Full of ____. (one word)","light"),
 ("mcq","Read: \"He was furious and stomped his feet.\" What does \"furious\" mean?","very angry",["very happy","very calm","very sleepy"]),
 ("mcq","Read: \"The fragile glass broke when it fell.\" What does \"fragile\" mean?","easily broken",["very strong","very heavy","very old"]),
 ("mcq","Read: \"She was thrilled to win the prize.\" What does \"thrilled\" mean?","very excited",["very bored","very upset","very tired"]),
 ("mcq","Read: \"The damp towel was still a little wet.\" What does \"damp\" mean?","slightly wet",["bone dry","frozen","on fire"]),
],
"making-predictions": [
 ("mcq","Read: \"Dark clouds gathered and the wind grew strong.\" What will probably happen next?","It will rain.",["The sun will shine.","It will snow candy.","Nothing changes."]),
 ("mcq","Read: \"Tom put on his swimsuit and grabbed a towel.\" What will Tom probably do?","go swimming",["go to sleep","do homework","shovel snow"]),
 ("mcq","Read: \"The cake is in the oven and the timer is almost done.\" What will happen soon?","The cake will be ready.",["The cake will freeze.","The oven will fly.","It will rain inside."]),
 ("mcq","Read: \"Mia yawned and rubbed her eyes at bedtime.\" What will Mia probably do?","fall asleep",["run a race","eat lunch","go to school"]),
 ("mcq","Read: \"He filled the watering can and walked to the garden.\" What will he probably do?","water the plants",["wash the car","cook dinner","fly a kite"]),
 ("mcq","Read: \"The team is winning with one minute left.\" What will probably happen?","The team will likely win.",["The game starts over.","Everyone goes home first.","They lose for sure."]),
 ("mcq","Read: \"She packed a lunch, a map, and hiking boots.\" What will she probably do?","go on a hike",["go to bed","go swimming","stay inside"]),
 ("mcq","Read: \"The ice cream is melting in the hot sun.\" What will happen if she waits?","It will melt more.",["It will freeze.","It will grow.","It will glow."]),
 ("mcq","Read: \"He studied all week for Friday's spelling test.\" What will probably happen?","He will likely do well.",["He will fail on purpose.","The test is canceled.","He forgets everything for sure."]),
 ("mcq","Read: \"The puppy is staring at its empty bowl and whining.\" What does the puppy probably want?","food",["a bath","a walk to school","a nap only"]),
 ("mcq","Read: \"Clouds cleared and the sun came out after the storm.\" What might appear?","a rainbow",["snow","fireworks","a moon at noon"]),
 ("mcq","Read: \"She blew up balloons and hung a 'Happy Birthday' sign.\" What will probably happen?","a birthday party",["a school test","a nap","a car wash"]),
 ("mcq","Read: \"The leaves turned orange and the air got cooler.\" What season is probably coming?","fall, then winter",["summer","a hot day","spring planting"]),
 ("mcq","Read: \"He tied his cleats and grabbed the soccer ball.\" What will he probably do?","play soccer",["go fishing","read a book","bake bread"]),
 ("mcq","Read: \"The baby bird flapped its wings at the edge of the nest.\" What might it do?","try to fly",["swim","dig","sleep all winter"]),
 ("fill","Read: \"She opened her umbrella as the first drops fell.\" It is starting to ____. (one word)","rain"),
 ("mcq","Read: \"The library closes in five minutes and lights are dimming.\" What will people do?","leave the library",["start a movie","go to sleep there","build a fort"]),
 ("mcq","Read: \"He mixed flour, eggs, and sugar in a bowl.\" What is he probably making?","something to bake",["a sandcastle","a paper plane","a snowman"]),
 ("mcq","Read: \"The dog grabbed its leash and ran to the door.\" What does the dog want?","to go for a walk",["to sleep","to eat a rock","to fly"]),
 ("mcq","Read: \"Snow piled up and the school sign said 'Closed.'\" What will the kids probably do?","stay home and play in snow",["go to class","go swimming outside","mow the lawn"]),
],
"character-and-setting": [
 ("mcq","Read: \"In the busy city, Ravi waited for the train.\" Where does this happen (setting)?","in the city",["on a farm","in space","under the sea"]),
 ("mcq","Read: \"Kind Mrs. Lee helped the lost kitten find its way home.\" Who is the character?","Mrs. Lee",["the train","the city","the rain"]),
 ("mcq","Read: \"It was a snowy night in the quiet village.\" What is the setting?","a snowy village at night",["a sunny beach","a busy mall","a hot desert"]),
 ("mcq","Read: \"Brave Captain Mara sailed her ship through the storm.\" Who is the main character?","Captain Mara",["the storm","the ship's flag","the ocean"]),
 ("mcq","Read: \"At the farm, the rooster crowed at sunrise.\" Where does the story take place?","on a farm",["in a city","on the Moon","in a cave"]),
 ("mcq","Read: \"Curious Leo loved to ask questions about everything.\" What word describes Leo?","curious",["lazy","mean","sleepy"]),
 ("mcq","Read: \"The campers told stories by the fire deep in the forest.\" What is the setting?","a forest at night",["a school","a store","a pool"]),
 ("mcq","Read: \"Shy Nina hid behind her mom when the clown waved.\" How does Nina feel?","shy",["brave","angry","excited"]),
 ("mcq","Read: \"On the spaceship, Zoe floated past the control panel.\" Where is Zoe?","on a spaceship",["in a barn","at a beach","in a kitchen"]),
 ("mcq","Read: \"Grumpy Mr. Frost frowned at the noisy birds.\" What word describes Mr. Frost?","grumpy",["cheerful","calm","silly"]),
 ("mcq","Read: \"The market was crowded and full of bright fruit stands.\" What is the setting?","a busy market",["an empty field","a dark cave","a quiet library"]),
 ("mcq","Read: \"Helpful Sam carried the heavy bags for his neighbor.\" What word describes Sam?","helpful",["selfish","rude","lazy"]),
 ("mcq","Read: \"Deep under the sea, a little fish explored a coral reef.\" Where is the fish?","under the sea",["in the sky","on a mountain","in a city"]),
 ("mcq","Read: \"Excited Priya jumped up and down when she won.\" How does Priya feel?","excited",["bored","sad","sleepy"]),
 ("mcq","Read: \"It was a rainy afternoon inside the cozy cabin.\" What is the setting?","a cabin on a rainy day",["a sunny park","a school bus","a spaceship"]),
 ("fill","Read: \"Gentle Grandma hugged the crying child.\" One word that describes Grandma is ____. ","gentle"),
 ("mcq","Read: \"At the zoo, the children watched the monkeys swing.\" Where are the children?","at the zoo",["at home","in a boat","in space"]),
 ("mcq","Read: \"Clever Fox tricked the slow Bear in the old tale.\" Who are the characters?","Fox and Bear",["the tree and rock","the sun and moon","the road"]),
 ("mcq","Read: \"The story began on a hot summer day at the beach.\" What is the setting?","a beach in summer",["a snowy mountain","a dark cave","a classroom"]),
 ("mcq","Read: \"Honest Tia returned the wallet she found.\" What word describes Tia?","honest",["dishonest","mean","lazy"]),
],
"fact-and-opinion": [
 ("mcq","Which is a FACT?","A dog has four legs.",["Dogs are the best pets.","Cats are cuter.","Walks are boring."]),
 ("mcq","Which is an OPINION?","Summer is the best season.",["Summer is warm.","A week has 7 days.","Ice is frozen water."]),
 ("mcq","Which is a FACT?","The sun gives us light.",["Sunsets are pretty.","Mornings are the worst.","Yellow is happy."]),
 ("mcq","Which is an OPINION?","Pizza tastes amazing.",["Pizza has cheese.","A triangle has 3 sides.","Birds lay eggs."]),
 ("mcq","\"Our school has 200 students.\" This is a:","fact",["opinion","question","story"]),
 ("mcq","\"Reading is more fun than TV.\" This is an:","opinion",["fact","rule","number"]),
 ("mcq","Which can be checked to see if it is true?","The store opens at 9.",["Mondays are terrible.","This book is the best.","Green is calming."]),
 ("mcq","Which word often signals an opinion?","best",["measures","equals","contains"]),
 ("mcq","Which is a FACT?","Bees make honey.",["Bees are scary.","Honey is the tastiest.","Bugs are gross."]),
 ("mcq","Which is an OPINION?","Recess should be longer.",["Recess is after lunch.","A year has 12 months.","Water is wet."]),
 ("mcq","Which is a FACT?","Fish live in water.",["Fish are boring.","Sharks are mean.","The ocean is scary."]),
 ("mcq","Which is an OPINION?","Math is too hard.",["Ten is an even number.","A square has 4 sides.","Plants need light."]),
 ("mcq","\"The cat is black.\" This is a:","fact",["opinion","question","joke"]),
 ("mcq","\"Black cats are the prettiest.\" This is an:","opinion",["fact","number","rule"]),
 ("mcq","Which is a FACT you could check?","The library is on Oak Street.",["Libraries are boring.","Reading is the best.","Quiet places are dull."]),
 ("fill","A statement that tells what someone feels and can't be proven is an ____. (one word)","opinion"),
 ("mcq","Which is a FACT?","An apple is a fruit.",["Apples taste the best.","Red apples are prettiest.","Fruit is boring."]),
 ("mcq","Which is an OPINION?","Snow days are the best.",["Snow is cold.","Snow is frozen water.","Snow is white."]),
 ("mcq","Which signals an opinion?","favorite",["arrived","measured","counted"]),
 ("mcq","Which is a FACT?","Spiders have eight legs.",["Spiders are creepy.","Spiders are the worst.","Webs are ugly."]),
],
"compare-and-contrast": [
 ("mcq","Read: \"A cat and a dog are both pets, but a cat purrs and a dog barks.\" How are they ALIKE?","both are pets",["both purr","both bark","both fly"]),
 ("mcq","Read: \"Apples are crunchy, but bananas are soft.\" This shows a:","difference",["similarity","sequence","cause"]),
 ("mcq","Read: \"Both a bike and a car have wheels.\" The word that signals they are alike is:","both",["but","unlike","while"]),
 ("mcq","Read: \"Summer is hot, but winter is cold.\" This compares the seasons by:","temperature",["color","size","name"]),
 ("mcq","Read: \"Unlike a fish, a frog can live on land.\" The word \"unlike\" signals a:","difference",["similarity","sequence","cause"]),
 ("mcq","Read: \"A pencil and a crayon are both used to draw, but a pencil can be erased.\" How are they DIFFERENT?","a pencil can be erased",["both draw","both are tools","both are long"]),
 ("mcq","Read: \"Both birds and bats can fly.\" A similarity is that both:","can fly",["have fur","have feathers","swim"]),
 ("mcq","Read: \"The city is loud, while the farm is quiet.\" This contrasts the places by:","noise level",["color","spelling","price"]),
 ("mcq","Which word signals things are ALIKE?","also",["however","unlike","but"]),
 ("mcq","Read: \"Dogs and wolves look alike, but dogs are tame and wolves are wild.\" How are they DIFFERENT?","one is tame, one is wild",["both have tails","both are animals","both have fur"]),
 ("mcq","Read: \"Both a spoon and a fork are used to eat.\" They are alike because both:","help us eat",["are sharp knives","are cups","are plates"]),
 ("mcq","Read: \"A rose is red, but a leaf is green.\" This compares them by:","color",["size","sound","smell"]),
 ("mcq","Which word signals a difference?","but",["also","both","too"]),
 ("mcq","Read: \"Tigers and house cats are both cats, but tigers are much bigger.\" How are they DIFFERENT?","size",["both have whiskers","both are cats","both have tails"]),
 ("mcq","Read: \"Like a car, a bus carries people.\" The word \"like\" signals a:","similarity",["difference","sequence","cause"]),
 ("fill","The word \"both\" usually shows two things are ____ (alike or different?). ","alike"),
 ("mcq","Read: \"Winter has snow, but spring has flowers.\" This contrasts the seasons by:","what appears in them",["their letters","their price","their sound"]),
 ("mcq","Read: \"Both books are about dogs, but one is funny and one is sad.\" The difference is:","how they feel (funny vs sad)",["the topic (dogs)","the author's age","the cover only"]),
 ("mcq","Read: \"A duck and a chicken are both birds.\" They are alike because both:","are birds",["can swim deep","have fur","have four legs"]),
 ("mcq","Which sentence shows a similarity?","Both apples and pears grow on trees.",["A lion roars, but a mouse squeaks.","Unlike day, night is dark.","Cats meow, but dogs bark."]),
],
"synonyms-and-antonyms": [
 ("mcq","Which word means almost the same as \"happy\"?","glad",["sad","angry","tired"]),
 ("mcq","Which word is the OPPOSITE of \"big\"?","small",["large","huge","giant"]),
 ("mcq","A synonym for \"fast\" is:","quick",["slow","late","still"]),
 ("mcq","The opposite of \"hot\" is:","cold",["warm","boiling","sunny"]),
 ("mcq","A synonym for \"happy\" is:","cheerful",["grumpy","upset","mad"]),
 ("mcq","The opposite of \"up\" is:","down",["high","above","top"]),
 ("mcq","Which means almost the same as \"big\"?","large",["tiny","small","short"]),
 ("mcq","The opposite of \"open\" is:","closed",["wide","ajar","unlocked"]),
 ("mcq","A synonym for \"smart\" is:","clever",["silly","slow","lazy"]),
 ("mcq","The opposite of \"day\" is:","night",["noon","morning","sunrise"]),
 ("mcq","A synonym for \"quiet\" is:","silent",["loud","noisy","booming"]),
 ("mcq","The opposite of \"start\" is:","stop",["begin","go","open"]),
 ("mcq","A synonym for \"little\" is:","small",["huge","tall","wide"]),
 ("mcq","The opposite of \"happy\" is:","sad",["glad","joyful","merry"]),
 ("mcq","A synonym for \"angry\" is:","mad",["calm","happy","sleepy"]),
 ("fill","Write a one-word OPPOSITE (antonym) of \"cold\". ","hot"),
 ("mcq","Which means almost the same as \"pretty\"?","beautiful",["ugly","plain","dull"]),
 ("mcq","The opposite of \"full\" is:","empty",["packed","stuffed","loaded"]),
 ("mcq","A synonym for \"jump\" is:","leap",["sit","crawl","stand"]),
 ("mcq","The opposite of \"wet\" is:","dry",["soggy","damp","moist"]),
],
}


# ===================================================== TOPIC REGISTRY (grade 3)
# (subject_slug, topic_slug, name, standard_code, teach_text, source)

TOPICS3 = [
 # ---- MATH ----
 ("math","place-value-to-thousands","Place Value to Thousands","3.NBT.A.2",
  "Each digit's value depends on its place: ones, tens, hundreds, thousands. The same digit is worth more the farther left it sits.", g3_place_value),
 ("math","rounding-to-10-and-100","Rounding to 10 and 100","3.NBT.A.1",
  "To round, look at the digit to the right of the place you're rounding to. 5 or more rounds up; less than 5 rounds down.", g3_rounding),
 ("math","add-and-subtract-within-1000","Add & Subtract within 1000","3.NBT.A.2",
  "Line up numbers by place value and add or subtract one column at a time, regrouping when a column is 10 or more.", g3_add_sub),
 ("math","multiplication-facts","Multiplication Facts","3.OA.C.7",
  "Multiplication is fast adding of equal groups. Knowing your facts to 10 x 10 by heart makes bigger math much easier.", g3_mult_facts),
 ("math","division-facts","Division Facts","3.OA.C.7",
  "Division splits a number into equal groups. It is the opposite of multiplication: if 3 x 4 = 12, then 12 / 4 = 3.", g3_division),
 ("math","equal-groups","Equal Groups","3.OA.A.1",
  "When you have several equal groups, multiply the number of groups by how many are in each group to find the total.", g3_equal_groups),
 ("math","unit-fractions","Understanding Fractions","3.NF.A.1",
  "A fraction names equal parts of a whole. The bottom number tells how many equal parts there are; 1/4 means 1 of 4 equal parts.", g3_unit_fractions),
 ("math","comparing-fractions","Comparing Fractions","3.NF.A.3",
  "When fractions have the same bottom number (denominator), the one with the bigger top number (numerator) is greater.", g3_compare_fractions),
 ("math","area-of-rectangles","Area of Rectangles","3.MD.C.7",
  "Area is the space inside a shape, measured in square units. For a rectangle, multiply length by width.", g3_area),
 ("math","perimeter-of-rectangles","Perimeter of Rectangles","3.MD.D.8",
  "Perimeter is the distance all the way around a shape. Add up the lengths of all the sides.", g3_perimeter),
 # ---- SCIENCE ----
 ("science","forces-and-motion","Forces & Motion","3-PS2-1",
  "A force is a push or a pull. Forces can make things start, stop, speed up, slow down, or change direction.", SCIENCE3["forces-and-motion"]),
 ("science","balanced-and-unbalanced-forces","Balanced & Unbalanced Forces","3-PS2-1",
  "Balanced forces are equal and opposite, so motion stays the same. Unbalanced forces change how something moves.", SCIENCE3["balanced-and-unbalanced-forces"]),
 ("science","patterns-of-motion","Patterns of Motion","3-PS2-2",
  "Many motions repeat in patterns, like a swing or a clock. When motion has a pattern, we can predict what comes next.", SCIENCE3["patterns-of-motion"]),
 ("science","magnets-and-forces","Magnets & Forces","3-PS2-3",
  "Magnets pull on iron and can push or pull other magnets without touching. Opposite poles attract; like poles repel.", SCIENCE3["magnets-and-forces"]),
 ("science","life-cycles","Life Cycles","3-LS1-1",
  "Living things are born, grow, reproduce, and die. Different plants and animals go through different life-cycle stages.", SCIENCE3["life-cycles"]),
 ("science","traits-and-inheritance","Traits & Inheritance","3-LS3-1",
  "Offspring inherit traits from their parents, which is why young plants and animals resemble the ones they came from.", SCIENCE3["traits-and-inheritance"]),
 ("science","variation-of-traits","Variation of Traits","3-LS3-2",
  "Individuals of the same kind are not all identical. Some differences are inherited and some are shaped by the environment.", SCIENCE3["variation-of-traits"]),
 ("science","adaptations-and-survival","Adaptations & Survival","3-LS4-3",
  "An adaptation is a body part or behavior that helps a living thing survive in its environment.", SCIENCE3["adaptations-and-survival"]),
 ("science","habitats-and-environment-change","Habitats & Change","3-LS4-4",
  "A habitat gives living things food, water, and shelter. When habitats change, living things must move, adapt, or struggle.", SCIENCE3["habitats-and-environment-change"]),
 ("science","weather-and-climate","Weather & Climate","3-ESS2-1",
  "Weather is the day-to-day state of the air. Climate is the usual weather of a place measured over many years.", SCIENCE3["weather-and-climate"]),
 # ---- READING ----
 ("reading","main-idea","Finding the Main Idea","RI.3.2",
  "The main idea is what a passage is mostly about. Ask yourself the one big thing the author wants you to know.", READING3["main-idea"]),
 ("reading","key-details","Key Details","RI.3.1",
  "Key details are the facts in a text that answer who, what, where, when, why, and how.", READING3["key-details"]),
 ("reading","story-sequence","Sequence of Events","RL.3.2",
  "Sequence is the order things happen. Words like first, next, then, and last help you keep track.", READING3["story-sequence"]),
 ("reading","cause-and-effect","Cause & Effect","RI.3.3",
  "A cause is why something happens; the effect is what happens. Words like because and so connect them.", READING3["cause-and-effect"]),
 ("reading","context-clues","Vocabulary in Context","RI.3.4",
  "Use the words around an unknown word as clues to figure out what it means.", READING3["context-clues"]),
 ("reading","making-predictions","Making Predictions","RL.3.1",
  "A prediction is a smart guess about what will happen next, based on clues in the text.", READING3["making-predictions"]),
 ("reading","character-and-setting","Characters & Setting","RL.3.3",
  "Characters are who a story is about. The setting is where and when the story happens.", READING3["character-and-setting"]),
 ("reading","fact-and-opinion","Fact vs. Opinion","RI.3.8",
  "A fact can be proven true. An opinion tells what someone feels and can't be proven. Words like best signal opinions.", READING3["fact-and-opinion"]),
 ("reading","compare-and-contrast","Compare & Contrast","RL.3.9",
  "Comparing shows how things are alike; contrasting shows how they differ. 'Both' signals alike; 'but' and 'unlike' signal different.", READING3["compare-and-contrast"]),
 ("reading","synonyms-and-antonyms","Synonyms & Antonyms","L.3.5",
  "Synonyms are words that mean almost the same thing. Antonyms mean the opposite.", READING3["synonyms-and-antonyms"]),
 # ---- WRITING (reuses the shared grammar generators) ----
 ("writing","nouns","Nouns","L.3.1",
  "A noun names a person, place, thing, or idea. Common nouns are general; proper nouns name a specific one.", g_nouns),
 ("writing","action-verbs","Action Verbs","L.3.1",
  "A verb shows action. Action verbs tell what the subject does, like run, jump, or think.", g_verbs),
 ("writing","adjectives","Adjectives","L.3.1",
  "An adjective describes a noun, telling what kind, how many, or which one.", g_adjectives),
 ("writing","pronouns","Pronouns","L.3.1",
  "A pronoun takes the place of a noun, like he, she, it, we, or they.", g_pronouns),
 ("writing","subject-verb-agreement","Subject-Verb Agreement","L.3.1",
  "The verb must match the subject. A singular subject usually takes a verb ending in -s.", g_subject_verb),
 ("writing","past-tense-verbs","Past-Tense Verbs","L.3.1",
  "Past-tense verbs tell about something that already happened. Many add -ed; some are irregular.", g_past_tense),
 ("writing","plural-nouns","Plural Nouns","L.3.1",
  "Plurals mean more than one. Add -s or -es, or change y to -ies after a consonant.", g_plurals),
 ("writing","capitalization-proper-nouns","Capitalization","L.3.2",
  "Capitalize the first word of a sentence, the word I, and proper nouns like names, places, days, and months.", g_capitalization),
 ("writing","end-punctuation","End Punctuation","L.3.2",
  "End a telling sentence with a period, a question with a question mark, and an excited sentence with an exclamation point.", g_end_punctuation),
 ("writing","commas-in-a-series","Commas in a Series","L.3.2",
  "When you list three or more things, separate them with commas and put 'and' before the last item.", g_commas_series),
]


if __name__ == "__main__":
    print(emit_curriculum(3, TOPICS3))
