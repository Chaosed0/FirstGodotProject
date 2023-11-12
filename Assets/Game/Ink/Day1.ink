
=== Day_1 ===

~ day_count = 0
~ time = 900

You wake up to your alarm. It is {get_time()} on Tuesday, the 10th of October. The game you have been working on for three years, Dog with a Sword, is releasing on Friday - in three days.

How are you feeling about the release of Dog with a Sword?

* [You are feeling anxious.]
Naturally, you are feeling anxious about the release. It's going to be the first time the public sees what you're been working on for three years, and while you're looking forward to sharing it with them, you don't know how they'll react.

The anxiousness makes you get out of bed.

* [You are feeling excited.]
You're quite excited to share what you've got with the world. You think the game is in a great shape, and you're confident that the public will receive the game well.

You get out of bed feeling energized and ready to get to work.

-> common_morning ->
-> common_bus_ride ->

-
* [...]

- You arrive at the office, and walk over to your desk.

* [Greet your coworkers.]
You greet your coworkers with a simple "Hello." The engineer who sits next to you says hello. They tell you a funny anecdote about their evening yesterday.
 
    ** [Engage with the anecdote.]
    
    You talk to them for a bit. You enjoy the conversation. It takes about 20 minutes.
    ~ add_time(20)
    
    *** [Take a seat at your desk.]
    
    ** [You have to get to work.]
    
    You politely disengage with the conversation. You have work to do. They look a little put out, but they understand.
    
* [Sit at your desk. You have to get to work.]

You politely disengage with the conversation. You have work to do. They look a little put out, but they understand.

- You pull up your task list for Dog with a Sword. There are {bug_count} bugs left. You'll want to get to as many as you can by the time the game releases.

It's {get_time()}. You have until {get_time_custom(break_time)}, when you take a break for lunch, to get as much work done as you can. There are {bug_count} bugs left to fix.

* [Time to crush bugs.]

->->

=== Day_1_Lunch ===

It is {get_time()}. It's time for {time > 1330: a late lunch.|lunch.}

You and your coworkers gather around the table. The mood is somewhat down, as everyone is nervous about the upcoming launch of Dog with a Sword. Still, everyone's feeling proud of their work, and people are largely optimistic.

A coworker asks how you are feeling. You respond that:

* [You feel extremely nervous about the number of bugs that are still in the project.]
You're still pretty nervous about how many bugs there are. There's {bug_count} on the task tracker right now, and who knows how many waiting to be found by QA. The other engineers agree.

* [You're feeling optimistic about the game's chance of success.]
You know that there's a lot of work to be done yet, but you're feeling relatively optimistic about the game. Hopefully it makes enough sales that the publisher will fund another project.

The founder of your small company is at the table, and he agrees. He talks hard numbers, but simultaneously uplifts the spirits of everyone at the table.

* [You're feeling proud of the work that you've been putting in.]

You feel really good about the work you've been doing. You think folks will be able to see the amount of love put into the game, and they'll appreciate it.

Everyone around the table nods. They're excited for people to finally see the work they've been doing.

- Before everyone wraps up their food, the creative director reminds everyone about the launch party on Thursday, two days from now.

* [Finish up your food.]

- It's {get_time()}. You have until {get_time_custom(break_time)}, when you will go home, to get as much work done as you can. There are {bug_count} bugs left to fix.

* [Time to crush bugs.]
 
->->
 
=== Day_1_End ===

It's {get_time()}. Time to head home. You know you could work more, but your company has a no-crunch policy, and honestly, you're thankful for it. It stops you from giving in to your worse instincts.

You walk to the bus stop. The bus is a little late, so you wait at the stop for a few minutes until it arrives. This is normal; the buses in your city aren't very frequent.

-> common_bus_ride ->

When you get home, you greet your partner with a kiss. They tell you a bit about their day. It sounds like it was stressful.

The two of you prepare dinner. You tell them about your day:

* [There are way too many bugs left in the project.]
    You talk about the {bug_count} bugs still left in the project. How can anyone be proud of releasing the game in this state?
    
    Your partner talks through your fears with you. She doesn't judge or offer opinions, just asks questions to help you sort your feelings out. You feel a little better. You love them a lot.
* [You're worried about how the game will be received.]
    You talk about your worries on how the game will be received. It's really bugging you that you have no idea whether or not the game will sell enough to be successful.
    
    Your partner talks through your fears with you. She doesn't judge or offer opinions, just asks questions to help you sort your feelings out. You feel a little better. You love them a lot.
* [Everyone is excited to get the game out.]
    You talk about the excitement of all the folks in the office. People are happy that the project they've been working on all these years is finally coming out, and you are too.
    
    You can tell your partner is tired from work, but they share in your energy anyway and are excited for you. You love them a lot.
* [Keep it short. You're tired from work.]
    You tell your partner that you'd rather not talk too much about work right now. She understands, and you talk about the dinner you are preparing instead. You love them a lot.
    
- You finish preparing your simple weeknight dinner, and the two of you sit down at the TV to watch something with food.

-> common_watch_show ->

* [Wash up from dinner.]

 - You wash your plates up from dinner. As you're washing up, you remind your partner that they are invited to the release party on Friday. They nod - they'll be there.
 
 What will you do for the rest of the night?
 
-> common_post_dinner ->

You get into bed with your partner. You tell them that you love them, and she does the same back to you. The lights go out, and you fall asleep.

* [Continue]
 
->->