#!/usr/bin/env python3
"""
TopicLeap Kindergarten (grade 0) curriculum seed generator.

Picture-based, multiple-choice only (kids can't read/type yet — questions use
emoji and are meant to be read aloud with the in-app audio button). Subjects:
Math, Reading, Science, Letters & Writing. 6 topics/subject, 8 questions/topic,
worksheets of 4.

Usage:
    python3 scripts/generate_kindergarten.py > supabase/seed/kindergarten_curriculum.sql
"""
import random
import string

from generate_seed import mcq, emit_curriculum

NQ = 8
UPPER = list(string.ascii_uppercase)
LOWER = list(string.ascii_lowercase)
PICS = ["🍎", "🍌", "⭐", "🐶", "🚗", "🌸", "🐟", "🍪", "🎈", "🐢"]


def nums_distract(n, lo, hi, rng):
    pool = [x for x in range(lo, hi + 1) if x != n]
    return [str(x) for x in rng.sample(pool, 3)]


# ============================================================ MATH (computed)

def k_counting(rng):
    qs = []
    for _ in range(NQ):
        n = rng.randint(1, 10)
        e = rng.choice(PICS)
        qs.append(mcq(f"How many do you see?  {e * n}", str(n),
                      nums_distract(n, 1, 10, rng), rng))
    return qs


def k_number_id(rng):
    qs = []
    for _ in range(NQ):
        n = rng.randint(0, 10)
        qs.append(mcq(f"Which one is the number {n}?", str(n),
                      nums_distract(n, 0, 10, rng), rng))
    return qs


SHAPES = [("circle", "⭕"), ("square", "🟦"), ("triangle", "🔺"),
          ("star", "⭐"), ("heart", "❤️"), ("diamond", "🔶")]


def k_shapes(rng):
    qs = []
    for _ in range(NQ):
        name, em = rng.choice(SHAPES)
        others = [e for _, e in SHAPES if e != em]
        qs.append(mcq(f"Which one is a {name}?", em, rng.sample(others, 3), rng))
    return qs


def k_most(rng):
    qs = []
    for _ in range(NQ):
        e = rng.choice(PICS)
        counts = rng.sample(range(1, 7), 4)
        mx = max(counts)
        ds = [e * c for c in counts if c != mx][:3]
        qs.append(mcq("Which group has the MOST?", e * mx, ds, rng))
    return qs


def k_add(rng):
    qs = []
    for _ in range(NQ):
        a = rng.randint(1, 4)
        b = rng.randint(1, 5 - a)
        s = a + b
        e = rng.choice(["🟡", "🔴", "🟢", "🔵"])
        qs.append(mcq(f"Add them up:  {e * a} + {e * b} = ?", str(s),
                      nums_distract(s, 0, 9, rng), rng))
    return qs


def k_pattern(rng):
    pairs = [("🔴", "🔵"), ("⭐", "🌙"), ("🍎", "🍌"), ("🐶", "🐱"), ("🔺", "🟦")]
    extras = ["⭐", "🌙", "🍎", "🍌", "🐱", "🐶", "🟦", "🔺", "🔴", "🔵"]
    qs = []
    for _ in range(NQ):
        a, b = rng.choice(pairs)
        reps = rng.choice([2, 3])
        seq = (a + b) * reps  # ends with b, so the next item is a
        pool = [x for x in extras if x not in (a, b)]
        rng.shuffle(pool)
        distract = [b] + pool[:2]
        qs.append(mcq(f"What comes next?  {seq} ___", a, distract, rng))
    return qs


# ========================================================= LETTERS (computed)

def k_upper(rng):
    qs = []
    for _ in range(NQ):
        L = rng.choice(UPPER)
        qs.append(mcq(f"Tap the big (uppercase) letter {L}.", L,
                      rng.sample([x for x in UPPER if x != L], 3), rng))
    return qs


def k_lower(rng):
    qs = []
    for _ in range(NQ):
        i = rng.randint(0, 25)
        qs.append(mcq(f"Tap the small (lowercase) letter {LOWER[i]}.", LOWER[i],
                      rng.sample([x for x in LOWER if x != LOWER[i]], 3), rng))
    return qs


def k_match(rng):
    qs = []
    for _ in range(NQ):
        i = rng.randint(0, 25)
        qs.append(mcq(f"Which small letter matches {UPPER[i]}?", LOWER[i],
                      rng.sample([x for x in LOWER if x != LOWER[i]], 3), rng))
    return qs


def k_after(rng):
    qs = []
    for _ in range(NQ):
        i = rng.randint(0, 24)
        nxt = UPPER[i + 1]
        ds = rng.sample([x for x in UPPER if x not in (nxt, UPPER[i])], 3)
        qs.append(mcq(f"Which letter comes right after {UPPER[i]}?", nxt, ds, rng))
    return qs


VOWELS = list("AEIOU")
CONS = [c for c in UPPER if c not in VOWELS]


def k_vowels(rng):
    qs = []
    for _ in range(NQ):
        v = rng.choice(VOWELS)
        qs.append(mcq("Which one is a vowel?", v, rng.sample(CONS, 3), rng))
    return qs


# ====================================================== AUTHORED PICTURE BANKS

BEGINNING_LETTER = [
 ("mcq","Which letter does this word start with?  🍎 (apple)","A",["B","C","D"]),
 ("mcq","Which letter does this word start with?  🐝 (bee)","B",["A","C","S"]),
 ("mcq","Which letter does this word start with?  🐱 (cat)","C",["A","B","D"]),
 ("mcq","Which letter does this word start with?  🐶 (dog)","D",["B","C","P"]),
 ("mcq","Which letter does this word start with?  🥚 (egg)","E",["A","I","O"]),
 ("mcq","Which letter does this word start with?  🐟 (fish)","F",["S","V","T"]),
 ("mcq","Which letter does this word start with?  🍇 (grapes)","G",["J","C","Q"]),
 ("mcq","Which letter does this word start with?  🎩 (hat)","H",["A","N","M"]),
]

COLORS = [
 ("mcq","Which one is RED?","🟥",["🟦","🟩","🟨"]),
 ("mcq","Which one is BLUE?","🟦",["🟥","🟩","🟪"]),
 ("mcq","Which one is GREEN?","🟩",["🟦","🟨","🟥"]),
 ("mcq","Which one is YELLOW?","🟨",["🟧","🟩","🟦"]),
 ("mcq","Which one is ORANGE?","🟧",["🟨","🟥","🟪"]),
 ("mcq","Which one is PURPLE?","🟪",["🟦","🟥","🟩"]),
 ("mcq","Which one is BLACK?","⬛",["⬜","🟥","🟨"]),
 ("mcq","Which one is WHITE?","⬜",["⬛","🟦","🟩"]),
]

RHYMING = [
 ("mcq","Which word rhymes with CAT?","hat",["dog","sun","cup"]),
 ("mcq","Which word rhymes with DOG?","log",["cat","pen","bus"]),
 ("mcq","Which word rhymes with SUN?","bun",["car","top","cup"]),
 ("mcq","Which word rhymes with BEE?","tree",["book","ball","cup"]),
 ("mcq","Which word rhymes with CAR?","star",["sun","dog","hat"]),
 ("mcq","Which word rhymes with CAKE?","lake",["milk","ball","top"]),
 ("mcq","Which word rhymes with RING?","king",["road","cup","fan"]),
 ("mcq","Which word rhymes with TOP?","mop",["cat","sun","bee"]),
]

SAME_DIFFERENT = [
 ("mcq","Which one is DIFFERENT?","🐱",["🐶","🐶","🐶"]),
 ("mcq","Which one is DIFFERENT?","⭐",["🍎","🍎","🍎"]),
 ("mcq","Which one is DIFFERENT?","🔵",["🔴","🔴","🔴"]),
 ("mcq","Which one is DIFFERENT?","🐟",["🌸","🌸","🌸"]),
 ("mcq","Which one is DIFFERENT?","🚗",["🐶","🐶","🐶"]),
 ("mcq","Which one is DIFFERENT?","🍌",["⭐","⭐","⭐"]),
 ("mcq","Which one is DIFFERENT?","🟦",["🔺","🔺","🔺"]),
 ("mcq","Which one is DIFFERENT?","🐢",["🐝","🐝","🐝"]),
]

BEGINNING_SOUNDS = [
 ("mcq","Which picture starts with the B sound?","🐝",["🍎","🐱","☀️"]),
 ("mcq","Which picture starts with the S sound?","☀️",["🐶","🍎","🐝"]),
 ("mcq","Which picture starts with the C sound?","🐱",["🐟","🍇","🎩"]),
 ("mcq","Which picture starts with the D sound?","🐶",["🐱","🍎","🐝"]),
 ("mcq","Which picture starts with the F sound?","🐟",["🐱","🍇","🎩"]),
 ("mcq","Which picture starts with the A sound?","🍎",["🐶","🐝","☀️"]),
 ("mcq","Which picture starts with the G sound?","🍇",["🐱","🎩","🐟"]),
 ("mcq","Which picture starts with the H sound?","🎩",["🍎","🐝","🐟"]),
]

SIGHT_WORDS = [
 ("mcq","Which word is 'the'?","the",["and","you","see"]),
 ("mcq","Which word is 'and'?","and",["the","go","my"]),
 ("mcq","Which word is 'you'?","you",["is","to","see"]),
 ("mcq","Which word is 'see'?","see",["the","my","go"]),
 ("mcq","Which word is 'go'?","go",["is","you","and"]),
 ("mcq","Which word is 'my'?","my",["to","the","see"]),
 ("mcq","Which word is 'is'?","is",["go","you","and"]),
 ("mcq","Which word is 'to'?","to",["my","see","the"]),
]

OPPOSITES = [
 ("mcq","What is the opposite of BIG?","small",["tall","red","fast"]),
 ("mcq","What is the opposite of HOT?","cold",["warm","wet","loud"]),
 ("mcq","What is the opposite of UP?","down",["high","top","over"]),
 ("mcq","What is the opposite of DAY?","night",["noon","sun","sky"]),
 ("mcq","What is the opposite of HAPPY?","sad",["glad","silly","kind"]),
 ("mcq","What is the opposite of FAST?","slow",["quick","tall","big"]),
 ("mcq","What is the opposite of OPEN?","closed",["wide","door","in"]),
 ("mcq","What is the opposite of FULL?","empty",["heavy","big","more"]),
]

LIVING_NONLIVING = [
 ("mcq","Which one is ALIVE (living)?","🌳",["🪨","🚗","⚽"]),
 ("mcq","Which one is ALIVE (living)?","🐶",["🧱","🥄","📚"]),
 ("mcq","Which one is ALIVE (living)?","🌸",["🔑","🪑","🚙"]),
 ("mcq","Which one is ALIVE (living)?","🐟",["⌚","✏️","🥤"]),
 ("mcq","Which one is ALIVE (living)?","🐦",["📺","🧦","🍽️"]),
 ("mcq","Which one is ALIVE (living)?","🦋",["🚲","🔨","🧴"]),
 ("mcq","Which one is NOT living?","🪨",["🐱","🌷","🐢"]),
 ("mcq","Which one is NOT living?","🚗",["🌳","🐶","🐝"]),
]

FIVE_SENSES = [
 ("mcq","Which part do you SEE with?","👁️",["👂","👃","👅"]),
 ("mcq","Which part do you HEAR with?","👂",["👁️","👃","✋"]),
 ("mcq","Which part do you SMELL with?","👃",["👁️","👂","👅"]),
 ("mcq","Which part do you TASTE with?","👅",["👃","👂","👁️"]),
 ("mcq","Which part do you TOUCH and feel with?","✋",["👁️","👂","👃"]),
 ("mcq","You use your eyes to:","see",["hear","smell","taste"]),
 ("mcq","You use your ears to:","hear",["see","taste","touch"]),
 ("mcq","You use your nose to:","smell",["hear","see","taste"]),
]

WEATHER = [
 ("mcq","Which one shows RAIN?","🌧️",["☀️","❄️","🌈"]),
 ("mcq","Which one shows SUN?","☀️",["🌧️","❄️","☁️"]),
 ("mcq","Which one shows SNOW?","❄️",["☀️","🌈","🌧️"]),
 ("mcq","Which one shows a RAINBOW?","🌈",["☁️","❄️","☀️"]),
 ("mcq","Which one shows CLOUDS?","☁️",["☀️","🌈","❄️"]),
 ("mcq","Which one shows a STORM?","⛈️",["☀️","🌈","❄️"]),
 ("mcq","What should you wear in the RAIN?","a raincoat",["sunglasses","a swimsuit","sandals"]),
 ("mcq","What do you see on a SUNNY day?","☀️",["❄️","🌧️","⛈️"]),
]

ANIMAL_SOUNDS = [
 ("mcq","Which animal says 'moo'?","🐄",["🐶","🐱","🐔"]),
 ("mcq","Which animal says 'woof'?","🐶",["🐄","🐱","🦆"]),
 ("mcq","Which animal says 'meow'?","🐱",["🐶","🐄","🐔"]),
 ("mcq","Which animal says 'quack'?","🦆",["🐶","🐱","🐄"]),
 ("mcq","Which animal says 'baa'?","🐑",["🐷","🐔","🐶"]),
 ("mcq","Which animal says 'oink'?","🐷",["🐑","🐄","🐱"]),
 ("mcq","Which animal says 'cock-a-doodle-doo'?","🐔",["🐶","🐄","🦆"]),
 ("mcq","Which animal lives in the water?","🐟",["🐶","🐱","🐔"]),
]

PLANTS_NEED = [
 ("mcq","What do plants need to grow?","water and sunlight",["candy","toys","shoes"]),
 ("mcq","Which helps a plant grow?","sunlight",["a hat","a toy car","a shoe"]),
 ("mcq","Plants drink:","water",["soda","milkshakes","juice boxes"]),
 ("mcq","Where do most plants grow?","in the soil (dirt)",["in the closet","in a box of toys","in the fridge"]),
 ("mcq","What part of a plant grows under the ground?","roots",["flowers","leaves","fruit"]),
 ("mcq","A plant in a dark room with no light will:","not grow well",["grow super fast","turn into an animal","fly away"]),
 ("mcq","Which one is a plant?","🌻",["🐶","🚗","🪨"]),
 ("mcq","Plants need air and:","water",["candy","plastic","toys"]),
]

DAY_NIGHT = [
 ("mcq","Which do you see at NIGHT?","🌙",["☀️","🌈","🌻"]),
 ("mcq","Which do you see in the DAY sky?","☀️",["🌙","⭐","🦉"]),
 ("mcq","Which comes out at night?","⭐",["🌞","🌻","🐝"]),
 ("mcq","When is it dark outside?","at night",["at noon","in the morning","at lunchtime"]),
 ("mcq","When is it bright outside?","in the day",["at midnight","at night","in dreams"]),
 ("mcq","Which animal is awake at night?","🦉",["🐔","🐝","🦋"]),
 ("mcq","We usually SLEEP during the:","night",["morning","afternoon","lunchtime"]),
 ("mcq","The Sun gives us:","light and warmth",["snow","rain","darkness"]),
]


# ===================================================== TOPIC REGISTRY (K)

SUBJECTS_K = [
    ("math", "Math", 0),
    ("science", "Science", 1),
    ("reading", "Reading Comprehension", 2),
    ("letters", "Letters & Writing", 4),
]

TOPICS_K = [
 # ---- MATH ----
 ("math","counting-to-10","Counting to 10","K.CC.B.5",
  "Count the pictures one by one to find how many there are, all the way up to 10.", k_counting),
 ("math","number-recognition","Number Recognition","K.CC.A.3",
  "Learn to spot and name the numbers 0 to 10 when you see them.", k_number_id),
 ("math","shapes-basic","Shapes","K.G.A.2",
  "Learn the names of basic shapes like circle, square, triangle, star, and heart.", k_shapes),
 ("math","more-and-fewer","More & Fewer","K.CC.C.6",
  "Compare groups of things to see which group has more and which has fewer.", k_most),
 ("math","adding-to-5","Adding to 5","K.OA.A.1",
  "Put two small groups together and count them all to add up to 5.", k_add),
 ("math","patterns","Patterns","K.MATH",
  "A pattern repeats over and over. Find what comes next in the pattern.", k_pattern),
 # ---- SCIENCE ----
 ("science","living-and-nonliving","Living & Nonliving","K-LS1",
  "Living things grow, eat, and need water. Nonliving things do not. Tell them apart!", LIVING_NONLIVING),
 ("science","five-senses","The Five Senses","K-LS1-SENSES",
  "We use our eyes, ears, nose, tongue, and hands to see, hear, smell, taste, and touch.", FIVE_SENSES),
 ("science","weather-basics","Weather","K-ESS2-1",
  "Weather can be sunny, rainy, snowy, cloudy, or stormy. Learn what each one looks like.", WEATHER),
 ("science","animals-and-sounds","Animals & Sounds","K-LS1-ANIMALS",
  "Different animals make different sounds and live in different places.", ANIMAL_SOUNDS),
 ("science","what-plants-need","What Plants Need","K-LS1-PLANTS",
  "Plants need water, sunlight, air, and soil to grow big and strong.", PLANTS_NEED),
 ("science","day-and-night","Day & Night","K-ESS1-1",
  "In the day we see the Sun. At night we see the Moon and stars.", DAY_NIGHT),
 # ---- READING ----
 ("reading","colors","Colors","K-COLORS",
  "Learn to name colors like red, blue, green, yellow, and more.", COLORS),
 ("reading","rhyming-words","Rhyming Words","RF.K.2",
  "Rhyming words sound the same at the end, like cat and hat.", RHYMING),
 ("reading","same-and-different","Same & Different","K-SORT",
  "Look closely to find the picture that is different from the others.", SAME_DIFFERENT),
 ("reading","beginning-sounds","Beginning Sounds","RF.K.3",
  "Listen for the first sound in a word, like the B sound at the start of 'bee'.", BEGINNING_SOUNDS),
 ("reading","sight-words","Sight Words","RF.K.3c",
  "Sight words are little words we see a lot, like the, and, you, and see.", SIGHT_WORDS),
 ("reading","opposites","Opposites","L.K.5",
  "Opposites are words that mean very different things, like big and small.", OPPOSITES),
 # ---- LETTERS & WRITING ----
 ("letters","uppercase-letters","Uppercase Letters","RF.K.1d",
  "Uppercase (big) letters are the tall capital letters like A, B, and C.", k_upper),
 ("letters","lowercase-letters","Lowercase Letters","RF.K.1d",
  "Lowercase (small) letters are the little letters like a, b, and c.", k_lower),
 ("letters","match-upper-and-lower","Match Big & Small","RF.K.1d",
  "Every big letter has a matching small letter, like A and a.", k_match),
 ("letters","alphabet-order","Alphabet Order","RF.K.1",
  "The letters of the alphabet go in order: A, B, C, D, and on to Z.", k_after),
 ("letters","vowels","Vowels","RF.K.3",
  "The vowels are A, E, I, O, and U. Every word needs a vowel.", k_vowels),
 ("letters","beginning-letter","First Letters","RF.K.3",
  "Match a picture to the letter its name begins with.", BEGINNING_LETTER),
]


if __name__ == "__main__":
    print(emit_curriculum(0, TOPICS_K, subjects=SUBJECTS_K,
                          worksheet_size=4, qpt=NQ))
