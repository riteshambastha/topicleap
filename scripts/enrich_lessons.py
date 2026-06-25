#!/usr/bin/env python3
"""
Emit UPDATE SQL that upgrades a grade's lessons to the richer, longer
(swipeable) format. Non-destructive — only touches lessons.steps.

Usage:
    python3 scripts/enrich_lessons.py <grade>      # grade: 0 (K), 1, 2, 3, 4
"""
import sys

from generate_seed import emit_lesson_updates

grade = int(sys.argv[1]) if len(sys.argv) > 1 else 4

if grade == 0:
    from generate_kindergarten import TOPICS_K as TOPICS
    QPT = 8
elif grade == 1:
    from generate_grade1 import TOPICS1 as TOPICS
    QPT = 20
elif grade == 2:
    from generate_grade2 import TOPICS2 as TOPICS
    QPT = 20
elif grade == 3:
    from generate_grade3 import TOPICS3 as TOPICS
    QPT = 20
elif grade == 4:
    from generate_seed import TOPICS
    QPT = 20
elif grade == 5:
    from generate_grade5 import TOPICS5 as TOPICS
    QPT = 20
elif grade == 6:
    from generate_grade6 import TOPICS6 as TOPICS
    QPT = 20
elif grade == 7:
    from generate_grade7 import TOPICS7 as TOPICS
    QPT = 20
elif grade == 8:
    from generate_grade8 import TOPICS8 as TOPICS
    QPT = 20
else:
    raise SystemExit(f"No topic registry for grade {grade}")

if __name__ == "__main__":
    print(emit_lesson_updates(grade, TOPICS, qpt=QPT))
