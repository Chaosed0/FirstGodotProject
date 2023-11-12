
=== Day_3 ===

~ day_count = 2
~ time = 900

You wake up to your alarm. It is 9AM on Thursday, the 12th of October. The game you have been working on for three years, Dog with a Sword, is releasing on Friday - in one day.

The energy from this fact makes you bolt straight out of bed.

-> common_morning ->

You sit down on one of the bus' seats. You think about reading or listening to a podcast, but instead, you:

* [Think about Dog with a Sword.]
    You can't really help it. The game comes out tomorrow. You sit there and think about Dog with a Sword. About how you think the reception will be, about whether the company will make enough money to keep going, about what your friends will think about the game.
    
    You know it's a little silly. It's a game about a dog, with a sword. You know there's lots more important stuff happening in the world. And yet, you still can't stop thinking about it.
    
    You stare out the window, a storm in your mind, until the bus stops at your office.
 
 -
 
About half the team usually works from home. However, when you get to the office, almost everyone is at their desks. It seems like the air is charged with creative energy. Folks want to land this game. It's the most important thing in their life right now.

You go straight to your desk and sit down. It's {get_time()}. You have until {get_time_custom(break_time)} to get as much work done as you can. Yesterday, QA found {addl_bug_count} more bugs. There are {bug_count} bugs left to fix.
 
 * [Time to crush bugs.]

->->

=== Day_3_Lunch ===

It is {get_time()}. It's time for {time > 1330: a late lunch.|lunch.}

You and your coworkers gather around the table. The mood is somewhat down, as everyone is nervous about the upcoming launch of Dog with a Sword. Still, everyone's feeling proud of their work, and people are largely optimistic.


< Talk about what folks are wearing to the launch party, tease coworker >


* [Finish up your food.]

- It's {get_time()}. You have until {get_time_custom(break_time)}, to get as much work done as you can. You have to leave a little early to get to the game's launch party on time.

There are {bug_count} bugs left to fix.

* [Time to crush bugs.]

->->
 
=== Launch_Party ===

It's {get_time()}. It is time to head to the launch party.

* [...]


< A choice of who to talk to at the launch party, at the end of talking to everyone Patrick gives a speech and contrast it against the massacre >


At the launch party, the creative director says something about it "kinda weird making games at the end of the world."

* [Yeah, it is.]

- You head home from the party. You kiss your partner goodnight.

* [Tomorrow, the game launches. The culmination of years of effort.]
 
->->