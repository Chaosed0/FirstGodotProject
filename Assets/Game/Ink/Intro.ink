
=== Day_1 ===

You wake up to your alarm. It is 9AM on the 10th of October. The game you have been working on for three years, Dog with a Sword, is releasing in three days.

You feel a deep sense of anxiety at this fact. You get out of bed.

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
 
 -
 
 ...
 
 The office has more people than it usually does. The usual suspects are there, but most of the folks who work from home are here too. You greet your coworkers, then sit down at your desk.
 
 You pull up your task list for Dog with a Sword. There are 50 bugs left. You'll want to get to as many as you can by the time the game releases.
 
 It's {get_time()}. You have until {get_time_custom(1700)} to get as much work done as you can. Release is coming up, after all.
 
 * [Time to crush bugs.]

->->