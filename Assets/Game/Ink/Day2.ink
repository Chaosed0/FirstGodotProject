
=== Day_2 ===

~ day_count = 1
~ time = 900

You wake up to your alarm. It is 9AM on Wednesday, the 11th of October. The game you have been working on for three years, Dog with a Sword, is releasing on Friday - in two days.

< Day 2 home stub>
 
 * {CHOICE_COUNT() == 0} [Head out for the office.]
 You put on a jacket and head out the door.
 ~ add_time(100)
 
 -
 
< Day 2 office stub>
 
 It's {get_time()}. You have until {get_time_custom(break_time)} to get as much work done as you can. Yesterday, QA found {addl_bug_count} more bugs. There are {bug_count} bugs left to fix.

 * [Time to crush bugs.]

->->

=== Day_2_Lunch ===

It is {get_time()}. It's time for {time > 1330: a late lunch.|lunch.}

< Day 2 lunch stub >
 
* [Finish up your food.]
 
- It's {get_time()}. You have until {get_time_custom(break_time)}, when you will go home, to get as much work done as you can. There are {bug_count} bugs left to fix.
 
* [Time to crush bugs.]
 
-  ->->
 
=== Day_2_End ===

 It's {get_time()}. Time to head home. You know you could work more, but your company has a no-crunch policy, and it's better if you follow it and stay healthy.

 < Day 2 end stub >

 * [Continue]
 
->->