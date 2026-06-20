#!/usr/bin/env python3
"""
TopicLeap Grade 1 curriculum seed generator.

Reuses the shared engine. Math is computed (grade-1 numbers), grammar reuses
the shared generators, science + reading are authored to grade-1 standards.
4 subjects x 10 topics x 20 questions, worksheets of 5.

Usage:
    python3 scripts/generate_grade1.py > supabase/seed/grade1_curriculum.sql
"""
import random

from generate_seed import (
    QUESTIONS_PER_TOPIC,
    build_bank,
    emit_curriculum,
    fill,
    mcq,
    g_nouns, g_verbs, g_adjectives, g_pronouns, g_subject_verb,
    g_past_tense, g_plurals, g_capitalization, g_end_punctuation, g_commas_series,
)

NQ = QUESTIONS_PER_TOPIC


# ============================================================ MATH (computed)

def g1_counting(rng):
    qs = []
    for i in range(NQ):
        if i % 2 == 0:
            a = rng.randint(1, 117)
            qs.append(fill(f"What number comes next?  {a}, {a + 1}, ___", a + 2))
        else:
            a = rng.randint(2, 119)
            qs.append(fill(f"What number comes right after {a}?", a + 1))
    return qs


def g1_add20(rng):
    qs, seen = [], set()
    while len(qs) < NQ:
        a = rng.randint(1, 10)
        b = rng.randint(1, 20 - a)
        if (a, b) in seen:
            continue
        seen.add((a, b))
        qs.append(fill(f"Add: {a} + {b} = ?", a + b))
    return qs


def g1_sub20(rng):
    qs, seen = [], set()
    while len(qs) < NQ:
        a = rng.randint(2, 20)
        b = rng.randint(1, a)
        if (a, b) in seen:
            continue
        seen.add((a, b))
        qs.append(fill(f"Subtract: {a} - {b} = ?", a - b))
    return qs


def g1_place_value(rng):
    qs = []
    for i in range(NQ):
        n = rng.randint(11, 99)
        if i % 2 == 0:
            qs.append(fill(f"How many TENS are in the number {n}?", n // 10))
        else:
            qs.append(fill(f"How many ONES are in the number {n}?", n % 10))
    return qs


def g1_compare(rng):
    qs = []
    for _ in range(NQ):
        a = rng.randint(1, 99)
        b = rng.randint(1, 99)
        while b == a:
            b = rng.randint(1, 99)
        bigger = max(a, b)
        qs.append(mcq(f"Which number is bigger: {a} or {b}?", str(bigger),
                      [str(min(a, b)), "They are equal", str(a + b)], rng))
    return qs


def g1_add_tens(rng):
    qs, seen = [], set()
    while len(qs) < NQ:
        a = rng.randint(1, 5) * 10
        b = rng.randint(1, 12 - a // 10) * 10
        if (a, b) in seen:
            continue
        seen.add((a, b))
        qs.append(fill(f"Add the tens: {a} + {b} = ?", a + b))
    return qs


SHAPES = [("circle", "⭕"), ("square", "🟦"), ("triangle", "🔺"),
          ("star", "⭐"), ("heart", "❤️"), ("rectangle", "▬")]


def g1_shapes(rng):
    qs = []
    for _ in range(NQ):
        name, em = rng.choice(SHAPES)
        others = [e for n2, e in SHAPES if e != em]
        qs.append(mcq(f"Which one is a {name}?", em, rng.sample(others, 3), rng))
    return qs


def g1_time(rng):
    qs = []
    for _ in range(NQ):
        h = rng.randint(1, 12)
        correct = f"{h}:00"
        others = [f"{x}:00" for x in range(1, 13) if x != h]
        qs.append(mcq(f"A clock's big hand points to 12 and the little hand "
                      f"points to {h}. What time is it?", correct,
                      rng.sample(others, 3), rng))
    return qs


def g1_between(rng):
    qs = []
    for _ in range(NQ):
        a = rng.randint(1, 117)
        qs.append(fill(f"What number comes between {a} and {a + 2}?", a + 1))
    return qs


def g1_word_problems(rng):
    names = ["Maya", "Leo", "Ava", "Sam", "Mia", "Ben", "Zoe", "Kai"]
    items = ["stickers", "apples", "marbles", "crayons", "blocks", "shells"]
    qs = []
    for i in range(NQ):
        nm = rng.choice(names)
        it = rng.choice(items)
        a = rng.randint(2, 12)
        b = rng.randint(1, 8)
        if i % 2 == 0:
            qs.append(fill(f"{nm} has {a} {it} and gets {b} more. "
                           f"How many {it} now?", a + b))
        else:
            b = rng.randint(1, a)
            qs.append(fill(f"{nm} has {a} {it} and gives away {b}. "
                           f"How many {it} are left?", a - b))
    return qs


# ============================================== SCIENCE (authored, NGSS gr. 1)

SCIENCE1 = {
"light-and-seeing": [
 ("mcq","What do your eyes need to be able to see things?","light",["sound","water","wind"]),
 ("mcq","In a completely dark room with no light, you can:","see nothing",["see everything","see colors only","read a book"]),
 ("mcq","Which gives off light?","the Sun",["a rock","a chair","a sock"]),
 ("mcq","At night we use a lamp or flashlight so we can:","see",["hear","smell","taste"]),
 ("mcq","Which object makes its own light?","a candle",["a spoon","a book","a shoe"]),
 ("mcq","Why can you see the Moon at night?","light bounces off it",["it is on fire","it is a lamp","it makes sound"]),
 ("mcq","A shadow is made when something blocks the:","light",["sound","wind","water"]),
 ("mcq","Which helps you see in a dark cave?","a flashlight",["a pillow","a cup","a sock"]),
 ("mcq","Glass and clear plastic let light:","pass through",["disappear","turn to sound","freeze"]),
 ("mcq","A thick wall blocks light, so behind it is:","dark / shadow",["bright","colorful","loud"]),
 ("mcq","Which is the biggest source of light for Earth?","the Sun",["a candle","a phone","a star far away"]),
 ("mcq","If you close your eyes, you cannot:","see",["hear","smell","feel"]),
 ("mcq","A mirror works by making light:","bounce back",["disappear","get louder","freeze"]),
 ("mcq","Sunglasses help when there is:","too much bright light",["too much sound","too much water","no light"]),
 ("mcq","Which one does NOT give off light?","a rock",["the Sun","a lamp","a candle"]),
 ("fill","Your eyes need ____ to see. (one word)","light"),
 ("mcq","During the day, our main light comes from:","the Sun",["the Moon","stars","streetlights"]),
 ("mcq","A room with the curtains closed and lights off will be:","dark",["bright","sunny","windy"]),
 ("mcq","To read at night you should turn on a:","light",["fan","faucet","radio only"]),
 ("mcq","Light travels in straight lines until it hits something and:","bounces or stops",["turns to water","makes a sound","disappears forever"]),
],
"sound-and-vibration": [
 ("mcq","Sound is made when something:","vibrates (shakes quickly)",["freezes","glows","melts"]),
 ("mcq","When you pluck a guitar string, it makes sound because it:","vibrates",["lights up","gets wet","stops moving"]),
 ("mcq","A drum makes sound when its top:","vibrates after you hit it",["freezes","glows","disappears"]),
 ("mcq","To make a louder sound on a drum, you hit it:","harder",["softer","not at all","with a feather"]),
 ("mcq","Which would make a quiet sound?","a soft whisper",["a loud shout","a banging drum","a fire truck siren"]),
 ("mcq","You hear sounds with your:","ears",["eyes","nose","hands"]),
 ("mcq","Tapping a glass gently makes a sound because the glass:","vibrates",["melts","glows","grows"]),
 ("mcq","Big, strong vibrations make sounds that are:","loud",["quiet","silent","invisible"]),
 ("mcq","A buzzing bee makes sound by moving its wings very:","fast (they vibrate)",["slowly","once","never"]),
 ("mcq","If something is perfectly still and not vibrating, it makes:","no sound",["a loud sound","light","wind"]),
 ("mcq","Humming makes your throat:","vibrate",["freeze","glow","stop"]),
 ("mcq","Which makes a loud sound?","a fire truck siren",["a falling feather","a sleeping cat","a soft pillow"]),
 ("mcq","A rubber band stretched and plucked will:","vibrate and make a sound",["light up","get cold","turn to water"]),
 ("mcq","Sound can travel through the:","air",["empty space with nothing","a shadow","a picture"]),
 ("mcq","Covering your ears makes sounds seem:","quieter",["louder","brighter","colder"]),
 ("fill","Sound is made when something ____ back and forth quickly. (one word)","vibrates"),
 ("mcq","A whistle makes sound when air makes it:","vibrate",["freeze","glow","melt"]),
 ("mcq","Which body part helps you hear?","your ear",["your elbow","your knee","your hair"]),
 ("mcq","Two pots banged together make a:","loud sound",["quiet whisper","bright light","cool breeze"]),
 ("mcq","The faster something vibrates, the higher the:","pitch (how high the sound is)",["color","weight","smell"]),
],
"communicating-with-light-and-sound": [
 ("mcq","People can send a message far away using:","light or sound signals",["only smells","only colors of socks","nothing"]),
 ("mcq","A flashing light on a fire truck is used to:","send a warning signal",["cook food","tell time","water plants"]),
 ("mcq","A loud siren warns people to:","get out of the way",["go to sleep","eat lunch","read"]),
 ("mcq","A ringing school bell tells students it is time to:","change class or line up",["go swimming","take a nap forever","plant a tree"]),
 ("mcq","Sailors and campers can signal far away with a:","bright flashlight",["soft pillow","cup of soup","wet sponge"]),
 ("mcq","A car horn (beep) is a sound used to:","get someone's attention",["clean the car","cool the engine","paint the road"]),
 ("mcq","Traffic lights use colored light to tell drivers to:","stop or go",["sing","sleep","swim"]),
 ("mcq","A lighthouse shines light to:","help boats find their way at night",["cook fish","warm the ocean","make rain"]),
 ("mcq","A whistle from a coach is a sound that means:","start or stop",["lunchtime forever","bedtime","recess only"]),
 ("mcq","You can use patterns of light or sound to:","share information",["create new animals","stop the wind","make gold"]),
 ("mcq","A doorbell uses sound to tell you:","someone is at the door",["it is raining","the food is ready always","to go to bed"]),
 ("mcq","Blinking hazard lights on a car tell others:","there may be a problem",["the car is happy","it is a holiday","to race"]),
 ("mcq","A phone ringing is a sound signal that means:","someone is calling",["it is sunny","time to eat","the TV is on"]),
 ("mcq","Which is a way to signal for help at night?","wave a flashlight",["whisper quietly","close your eyes","hide"]),
 ("mcq","Morse code sends messages using patterns of:","long and short signals",["colors of food","types of rocks","smells"]),
 ("fill","People send messages over a distance using light and ____. (one word)","sound"),
 ("mcq","A green traffic light means:","go",["stop","slow down forever","turn around"]),
 ("mcq","A smoke alarm makes a loud sound to:","warn of danger",["play music","tell jokes","cook"]),
 ("mcq","Waving your arms is a way to signal using:","what people can see",["smell","taste","touch only"]),
 ("mcq","A red traffic light means:","stop",["go fast","honk","sing"]),
],
"plant-parts": [
 ("mcq","Which plant part takes in water from the soil?","roots",["flower","leaf","fruit"]),
 ("mcq","Which plant part makes food using sunlight?","leaves",["roots","stem","seeds"]),
 ("mcq","Which part holds the plant up and carries water?","the stem",["the petals","the seeds","the roots only"]),
 ("mcq","Which plant part often becomes a fruit with seeds?","the flower",["the root","the stem","the leaf"]),
 ("mcq","Which part of a carrot plant do we usually eat?","the root",["the flower","the leaf","the seed"]),
 ("mcq","Most plants need water, air, and ____ to grow.","sunlight",["candy","toys","darkness"]),
 ("mcq","New plants can grow from:","seeds",["rocks","plastic","cups"]),
 ("mcq","Where are a plant's roots usually found?","under the ground",["in the sky","on the flower","in the fruit"]),
 ("mcq","Leaves are often flat and wide to catch lots of:","sunlight",["water only","rocks","wind"]),
 ("mcq","Which is a part of a plant?","a leaf",["a wheel","a button","a battery"]),
 ("mcq","Flowers can be colorful to attract:","bees and butterflies",["cars","rocks","clouds"]),
 ("mcq","If a plant gets no water for a long time, it will:","wilt or dry out",["grow faster","turn into an animal","fly away"]),
 ("mcq","Which part of the apple plant do we eat?","the fruit",["the root","the stem","the leaf"]),
 ("mcq","A seed needs water and warmth to start to:","grow (sprout)",["sleep forever","fly","sing"]),
 ("mcq","The green color in leaves helps them make:","food",["sound","rocks","rain"]),
 ("fill","The plant part that takes in water from the soil is the ____. (one word)","roots"),
 ("mcq","Which of these is NOT a plant part?","a tire",["a leaf","a root","a stem"]),
 ("mcq","Plants make seeds so they can:","grow new plants",["make noise","fly","swim"]),
 ("mcq","The stem of a plant carries water up to the:","leaves",["soil","clouds","rocks"]),
 ("mcq","Sunflowers turn to face the:","Sun",["Moon","ground","wall"]),
],
"animal-parts": [
 ("mcq","Which body part do animals use to see?","eyes",["fins","fur","tail"]),
 ("mcq","An animal uses its ears to:","hear",["taste","see color","smell"]),
 ("mcq","Sharp claws and teeth help an animal to:","catch and eat food",["fly higher","stay warm","see at night"]),
 ("mcq","Fur or feathers help an animal to:","stay warm",["run faster only","taste food","hear"]),
 ("mcq","A fish uses its fins to:","swim",["fly","dig","hear"]),
 ("mcq","A bird uses its wings to:","fly",["dig tunnels","swim deep","chew"]),
 ("mcq","Animals use their legs to:","move and walk or run",["see","hear","smell"]),
 ("mcq","A turtle's hard shell helps to:","protect it",["help it fly","make sound","see better"]),
 ("mcq","An elephant uses its trunk to:","grab food and water",["fly","swim fast","see in the dark"]),
 ("mcq","Which part does a dog use to smell?","its nose",["its tail","its paw","its ear"]),
 ("mcq","Webbed feet help a duck to:","swim",["climb trees","dig","fly higher"]),
 ("mcq","Strong back legs help a kangaroo or frog to:","jump",["swim deep","fly","hear"]),
 ("mcq","Whiskers help a cat to:","feel things around it",["fly","taste","glow"]),
 ("mcq","A giraffe's long neck helps it:","reach high leaves",["swim","dig","hide underground"]),
 ("mcq","Which body part helps a bird build a nest and eat?","its beak",["its gills","its fins","its shell"]),
 ("fill","Animals see with their ____. (one word)","eyes"),
 ("mcq","An animal's tail can help it:","balance or move",["read","cook","talk"]),
 ("mcq","Gills help a fish to:","breathe underwater",["walk on land","fly","dig"]),
 ("mcq","Which animal part is used to chew food?","teeth",["wings","fins","fur"]),
 ("mcq","Big ears help some animals:","hear very well",["swim","glow","fly"]),
],
"animal-parents-and-babies": [
 ("mcq","Baby animals usually look like their:","parents",["food","toys","cars"]),
 ("mcq","A baby dog is called a:","puppy",["calf","chick","kitten"]),
 ("mcq","A baby cat is called a:","kitten",["puppy","cub","foal"]),
 ("mcq","A baby cow is called a:","calf",["puppy","chick","kitten"]),
 ("mcq","A baby chicken is called a:","chick",["puppy","calf","cub"]),
 ("mcq","Many baby animals need their parents for:","food and safety",["homework","money","cars"]),
 ("mcq","A baby frog (tadpole) grows up to be a:","frog",["fish","bird","snake"]),
 ("mcq","A puppy will grow up to be a:","dog",["cat","cow","duck"]),
 ("mcq","Baby birds hatch from:","eggs",["seeds","rocks","cups"]),
 ("mcq","A mother bird brings her babies:","food",["toys","books","shoes"]),
 ("mcq","A baby horse is called a:","foal",["chick","calf","cub"]),
 ("mcq","Kittens drink ____ from their mother when they are very young.","milk",["soda","juice","water only"]),
 ("mcq","Baby animals are usually ____ than their parents.","smaller",["bigger","older","heavier"]),
 ("mcq","A duckling will grow up to be a:","duck",["dog","cat","cow"]),
 ("mcq","A baby sheep is called a:","lamb",["chick","foal","cub"]),
 ("fill","A baby dog is called a ____. (one word)","puppy"),
 ("mcq","Animal parents often build a nest or den to:","keep babies safe",["go on vacation","watch TV","cook"]),
 ("mcq","A caterpillar will change and grow into a:","butterfly",["bird","fish","frog"]),
 ("mcq","Most baby mammals are fed:","milk from their mother",["candy","grass only","rocks"]),
 ("mcq","Because babies look like their parents, you can tell a kitten came from a:","cat",["dog","cow","duck"]),
],
"how-animals-survive": [
 ("mcq","Animals need food, water, air, and ____ to live.","shelter (a safe place)",["toys","homework","money"]),
 ("mcq","A bird builds a nest to:","keep its eggs and babies safe",["fly faster","sing","swim"]),
 ("mcq","Many animals hide or use camouflage to:","stay safe from predators",["glow","fly to space","read"]),
 ("mcq","In winter, some animals grow thicker fur to:","stay warm",["swim faster","fly","sing"]),
 ("mcq","Bees and ants live together in groups to help each other:","survive",["watch TV","play tag","sleep all year"]),
 ("mcq","A turtle hides in its shell when it feels:","scared or in danger",["happy","hungry only","sleepy"]),
 ("mcq","Some birds fly to warmer places in winter. This is called:","migration",["hibernation","camouflage","swimming"]),
 ("mcq","A bear sleeps through much of winter. This is called:","hibernation",["migration","camouflage","flying"]),
 ("mcq","Animals drink ____ to stay alive.","water",["soda","milkshakes","paint"]),
 ("mcq","A rabbit's strong back legs help it:","run away from danger",["fly","swim deep","dig gold"]),
 ("mcq","Which helps an animal find food?","good senses like smell and sight",["wheels","a phone","a backpack"]),
 ("mcq","A mother animal protects its babies from:","danger",["sunshine","fresh air","grass"]),
 ("mcq","Spots and stripes can help an animal:","blend in and hide",["glow","fly","read"]),
 ("mcq","Animals get their energy from:","food",["sleep only","rocks","sunlight directly like plants"]),
 ("mcq","A beaver builds a dam and lodge for:","shelter and safety",["decoration","racing","cooking"]),
 ("fill","A safe place where an animal lives is called its ____ (home). (one word)","shelter"),
 ("mcq","When it is very hot, animals look for:","shade and water",["fire","ice cream","blankets"]),
 ("mcq","A herd of animals stays together to:","stay safer from predators",["get lost","fight always","sleep less"]),
 ("mcq","Sharp eyesight helps a hawk to:","spot food from high up",["stay warm","swim","dig"]),
 ("mcq","Animals that cannot find food and water will:","not survive",["grow wings","turn into plants","live forever"]),
],
"day-and-night-sky": [
 ("mcq","Which do we see in the sky during the DAY?","the Sun",["the Moon","stars","fireworks always"]),
 ("mcq","Which do we usually see in the sky at NIGHT?","the Moon and stars",["the Sun","a rainbow","a kite"]),
 ("mcq","The Sun gives Earth:","light and warmth",["snow","darkness","rain"]),
 ("mcq","Stars look tiny because they are:","very far away",["very small rocks","made of paper","close to us"]),
 ("mcq","Day and night happen in a:","repeating pattern",["random way","one-time event","sound"]),
 ("mcq","When it is daytime, the sky is usually:","bright",["dark","full of stars","green"]),
 ("mcq","When it is nighttime, the sky is usually:","dark",["bright and sunny","green","yellow"]),
 ("mcq","The Moon can look like it changes shape. These are called Moon:","phases",["sounds","colors","sizes of rocks"]),
 ("mcq","Which is the brightest object in our daytime sky?","the Sun",["the Moon","a star far away","a streetlight"]),
 ("mcq","We get day and night because the Earth:","spins (rotates)",["stops moving","grows","melts"]),
 ("mcq","You can see thousands of stars best when the sky is:","dark at night",["bright at noon","cloudy and sunny","green"]),
 ("mcq","The Moon does not make its own light; it reflects light from the:","Sun",["stars","streetlights","Earth"]),
 ("mcq","Which comes out as the Sun goes down?","the Moon and stars",["the Sun again","a rainbow","snow always"]),
 ("mcq","We usually sleep at:","night",["noon","morning","lunchtime"]),
 ("mcq","Which pattern repeats every single day?","day and night",["your birthday","a holiday","a vacation"]),
 ("fill","During the day, our light comes from the ____. (one word)","Sun"),
 ("mcq","A telescope helps us see faraway objects in the sky like:","stars and the Moon",["fish","ants","grass"]),
 ("mcq","Which is true?","The Sun appears in the day; the Moon and stars often appear at night.",["The Sun comes out at night.","Stars shine brightest at noon.","The Moon is only seen at lunchtime."]),
 ("mcq","Clouds in the daytime can block the:","Sun",["Moon at noon","stars at noon","ground"]),
 ("mcq","The Sun seems to 'rise' in the morning and 'set' in the:","evening",["middle of the night","afternoon nap","winter"]),
],
"sun-and-seasons": [
 ("mcq","Which season is usually the coldest?","winter",["summer","spring","fall"]),
 ("mcq","Which season is usually the hottest?","summer",["winter","fall","spring"]),
 ("mcq","In which season do many flowers bloom and trees grow new leaves?","spring",["winter","summer","fall"]),
 ("mcq","In which season do leaves often turn colors and fall?","fall (autumn)",["spring","summer","winter"]),
 ("mcq","In summer there are more hours of:","daylight",["darkness","snow","rain only"]),
 ("mcq","In winter there are fewer hours of:","daylight",["nighttime","wind","clouds"]),
 ("mcq","The Sun helps make the weather warm in:","summer",["winter only","the middle of the night","caves"]),
 ("mcq","Which clothing fits a snowy winter day?","a warm coat",["a swimsuit","sandals","shorts only"]),
 ("mcq","Which clothing fits a hot summer day?","a t-shirt and shorts",["a heavy coat","mittens","a scarf"]),
 ("mcq","The order of the seasons is:","spring, summer, fall, winter",["winter, summer, winter, summer","fall, fall, fall, fall","one season only"]),
 ("mcq","Days feel longer (more sunlight) in:","summer",["winter","midnight","caves"]),
 ("mcq","Which season comes right after winter?","spring",["summer","fall","winter again"]),
 ("mcq","We see more daylight when the Sun is up:","longer",["never","only at night","for one minute"]),
 ("mcq","Building a snowman is something you might do in:","winter",["summer","a hot desert day","a pool"]),
 ("mcq","Swimming outside is most common in:","summer",["winter","a snowstorm","the night only"]),
 ("fill","The coldest season of the year is ____. (one word)","winter"),
 ("mcq","Seasons happen in a pattern that repeats every:","year",["hour","minute","second"]),
 ("mcq","In fall, farmers often:","harvest crops",["plant in the snow","go swimming in ice","do nothing ever"]),
 ("mcq","Which season comes right after summer?","fall",["spring","winter","summer again"]),
 ("mcq","More sunlight and warmth in summer help plants to:","grow",["freeze","stop growing forever","turn to rock"]),
],
"weather-patterns": [
 ("mcq","What is the weather like on a sunny day?","bright and clear",["dark and rainy","snowy","foggy"]),
 ("mcq","Which tool measures how hot or cold it is?","a thermometer",["a ruler","a clock","a spoon"]),
 ("mcq","Rain, snow, and hail all fall from:","clouds",["the ground","trees","rivers"]),
 ("mcq","On a windy day, you might see leaves and flags:","moving",["frozen still","melting","glowing"]),
 ("mcq","Which weather would make you wear a raincoat?","rainy",["sunny","calm","clear"]),
 ("mcq","Snow falls when the weather is very:","cold",["hot","windy only","sunny"]),
 ("mcq","We can look at the sky to help us:","guess the weather",["tell time exactly","do math","cook"]),
 ("mcq","Which is a kind of weather?","stormy",["happy","blue","loud music"]),
 ("mcq","On a hot sunny day, it is a good idea to drink:","water",["hot soup only","nothing","sand"]),
 ("mcq","Dark, heavy clouds often mean it might:","rain",["snow in summer always","be perfectly sunny","get colder forever"]),
 ("mcq","A rainbow sometimes appears after:","rain",["a sunny dry week","a snowstorm","an earthquake"]),
 ("mcq","Which tool shows which way the wind blows?","a wind vane",["a thermometer","a ruler","a scale"]),
 ("mcq","Weather can be different from:","day to day",["never","only once a year","only on the Moon"]),
 ("mcq","Which clothing fits a rainy day?","boots and an umbrella",["sunglasses only","a swimsuit","sandals"]),
 ("mcq","On a foggy day it is hard to:","see far away",["hear","taste","smell"]),
 ("fill","Water that falls from clouds as drops is called ____. (one word)","rain"),
 ("mcq","A very strong storm with thunder and lightning is a:","thunderstorm",["sunny day","light breeze","clear night"]),
 ("mcq","Which is the best clothing for a cold, snowy day?","a coat, hat, and gloves",["shorts and sandals","a swimsuit","a t-shirt only"]),
 ("mcq","We can prepare for the day by checking the:","weather",["dictionary","math book","clock only"]),
 ("mcq","Puddles on the ground usually mean it just:","rained",["snowed in summer","was very dry","was windy only"]),
],
}


# ================================================= READING (authored, grade 1)

READING1 = {
"main-topic": [
 ("mcq","Read: \"My dog can run, jump, and catch a ball.\" This is mostly about:","what my dog can do",["a red ball","a big tree","my school"]),
 ("mcq","Read: \"Bees make honey. They visit many flowers.\" This is mostly about:","bees",["cars","rain","shoes"]),
 ("mcq","Read: \"I like to swim. The water is cool and fun.\" This is mostly about:","swimming",["cooking","reading","sleeping"]),
 ("mcq","Read: \"The sun is hot. It gives us light in the day.\" This is mostly about:","the sun",["the moon","a cat","a hat"]),
 ("mcq","Read: \"We planted seeds. We water them every day.\" This is mostly about:","growing plants",["a car ride","a party","the beach"]),
 ("mcq","Read: \"Cats like to nap. They sleep a lot in the day.\" This is mostly about:","cats sleeping",["dogs running","a big city","a boat"]),
 ("mcq","Read: \"Rain helps plants grow. It fills up rivers too.\" This is mostly about:","how rain helps",["a toy","a song","a shoe"]),
 ("mcq","Read: \"I brush my teeth in the morning and at night.\" This is mostly about:","brushing teeth",["a bike","a kite","a frog"]),
 ("mcq","Read: \"Birds build nests with twigs and grass.\" This is mostly about:","birds making nests",["fish in the sea","a red car","a snowman"]),
 ("mcq","Read: \"At the farm we saw cows, pigs, and hens.\" This is mostly about:","animals at the farm",["a city street","a spaceship","a phone"]),
 ("mcq","Read: \"My mom and I baked cookies. They smell so good.\" This is mostly about:","baking cookies",["riding a bus","a math test","a rainy day"]),
 ("mcq","Read: \"Frogs can hop and swim. They live near ponds.\" This is mostly about:","frogs",["trucks","stars","books"]),
 ("mcq","Read: \"We use a map to find our way.\" This is mostly about:","using a map",["eating lunch","a pet","a song"]),
 ("mcq","Read: \"Apples are sweet and crunchy. I eat one each day.\" This is mostly about:","apples",["soccer","the moon","a chair"]),
 ("mcq","Read: \"The fire truck is red and very loud.\" This is mostly about:","a fire truck",["a quiet library","a soft pillow","a slow turtle"]),
 ("fill","Read: \"Ducks swim in the pond. They like the water.\" This story is mostly about ____. (one word)","ducks"),
 ("mcq","Read: \"In winter it snows. We wear warm coats.\" This is mostly about:","winter",["summer","a beach","a desert"]),
 ("mcq","Read: \"My sister plays the drums. They are loud!\" This is mostly about:","my sister playing drums",["a quiet nap","a fish","a tree"]),
 ("mcq","Read: \"Spiders spin webs to catch bugs.\" This is mostly about:","spiders and webs",["a car wash","a cake","the sky"]),
 ("mcq","Read: \"We go to the park to play and run.\" This is mostly about:","playing at the park",["doing dishes","a long nap","a spelling test"]),
],
"key-details": [
 ("mcq","Read: \"Sam has a blue kite.\" What color is the kite?","blue",["red","green","yellow"]),
 ("mcq","Read: \"The cat sat on the soft mat.\" Where did the cat sit?","on the mat",["on a chair","in a tree","on a bed"]),
 ("mcq","Read: \"We had grapes for snack.\" What did we eat?","grapes",["pizza","soup","cake"]),
 ("mcq","Read: \"Mia ran fast to the bus.\" How did Mia move?","fast",["slowly","backward","by flying"]),
 ("mcq","Read: \"Dad read three books.\" How many books?","three",["one","five","ten"]),
 ("mcq","Read: \"The dog hid under the bed.\" Where did the dog hide?","under the bed",["in a tree","on the roof","in a box"]),
 ("mcq","Read: \"It was rainy, so we stayed inside.\" Why did they stay inside?","it was rainy",["it was sunny","it was night","school was closed"]),
 ("mcq","Read: \"Ben gave two apples to Liz.\" Who got the apples?","Liz",["Ben","Mom","the dog"]),
 ("mcq","Read: \"The frog is green and small.\" What color is the frog?","green",["blue","red","brown"]),
 ("mcq","Read: \"We swim in summer.\" When do they swim?","in summer",["in winter","at midnight","never"]),
 ("mcq","Read: \"Ann planted a sunflower.\" What did Ann plant?","a sunflower",["a tree","a bean","grass"]),
 ("mcq","Read: \"The bus is big and yellow.\" What color is the bus?","yellow",["blue","green","pink"]),
 ("mcq","Read: \"Leo has five red marbles.\" How many marbles?","five",["two","ten","one"]),
 ("mcq","Read: \"The owl sleeps in the day.\" When does the owl sleep?","in the day",["at night","at noon only","never"]),
 ("mcq","Read: \"We saw a star in the dark sky.\" Where was the star?","in the sky",["in the sea","under a rock","in a box"]),
 ("fill","Read: \"Tom's hat is red.\" What color is Tom's hat? (one word)","red"),
 ("mcq","Read: \"The baby drinks milk.\" What does the baby drink?","milk",["juice","soda","tea"]),
 ("mcq","Read: \"We walked to the park.\" Where did they go?","the park",["the store","school","the zoo"]),
 ("mcq","Read: \"Pia has a pet fish named Bo.\" What is the fish's name?","Bo",["Pia","Max","Rex"]),
 ("mcq","Read: \"The cake has six candles.\" How many candles?","six",["three","ten","one"]),
],
"retelling-stories": [
 ("mcq","Read: \"First Ana woke up. Then she ate. Last she went to school.\" What did Ana do FIRST?","woke up",["ate","went to school","slept"]),
 ("mcq","Read: \"The seed grew. Then it had leaves. Last it bloomed.\" What happened LAST?","it bloomed",["the seed grew","it had leaves","it was picked"]),
 ("mcq","Read: \"We packed a bag. Then we drove. Last we played.\" What happened SECOND?","we drove",["we packed","we played","we slept"]),
 ("mcq","Read: \"He woke up, brushed his teeth, then ate.\" What did he do right BEFORE eating?","brushed his teeth",["went to bed","ran outside","read a book"]),
 ("mcq","Read: \"First it rained. Then the sun came out. Last we saw a rainbow.\" What came FIRST?","it rained",["the rainbow","the sun set","the snow"]),
 ("mcq","Read: \"Mia drew a cat, colored it, and hung it up.\" What did Mia do LAST?","hung it up",["drew a cat","colored it","erased it"]),
 ("mcq","Read: \"We mixed, poured, and baked the cake.\" What is the LAST step?","baked the cake",["mixed","poured","ate"]),
 ("mcq","Read: \"The bell rang. The kids lined up. Then they went in.\" What happened FIRST?","the bell rang",["kids went in","kids lined up","class ended"]),
 ("mcq","Read: \"She tied her shoes, then ran outside.\" What did she do BEFORE running?","tied her shoes",["sat down","ate lunch","took a nap"]),
 ("mcq","Read: \"First fill the cup, then drink.\" What do you do first?","fill the cup",["drink","wash it","pour it out"]),
 ("mcq","Read: \"The dog barked, then the cat ran.\" What happened FIRST?","the dog barked",["the cat ran","the bird flew","the sun set"]),
 ("mcq","Read: \"We read the page, turned it, and read more.\" What did we do after reading the page?","turned it",["closed the book","slept","ate"]),
 ("mcq","Read: \"He planted the seed, then watered it.\" What did he do LAST?","watered it",["planted the seed","picked a flower","dug a hole"]),
 ("mcq","Read: \"Sun up, play all day, sun down, sleep.\" What do we do when the sun goes down?","sleep",["play","wake up","eat breakfast"]),
 ("mcq","Read: \"She put on socks, then shoes.\" What did she put on first?","socks",["shoes","a hat","gloves"]),
 ("fill","Read: \"First we eat, then we play.\" What do we do first? (one word)","eat"),
 ("mcq","Read: \"The egg hatched. A chick came out. It grew into a hen.\" What came out of the egg?","a chick",["a hen","a duck","a frog"]),
 ("mcq","Read: \"We climbed up, then slid down.\" What did we do after climbing up?","slid down",["climbed more","went home","ate"]),
 ("mcq","Read: \"He washed the cup, dried it, put it away.\" What is the LAST step?","put it away",["washed it","dried it","filled it"]),
 ("mcq","Read: \"Morning: get up. Night: go to bed.\" What do we do at night?","go to bed",["get up","eat breakfast","go to school"]),
],
"characters": [
 ("mcq","Read: \"Kind Mia helped the lost puppy.\" Who is the character?","Mia",["the rain","a tree","a car"]),
 ("mcq","Read: \"Brave Leo climbed the tall hill.\" What word describes Leo?","brave",["lazy","mean","sleepy"]),
 ("mcq","Read: \"Grumpy Mr. Fox frowned all day.\" How does Mr. Fox feel?","grumpy",["happy","calm","silly"]),
 ("mcq","Read: \"Happy Ana danced and smiled.\" How does Ana feel?","happy",["sad","angry","scared"]),
 ("mcq","Read: \"The puppy named Bo wagged his tail.\" Who is the character?","Bo the puppy",["a tree","the sky","a rock"]),
 ("mcq","Read: \"Shy Sam hid behind his mom.\" What word describes Sam?","shy",["loud","brave","silly"]),
 ("mcq","Read: \"Helpful Liz carried the bags.\" What word describes Liz?","helpful",["lazy","rude","mean"]),
 ("mcq","Read: \"The clever fox found a way out.\" Who is the character?","the fox",["the door","the wall","the road"]),
 ("mcq","Read: \"Sad Tom missed his friend.\" How does Tom feel?","sad",["happy","excited","silly"]),
 ("mcq","Read: \"Curious Zoe asked many questions.\" What word describes Zoe?","curious",["bored","sleepy","mean"]),
 ("mcq","Read: \"The little duck swam after its mom.\" Who is the character?","the little duck",["the pond","a leaf","the sun"]),
 ("mcq","Read: \"Excited Ben jumped when he won.\" How does Ben feel?","excited",["bored","sad","tired"]),
 ("mcq","Read: \"Gentle Grandma hugged the baby.\" What word describes Grandma?","gentle",["rough","mean","loud"]),
 ("mcq","Read: \"Silly Max made everyone laugh.\" What word describes Max?","silly",["serious","angry","quiet"]),
 ("mcq","Read: \"Tired Pia yawned at bedtime.\" How does Pia feel?","tired",["wide awake","angry","hungry"]),
 ("fill","Read: \"Kind Ravi shared his lunch.\" Who shared lunch? (one word)","Ravi"),
 ("mcq","Read: \"The brave knight helped the village.\" Who is the main character?","the knight",["the village","the road","the horse only"]),
 ("mcq","Read: \"Scared Lily ran from the loud noise.\" How does Lily feel?","scared",["calm","happy","bored"]),
 ("mcq","Read: \"Friendly Sam waved to everyone.\" What word describes Sam?","friendly",["mean","shy","angry"]),
 ("mcq","Read: \"The wise old owl gave good advice.\" Who is the character?","the owl",["the tree","the night","the wind"]),
],
"setting": [
 ("mcq","Read: \"At the beach, we built a sandcastle.\" Where does this happen?","at the beach",["in space","at school","in a cave"]),
 ("mcq","Read: \"In the forest, the deer ran by.\" Where does this happen?","in the forest",["in the ocean","in a city","on the moon"]),
 ("mcq","Read: \"It was snowy in the village.\" What is the setting?","a snowy village",["a hot beach","a busy mall","a desert"]),
 ("mcq","Read: \"At school, we read and write.\" Where does this happen?","at school",["at the zoo","on a boat","in space"]),
 ("mcq","Read: \"On the farm, the rooster crowed.\" Where does this happen?","on the farm",["in a city","in the sea","on the moon"]),
 ("mcq","Read: \"In the kitchen, Mom made soup.\" Where does this happen?","in the kitchen",["in the car","at the park","in a boat"]),
 ("mcq","Read: \"Under the sea, a fish swam by.\" Where does this happen?","under the sea",["in the sky","in a cave","on a hill"]),
 ("mcq","Read: \"At night, the stars were bright.\" When does this happen?","at night",["at noon","in the morning","at lunch"]),
 ("mcq","Read: \"In the park, kids played on swings.\" Where does this happen?","in the park",["in a store","at the dentist","in space"]),
 ("mcq","Read: \"On a rainy day, we stayed in.\" What is the setting?","a rainy day",["a sunny beach","a snowy hill","a hot desert"]),
 ("mcq","Read: \"At the zoo, we saw lions.\" Where does this happen?","at the zoo",["at home","on a bus","in a cave"]),
 ("mcq","Read: \"In space, the rocket flew past stars.\" Where does this happen?","in space",["in a pond","on a farm","in a kitchen"]),
 ("mcq","Read: \"At the library, we found books.\" Where does this happen?","at the library",["at the beach","on a boat","in a cave"]),
 ("mcq","Read: \"In the morning, the sun came up.\" When does this happen?","in the morning",["at midnight","at dinner","never"]),
 ("mcq","Read: \"On the mountain, snow fell softly.\" Where does this happen?","on the mountain",["at the beach","in a mall","in a pool"]),
 ("fill","Read: \"At the pond, frogs hopped.\" Where did the frogs hop? At the ____. (one word)","pond"),
 ("mcq","Read: \"In the cozy cabin, it was warm.\" What is the setting?","a cozy cabin",["a cold street","a busy bus","a loud party"]),
 ("mcq","Read: \"At the campsite, we sat by the fire.\" Where does this happen?","at the campsite",["in a classroom","at a store","in space"]),
 ("mcq","Read: \"In summer, we go to the lake.\" When do they go?","in summer",["in winter","at midnight","never"]),
 ("mcq","Read: \"Inside the warm house, we read books.\" Where does this happen?","inside the house",["outside in the snow","on a boat","in a tree"]),
],
"rhyming-words": [
 ("mcq","Which word rhymes with CAT?","hat",["dog","sun","cup"]),
 ("mcq","Which word rhymes with DOG?","log",["cat","pen","bus"]),
 ("mcq","Which word rhymes with SUN?","run",["car","top","cup"]),
 ("mcq","Which word rhymes with BEE?","tree",["book","ball","cup"]),
 ("mcq","Which word rhymes with CAR?","star",["sun","dog","hat"]),
 ("mcq","Which word rhymes with CAKE?","lake",["milk","ball","top"]),
 ("mcq","Which word rhymes with RING?","king",["road","cup","fan"]),
 ("mcq","Which word rhymes with TOP?","mop",["cat","sun","bee"]),
 ("mcq","Which word rhymes with BALL?","tall",["bell","bird","fish"]),
 ("mcq","Which word rhymes with PIG?","wig",["dog","cat","cup"]),
 ("mcq","Which word rhymes with BED?","red",["book","sun","car"]),
 ("mcq","Which word rhymes with FROG?","dog",["fish","bird","cat"]),
 ("mcq","Which word rhymes with HOP?","stop",["run","jump","sit"]),
 ("mcq","Which word rhymes with FAN?","man",["fun","fin","fox"]),
 ("mcq","Which word rhymes with NIGHT?","light",["dark","day","moon"]),
 ("fill","Write a word that rhymes with CAT (hint: you wear it on your head). (one word)","hat"),
 ("mcq","Which word rhymes with SNAIL?","tail",["snake","slow","shell"]),
 ("mcq","Which word rhymes with MOON?","spoon",["star","sun","sky"]),
 ("mcq","Which word rhymes with BOOK?","look",["read","page","word"]),
 ("mcq","Which word rhymes with TRAIN?","rain",["bus","car","road"]),
],
"sight-words": [
 ("mcq","Which word is 'the'?","the",["and","you","see"]),
 ("mcq","Which word is 'and'?","and",["the","go","my"]),
 ("mcq","Which word is 'you'?","you",["is","to","see"]),
 ("mcq","Which word is 'said'?","said",["see","go","my"]),
 ("mcq","Which word is 'have'?","have",["here","this","that"]),
 ("mcq","Which word is 'they'?","they",["then","them","there"]),
 ("mcq","Which word is 'with'?","with",["wish","when","what"]),
 ("mcq","Which word is 'are'?","are",["am","at","an"]),
 ("mcq","Which word is 'for'?","for",["far","from","four"]),
 ("mcq","Which word is 'this'?","this",["that","then","they"]),
 ("mcq","Which word is 'was'?","was",["saw","was not","way"]),
 ("mcq","Which word is 'play'?","play",["pay","plan","place"]),
 ("mcq","Which word is 'like'?","like",["lake","look","lick"]),
 ("mcq","Which word is 'come'?","come",["came","some","cone"]),
 ("mcq","Which word is 'good'?","good",["god","gold","food"]),
 ("fill","Which little word means the opposite of 'stop'? (one word)","go"),
 ("mcq","Which word is 'here'?","here",["hear","her","hare"]),
 ("mcq","Which word is 'little'?","little",["lit","letter","later"]),
 ("mcq","Which word is 'big'?","big",["bag","bug","beg"]),
 ("mcq","Which word is 'help'?","help",["held","heap","hello"]),
],
"opposites": [
 ("mcq","What is the opposite of BIG?","small",["tall","red","fast"]),
 ("mcq","What is the opposite of HOT?","cold",["warm","wet","loud"]),
 ("mcq","What is the opposite of UP?","down",["high","top","over"]),
 ("mcq","What is the opposite of DAY?","night",["noon","sun","sky"]),
 ("mcq","What is the opposite of HAPPY?","sad",["glad","silly","kind"]),
 ("mcq","What is the opposite of FAST?","slow",["quick","tall","big"]),
 ("mcq","What is the opposite of OPEN?","closed",["wide","door","in"]),
 ("mcq","What is the opposite of FULL?","empty",["heavy","big","more"]),
 ("mcq","What is the opposite of OLD?","new",["used","gray","tall"]),
 ("mcq","What is the opposite of WET?","dry",["damp","rainy","cold"]),
 ("mcq","What is the opposite of IN?","out",["on","under","over"]),
 ("mcq","What is the opposite of GO?","stop",["run","start","walk"]),
 ("mcq","What is the opposite of LOUD?","quiet",["noisy","big","fast"]),
 ("mcq","What is the opposite of LIGHT (not heavy)?","heavy",["bright","soft","small"]),
 ("mcq","What is the opposite of YES?","no",["maybe","okay","sure"]),
 ("fill","Write the opposite of UP. (one word)","down"),
 ("mcq","What is the opposite of FRONT?","back",["side","top","middle"]),
 ("mcq","What is the opposite of LEFT?","right",["up","down","over"]),
 ("mcq","What is the opposite of TALL?","short",["high","long","big"]),
 ("mcq","What is the opposite of SOFT?","hard",["fluffy","smooth","light"]),
],
"context-clues": [
 ("mcq","Read: \"The tiny ant was so small I could hardly see it.\" What does \"tiny\" mean?","very small",["very big","very loud","very fast"]),
 ("mcq","Read: \"I was so tired I fell asleep right away.\" What does \"tired\" mean?","sleepy",["happy","hungry","angry"]),
 ("mcq","Read: \"The soup was hot, so I let it cool.\" What does \"hot\" mean here?","very warm",["very cold","very sweet","empty"]),
 ("mcq","Read: \"The huge dog was bigger than me!\" What does \"huge\" mean?","very big",["very small","very quiet","very fast"]),
 ("mcq","Read: \"It was quiet; no one made a sound.\" What does \"quiet\" mean?","no sound",["very loud","very bright","very cold"]),
 ("mcq","Read: \"The happy baby giggled and smiled.\" What does \"happy\" mean?","glad",["sad","angry","sleepy"]),
 ("mcq","Read: \"The glass was empty, so I filled it.\" What does \"empty\" mean?","nothing inside",["full","heavy","broken"]),
 ("mcq","Read: \"The race car was fast and zoomed by.\" What does \"fast\" mean?","quick",["slow","still","late"]),
 ("mcq","Read: \"The ice was cold on my hand.\" What does \"cold\" mean?","not warm",["hot","sweet","loud"]),
 ("mcq","Read: \"The bright sun made me squint.\" What does \"bright\" mean?","full of light",["dark","wet","heavy"]),
 ("mcq","Read: \"The kitten was soft and fluffy.\" What does \"soft\" mean?","not hard",["rough","loud","cold"]),
 ("mcq","Read: \"I was hungry, so I had a snack.\" What does \"hungry\" mean?","wanting food",["full","tired","happy"]),
 ("mcq","Read: \"The old shoes had holes in them.\" What does \"old\" mean?","not new",["clean","fast","red"]),
 ("mcq","Read: \"The wet towel dripped water.\" What does \"wet\" mean?","not dry",["dry","warm","red"]),
 ("mcq","Read: \"He spoke in a loud voice across the room.\" What does \"loud\" mean?","easy to hear",["quiet","soft","sweet"]),
 ("fill","Read: \"The room was dark, so I turned on a light.\" What does \"dark\" mean? Not full of ____. (one word)","light"),
 ("mcq","Read: \"The heavy box was hard to lift.\" What does \"heavy\" mean?","weighs a lot",["weighs little","is empty","is small"]),
 ("mcq","Read: \"She was sad and began to cry.\" What does \"sad\" mean?","not happy",["happy","fast","tall"]),
 ("mcq","Read: \"The new toy was shiny and clean.\" What does \"new\" mean?","not old",["broken","used","dirty"]),
 ("mcq","Read: \"The slow turtle took a long time.\" What does \"slow\" mean?","not fast",["quick","loud","tall"]),
],
"cause-and-effect": [
 ("mcq","Read: \"It rained, so we went inside.\" Why did they go inside?","because it rained",["it was sunny","they were tired","it was lunch"]),
 ("mcq","Read: \"Sam dropped the cup, so it broke.\" What happened to the cup?","it broke",["it floated","it grew","nothing"]),
 ("mcq","Read: \"The dog was hungry, so it barked at its bowl.\" Why did the dog bark?","it was hungry",["it was full","it was sleepy","it was cold"]),
 ("mcq","Read: \"She watered the plant, so it grew.\" Why did the plant grow?","she watered it",["it was dark","it was cold","nobody touched it"]),
 ("mcq","Read: \"The ice got hot, so it melted.\" Why did the ice melt?","it got hot",["it got cold","it was night","it was tiny"]),
 ("mcq","Read: \"Ben was sleepy, so he went to bed.\" Why did Ben go to bed?","he was sleepy",["he was hungry","he was happy","it was morning"]),
 ("mcq","Read: \"The wind blew, so the kite flew high.\" Why did the kite fly high?","the wind blew",["it was heavy","it rained","it was dark"]),
 ("mcq","Read: \"It was cold, so she wore a coat.\" Why did she wear a coat?","it was cold",["it was hot","it was sunny","it was loud"]),
 ("mcq","Read: \"He forgot his umbrella, so he got wet.\" Why did he get wet?","he forgot his umbrella",["he stayed dry","he ran fast","it was sunny"]),
 ("mcq","Read: \"The baby was tired, so she cried.\" Why did the baby cry?","she was tired",["she was happy","she ate","she ran"]),
 ("mcq","Read: \"We planted seeds, so flowers grew.\" What grew?","flowers",["rocks","cars","cups"]),
 ("mcq","Read: \"The light turned green, so the cars went.\" Why did the cars go?","the light turned green",["it was red","it was night","it rained"]),
 ("mcq","Read: \"It snowed, so school was closed.\" Why was school closed?","it snowed",["it was sunny","it was summer","it was Friday"]),
 ("mcq","Read: \"He studied, so he did well.\" Why did he do well?","he studied",["he was late","he slept","he guessed"]),
 ("mcq","Read: \"The pot was hot, so she used a glove.\" Why did she use a glove?","the pot was hot",["the pot was cold","it was empty","it was new"]),
 ("fill","Read: \"It rained, so the ground got ____.\" What did the ground get? (one word)","wet"),
 ("mcq","Read: \"The music was loud, so he covered his ears.\" Why did he cover his ears?","the music was loud",["it was quiet","it was soft","it was off"]),
 ("mcq","Read: \"The sun came out, so the snow melted.\" Why did the snow melt?","the sun came out",["it got colder","it was night","it was windy"]),
 ("mcq","Read: \"She was thirsty, so she drank water.\" Why did she drink water?","she was thirsty",["she was full","she was sleepy","she was cold"]),
 ("mcq","Read: \"The ball rolled away, so the dog chased it.\" Why did the dog chase the ball?","the ball rolled away",["the ball stopped","the dog slept","it was night"]),
],
}


# ===================================================== TOPIC REGISTRY (grade 1)

TOPICS1 = [
 # ---- MATH ----
 ("math","counting-to-120","Counting to 120","1.NBT.A.1",
  "Count forward and find what number comes next, all the way to 120.", g1_counting),
 ("math","addition-within-20","Addition within 20","1.OA.C.6",
  "Add two numbers that add up to 20 or less. Count on to find the total.", g1_add20),
 ("math","subtraction-within-20","Subtraction within 20","1.OA.C.6",
  "Take away to find how many are left, with numbers up to 20.", g1_sub20),
 ("math","tens-and-ones","Tens & Ones","1.NBT.B.2",
  "A two-digit number is made of tens and ones. In 34 there are 3 tens and 4 ones.", g1_place_value),
 ("math","comparing-numbers","Comparing Numbers","1.NBT.B.3",
  "Compare two numbers to tell which one is bigger (greater) or smaller (less).", g1_compare),
 ("math","adding-tens","Adding Tens","1.NBT.C.4",
  "Add whole tens together, like 30 + 40, by counting the tens.", g1_add_tens),
 ("math","shapes","Shapes","1.G.A.1",
  "Learn the names of shapes like circle, square, triangle, and rectangle.", g1_shapes),
 ("math","time-to-the-hour","Telling Time (Hour)","1.MD.B.3",
  "When the big hand points to 12 and the little hand points to a number, it is that o'clock.", g1_time),
 ("math","number-order","Number Order","1.NBT.A.1",
  "Numbers come in order. Find the number that comes between two others.", g1_between),
 ("math","word-problems","Word Problems","1.OA.A.1",
  "Read a short story and add or subtract to solve the problem.", g1_word_problems),
 # ---- SCIENCE ----
 ("science","light-and-seeing","Light & Seeing","1-PS4-2",
  "We need light to see. The Sun, lamps, and flashlights give off light.", SCIENCE1["light-and-seeing"]),
 ("science","sound-and-vibration","Sound & Vibration","1-PS4-1",
  "Sound is made when something vibrates (shakes quickly), and we hear it with our ears.", SCIENCE1["sound-and-vibration"]),
 ("science","communicating-with-light-and-sound","Signals: Light & Sound","1-PS4-4",
  "People use light and sound, like sirens and flashing lights, to send messages far away.", SCIENCE1["communicating-with-light-and-sound"]),
 ("science","plant-parts","Plant Parts","1-LS1-1",
  "Plants have roots, a stem, leaves, and flowers, and each part has a special job.", SCIENCE1["plant-parts"]),
 ("science","animal-parts","Animal Body Parts","1-LS1-1",
  "Animals have body parts like eyes, ears, legs, and wings that help them live.", SCIENCE1["animal-parts"]),
 ("science","animal-parents-and-babies","Parents & Babies","1-LS3-1",
  "Baby animals look a lot like their parents and need them for food and safety.", SCIENCE1["animal-parents-and-babies"]),
 ("science","how-animals-survive","How Animals Survive","1-LS1-2",
  "Animals need food, water, air, and shelter, and they have ways to stay safe.", SCIENCE1["how-animals-survive"]),
 ("science","day-and-night-sky","Day & Night Sky","1-ESS1-1",
  "In the day we see the Sun; at night we see the Moon and stars, in a daily pattern.", SCIENCE1["day-and-night-sky"]),
 ("science","sun-and-seasons","Sun & Seasons","1-ESS1-2",
  "The seasons change in a pattern, with more daylight in summer and less in winter.", SCIENCE1["sun-and-seasons"]),
 ("science","weather-patterns","Weather","K-ESS2-1",
  "Weather can be sunny, rainy, snowy, windy, or stormy, and it can change day to day.", SCIENCE1["weather-patterns"]),
 # ---- READING ----
 ("reading","main-topic","Main Topic","RI.1.2",
  "The main topic is what a story or text is mostly about.", READING1["main-topic"]),
 ("reading","key-details","Key Details","RI.1.1",
  "Key details are the small facts in a text that answer who, what, and where.", READING1["key-details"]),
 ("reading","retelling-stories","Retelling & Order","RL.1.2",
  "Retelling means saying what happened first, next, and last, in order.", READING1["retelling-stories"]),
 ("reading","characters","Characters","RL.1.3",
  "Characters are the people or animals a story is about.", READING1["characters"]),
 ("reading","setting","Setting","RL.1.3",
  "The setting is where and when a story takes place.", READING1["setting"]),
 ("reading","rhyming-words","Rhyming Words","RF.1.2",
  "Rhyming words sound the same at the end, like cat and hat.", READING1["rhyming-words"]),
 ("reading","sight-words","Sight Words","RF.1.3",
  "Sight words are common words we learn to read quickly, like the and you.", READING1["sight-words"]),
 ("reading","opposites","Opposites","L.1.5",
  "Opposites are words that mean very different things, like big and small.", READING1["opposites"]),
 ("reading","context-clues","Word Meaning","RI.1.4",
  "Use the other words in a sentence to figure out what a word means.", READING1["context-clues"]),
 ("reading","cause-and-effect","Cause & Effect","RI.1.3",
  "A cause is why something happens; the effect is what happens.", READING1["cause-and-effect"]),
 # ---- WRITING (reuses the shared grammar generators) ----
 ("writing","nouns","Nouns","L.1.1",
  "A noun names a person, place, or thing.", g_nouns),
 ("writing","action-verbs","Action Verbs","L.1.1",
  "A verb is an action word that tells what someone does.", g_verbs),
 ("writing","adjectives","Adjectives","L.1.1",
  "An adjective describes a noun, like big, red, or soft.", g_adjectives),
 ("writing","pronouns","Pronouns","L.1.1",
  "A pronoun takes the place of a noun, like he, she, it, or they.", g_pronouns),
 ("writing","subject-verb-agreement","Matching Verbs","L.1.1",
  "The verb must match the subject, like 'The dog runs.'", g_subject_verb),
 ("writing","past-tense-verbs","Past-Tense Verbs","L.1.1",
  "Past-tense verbs tell about something that already happened.", g_past_tense),
 ("writing","plural-nouns","Plural Nouns","L.1.1",
  "Plurals mean more than one. Add -s or -es to most nouns.", g_plurals),
 ("writing","capitalization","Capital Letters","L.1.2",
  "Start sentences and names with a capital (big) letter.", g_capitalization),
 ("writing","end-punctuation","End Marks","L.1.2",
  "End a sentence with a period, a question mark, or an exclamation point.", g_end_punctuation),
 ("writing","commas-in-a-series","Commas in a List","L.1.2",
  "Use commas to separate three or more things in a list.", g_commas_series),
]


if __name__ == "__main__":
    print(emit_curriculum(1, TOPICS1))
