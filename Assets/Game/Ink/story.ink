INCLUDE Functions.ink
INCLUDE BugGame.ink
INCLUDE Day1.ink
INCLUDE Day2.ink
INCLUDE Day3.ink
INCLUDE GameLaunch.ink
INCLUDE Common.ink


~ SEED_RANDOM(235)

- (top)

 + [Full] -> FullGame ->
 + [Day 1] -> Day_1 ->
 + [Day 2] -> Day_2 ->
 + [Day 3] -> Day_3 ->
 + [Party] -> Launch_Party ->
 + [Bug Game] -> BugGame ->

- -> top


=== FullGame ===

~ break_time = 1230
-> Day_1 ->
-> BugGame ->
~ break_time = 1700
-> Day_1_Lunch ->
-> BugGame ->
-> Day_1_End ->
~ bug_count += addl_bug_count


~ break_time = 1700
-> Day_2 ->
-> BugGame ->
-> BugGame ->
-> Day_2_End ->
~ bug_count += addl_bug_count


~ break_time = 1230
-> Day_3 ->
-> BugGame ->
~ break_time = 1600
-> Day_3_Lunch ->
-> BugGame ->
-> Launch_Party ->
-> GameLaunch ->

-> END
