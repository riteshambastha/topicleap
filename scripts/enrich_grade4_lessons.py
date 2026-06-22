#!/usr/bin/env python3
"""
Emit UPDATE SQL that upgrades all Grade 4 lessons to the richer, longer
(swipeable) format. Non-destructive — only touches lessons.steps.

Usage:
    python3 scripts/enrich_grade4_lessons.py > supabase/seed/grade4_lessons_enrich.sql
"""
from generate_seed import emit_lesson_updates, TOPICS

if __name__ == "__main__":
    print(emit_lesson_updates(4, TOPICS))
