
=== common_bus_ride ===

+ [Sit near the front of the bus.]
You sit down near the front of the bus.
~bus_front++

+ [Sit near the back of the bus.]
You sit down at the back of the bus.
~bus_back++

-

+ [Pull out a book.]
    {You pull a book out that you got at the library the other day. You lose yourself in the book until you get off the bus.|You continue where you left off in the book. It's very engrossing.|You continue where you left off. You're having trouble concentrating this time, but you get through as much as you can.|You continue where you left off. You really like this book.|You continue where you left off. Time passes quickly until you get off the bus.}
+ [Listen to a podcast.]
    {You pull out your earbuds and open up a podcast about an interesting topic. You learn about a new cool topic until you get off the bus.|You listen to the next episode in the podcast. You can feel your brain expanding.|You listen to the next episode in the podcast. You really like the voice of the guest speaker they brought on for this episode.|You listen to the next episode in the podcast. You wonder what it would be like to start a podcast.|You listen to the next episode in the podcast. Time passes quickly until you get off the bus.}
+ [Gaze out the window.]
    You watch the blur outside the window for the duration of the ride. Only you know what went on in your brain.
~ add_time(100)

 - ->->
 
=== common_morning ===

~ temp did_kiss_partner = false
~ temp did_look_phone = false
~ temp did_brush_teeth = false
~ temp did_eat_breakfast = false

~ temp did_retweet_palestine = false
~ temp did_tweet_dogsword = false


- (choices)

+ {!did_kiss_partner} [Kiss your partner.]
{You kiss your partner. They are still sleeping, but they murmur something indistinct.|Your partner has already awoken before you. They are feeding the cat. You interrupt them and give them a big kiss. They laugh in delight.|Your partner is awake, but still in bed scrolling through videos on social media. You kiss them, and they throw their arms about you. "See you at the launch party later tonight," they say. You nod.}
~did_kiss_partner = true
-> choices

+ {!did_look_phone} [Look at your phone.]
You look at Twitter. {There are a lot of tragic videos on your timeline, as, unfortunately, today not only marks three days until your release. It also marks three days since the start of the Israeli bombardment on Gaza, the latest episode in the ongoing Palestinian genocide. Twitter is filled with posts from all sorts people denouncing the massacre.|The Palestinian massacre continues, and your timeline is filled with videos of folks protesting in person.|The Palestinian massacre continues. Your timeline is filled with videos of the most recent hospital that was bombed by Israel.}
~did_look_phone = true
~begin_audio()
 
    -- (phone)
    ++ (retweet_palestine) {!did_retweet_palestine} [Retweet some of the people supporting Palestinians.]
    {You retweet a gamedev personality who is quote-tweeting a post in support of Palestine.|You retweet a video of protesters interrupting a senate hearing, holding up bloody hands.|You retweet a video of a man standing on the rubble of his home, searching for his kids.} You feel a little better about the whole thing. It's the least you can do really.
    ~did_retweet_palestine = true
    -> phone
 
    ** {!retweet_palestine} [Ignore the Palestinian posts. You support Israel.]
    This game is not for you.
    -> END
    
    ++ {!did_tweet_dogsword} [Scroll down, looking for a tweet about Dog with a Sword.]
    {You find a tweet from your publisher about Dog with a Sword. It's got a hundred retweets! Promising. You retweet it.|You find a tweet from your community manager. It has a reference to the Shadow Doggo Money Gang meme. Wow, three hundred likes! You like the tweet, and show it to your partner, who chuckles.|You find a tweet about the impending release, and quote tweet it, adding that you're proud of the work you've done on the game. You sigh, putting your phone down. You really hope people like the game.}
    ~ did_tweet_dogsword = true
    -> phone
 
    ++ [Put your phone away.]
    You put your phone in your pocket. The genocide continues anyway.
    -> choices
 
+ {!did_brush_teeth} [Brush your teeth.]
You go and brush your teeth. {Hygiene matters.|You won't get another set.|You muse about Dog with a Sword's launch as you brush.}
~did_brush_teeth=true
-> choices

+ {!did_eat_breakfast} [Go eat breakfast.]
You go and eat breakfast. {Need to fuel up for the day.|Breakfast may not be the most important meal of the day, but it is important.|Gotta get energy for the last day before launch.}
~did_eat_breakfast=true
-> choices

+ {CHOICE_COUNT() == 0} [Head out for the office.]
You put on a jacket and head out the door. You walk down the street to your bus. {Fortunately, you were right on time today, and the bus is at the stop almost exactly when you get there. You feel happy about this.|Unfortunately, as you're walking down the street, the bus zooms by. You sigh. You get to the stop, and wait for about ten minutes for the next bus. You tap your foot impatiently, but there's nothing to be done.|You get to the bus stop and wait. You muse about how Dog with a Sword's might get received. You can tell you've been thinking about the game a lot today, which you suppose is natural, since the game is about to release. The bus arrives a few minutes later.}

->->

=== common_watch_show ===

* [Watch a comedy-drama.]
    You pull up a teen drama. It's about a kid at school who gives out sex advice to fellow high-schoolers. In this episode, he gets into a fight with his girlfriend over an issue with their sex life that they can't resolve. How ironic.
* [Watch a cartoon.]
    You pull up a cartoon. It's a satire on adventure shows. It stars a duo of hapless teenagers who go on adventures, but can never quite get it right. In this episode, their father almost turns into a giant bug, and they fumble around for a cure until he gets cured by someone else. It gets a few chuckles out of you.
* [Watch a baking show.]
    You pull up a baking show. It's a competition where the best amateur bakers in the UK try to win a grand prize. You've been following this show for a few weeks, and it's always fun to pick a favorite and see how they do. This week, the theme is bread. In a twist, one of the bakers falls ill, and no one is eliminated.
    ~ watched_baking_show = true
    
- ->->

=== common_post_dinner ===

* [Play a video game.]
    You head to the computer and open up a video game. {day_count == 0: Your partner hangs out nearby, and makes funny comments about the game over your shoulder.} You play it for a few hours until it's bedtime.
    ~ played_video_game = true

* [Watch some Youtube.]
    You open up Youtube on the TV and spend time on the couch flicking through videos for a few hours. {day_count == 0: Your partner joins you, snuggling up under a blanket.} You stay there until it's bedtime.

* [Practice playing an instrument.]
    You sit down with your instrument and practice for a little while. {day_count == 0: Your partner hangs out, and doesn't say too much since she knows you're concentrating, but you enjoy her presence nonetheless.} Soon, it's bedtime.

* {day_count == 0} [Be intimate with your partner.]
    You snuggle with your partner. Then you do some other physical things until it's bedtime.
    
- ->->













