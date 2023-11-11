
=== Day_3 ===

~ day_count = 2
~ time = 900

You wake up to your alarm. It is 9AM on Thursday, the 12th of October. The game you have been working on for three years, Dog with a Sword, is releasing on Friday - in one day.

< Day 3 home stub>

 * {CHOICE_COUNT() == 0} [Head out for the office.]
 You put on a jacket and head out the door.
 ~ add_time(100)
 
 -
 
< Day 3 office stub>
 
 It's {get_time()}. You have until {get_time_custom(break_time)} to get as much work done as you can. Yesterday, QA found {addl_bug_count} more bugs. There are {bug_count} bugs left to fix.
 
 * [Time to crush bugs.]

->->

=== Day_3_Lunch ===

It is {get_time()}. It's time for {time > 1330: a late lunch.|lunch.}

You and your coworkers gather around the table. The mood is somewhat down, as everyone is nervous about the upcoming launch of Dog with a Sword. Still, everyone's feeling proud of their work, and people are largely optimistic.

< Day 3 lunch stub>
 
 * [Finish up your food.]
 
 - It's {get_time()}. You have until {get_time_custom(break_time)}, when you will go home, to get as much work done as you can. There are {bug_count} bugs left to fix.
 
 * [Time to crush bugs.]
 
 ->->
 
=== Launch_Party ===

 It's {get_time()}. It is time to head to the launch party. You should probably head home and get ready first.

 < Day 3 end stub >
 
 At the launch party, the creative director says something about it "kinda weird making games at the end of the world."
 
 * [Yeah, it is.]
 
 - You head home from the party. You kiss your partner goodnight.
 
 * [Tomorrow, the game launches. The culmination of years of effort.]
 
->->