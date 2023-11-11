
=== Day_1 ===

~ day_count = 0
~ time = 900

You wake up to your alarm. It is {get_time()} on Tuesday, the 10th of October. The game you have been working on for three years, Dog with a Sword, is releasing on Friday - in three days.

You feel a deep sense of anxiety at this fact. The anxiety makes you get out of bed.

 - (choices)
 
 * [Kiss your partner.]
 You kiss your partner. She is still sleeping, but she murmurs something.
 -> choices
 
 * [Look at your phone.]
 You look at Twitter. There are lots of tragic videos on your timeline. Unfortunately, today not only marks three days until your release. It also marks three days since the start of the Israeli bombardment on Gaza, the latest episode in the ongoing Palestinian genocide. Twitter is filled with posts from all sorts people denouncing the bombings.
 
    -- (phone)
    ** (retweet_palestine) [Retweet some of the people supporting Palestinians.]
    You retweet a gamedev personality who is quote-tweeting a post in support of Palestine. You feel a little better about the whole thing. It's the least you can do really.
    -> phone
 
     ** {!retweet_palestine} [Ignore the Palestinian posts. You support Israel.]
    This game is not for you.
    -> END
    
    ** [Scroll down, looking for a tweet about Dog with a Sword.]
    You find a tweet from your publisher about Dog with a Sword. It's got a hundred retweets! Promising. You retweet it.
    -> phone
 
    ** [Put your phone away.]
    You put your phone in your pocket. The genocide continues anyway.
    -> choices
 
 * [Brush your teeth.]
 You go and brush your teeth. Hygiene matters.
 -> choices
 
 * [Go eat breakfast.]
 You go and eat breakfast. Need to fuel up for the day.
 -> choices
 
 * {CHOICE_COUNT() == 0} [Head out for the office.]
 You put on a jacket and head out the door.
 ~ add_time(100)
 
 -
 
 ...
 
 The office has more people than it usually does. The usual suspects are there, but most of the folks who work from home are here too.
 
 It's {get_time()}. You have until {get_time_custom(break_time)}, when you will eat lunch, to get as much work done as you can. There are {bug_count} bugs left to fix.
 
 * [Greet your coworkers.]
 You greet your coworkers with a simple "Hello." The engineer next to you says hello. She tells you a funny anecdote about her evening yesterday.
 
    ** [Engage with the anecdote.]
    
    You talk to her for a bit. You enjoy the conversation. It takes about 20 minutes.
    ~ add_time(20)
    
    *** [Take a seat at your desk.]
    
    ** [You have to get to work.]
    
    You politely disengage with the conversation. You have work to do. They look a little put out, but they understand.
    
 * [Sit at your desk. You have to get to work.]
    
 You politely disengage with the conversation. You have work to do. They look a little put out, but they understand.
 
 - You pull up your task list for Dog with a Sword. There are 50 bugs left. You'll want to get to as many as you can by the time the game releases.
 
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
 
 No one talks about the Palestinian genocide.
 
 * [Finish up your food.]
 
 - It's {get_time()}. You have until {get_time_custom(break_time)}, when you will go home, to get as much work done as you can. There are {bug_count} bugs left to fix.
 
 * [Time to crush bugs.]
 
->->
 
=== Day_1_End ===

 It's {get_time()}. Time to head home. You know you could work more, but your company has a no-crunch policy, and it's better if you follow it and stay healthy.

 < Day 1 end stub >
 
 * [Continue]
 
->->