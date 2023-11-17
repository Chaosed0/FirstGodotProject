INCLUDE Functions.ink
INCLUDE BugGame.ink
INCLUDE Day1.ink
INCLUDE Day2.ink
INCLUDE Day3.ink
INCLUDE GameLaunch.ink
INCLUDE Common.ink

-> Main

=== Main ===
{debug:
 - false: ->FullGame
}

~ SEED_RANDOM(235)

- (top)

 + [Full] -> FullGame ->
 + [Day 1]
    ~ break_time = 1230
    -> Day_1 ->
 + [Day 2]
    ~ break_time = 1700
    -> Day_2 ->
 + [Day 3]
    ~ break_time = 1230
    -> Day_3 ->
 + [Party] -> Launch_Party ->
 + [Launch] -> GameLaunch ->
 + [Bug Game] -> BugGame ->

- -> top


=== FullGame ===

[center][b]Man with a Hammer[/b][/center]

[center]____________[/center]

[center][i]Content warning: This is a piece of interactive fiction about the 2023 Palestinian massacre at the hands of Israel.[/i][/center]

* [Understood.]

- [i]Please play with audio on, if you are able.[/i]

* [Okay. I'm ready to start the game.]

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
-> Day_2_End ->
~ bug_count += addl_bug_count


~ break_time = 1230
-> Day_3 ->
-> BugGame ->
~ break_time = 1500
-> Day_3_Lunch ->
-> BugGame ->
-> Launch_Party ->
-> GameLaunch ->

-> END
