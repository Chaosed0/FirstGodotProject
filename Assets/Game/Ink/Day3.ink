
=== Day_3 ===

~ day_count = 2
~ time = 900

You wake up to your alarm. It is 9AM on Thursday, the 12th of October. The game you have been working on for three years, Dog with a Sword, is releasing on Friday - in one day.

The energy from this fact makes you bolt straight out of bed.

- 
-> common_morning ->

- You sit down on one of the bus' seats. You think about reading or listening to a podcast, but instead, you:

* [Think about Dog with a Sword.]
    You can't really help it. The game comes out tomorrow. You sit there and think about Dog with a Sword. About how you think the reception will be, about whether the company will make enough money to keep going, about what your friends will think about the game.
    
    You know it's a little silly. It's a game about a dog, with a sword. You know there's lots more important stuff happening in the world. And yet, you still can't stop thinking about it.
    
    You stare out the window, a storm in your mind, until the bus stops at your office.
    ~add_time(100)
 
 -
 
About half the team usually works from home. However, when you get to the office, almost everyone is at their desks. It seems like the air is charged with creative energy. Folks want to land this game. It's the most important thing in their life right now.

You go straight to your desk and sit down. It's {get_time()}. You have until {get_time_custom(break_time)} to get as much work done as you can. Yesterday, QA found {addl_bug_count} more bugs. There are {bug_count} bugs left to fix.
 
 * [Time to crush bugs.]

->->

=== Day_3_Lunch ===

It is {get_time()}. It's time for {time > 1330: a late lunch.|lunch.}


You and your coworkers gather around the table. The mood is somewhat down, as everyone is nervous about the upcoming launch of Dog with a Sword. Still, everyone's feeling proud of their work, and people are largely optimistic.

A coworker asks how you are feeling. You respond that:

* [You feel extremely nervous about the number of bugs that are still in the project.]
You're still pretty nervous about how many bugs there are. There's {bug_count} on the task tracker right now, and who knows how many waiting to be found by QA. The other engineers agree.

* [You're feeling optimistic about the game's chance of success.]
You know that there's a lot of work to be done yet, but you're feeling relatively optimistic about the game. Hopefully it makes enough sales that the publisher will fund another project.

The founder of your small company is at the table, and he agrees. He talks hard numbers - units that need to be sold, budget that might need to get cut - but simultaneously uplifts the spirits of everyone at the table.

* [You're feeling proud of the work that you've been putting in.]

- You feel really good about the work you've been doing. You think folks will be able to see the amount of love put into the game, and they'll appreciate it.

Everyone around the table nods. They're excited for people to finally see the work they've been doing.

* [Finish up your food.]

- It's {get_time()}. You have until {get_time_custom(break_time)}, to get as much work done as you can. You have to leave a little early to get to the game's launch party on time.

There are {bug_count} bugs left to fix.

* [Time to crush bugs.]

->->
 
=== Launch_Party ===

It's {get_time()}. It is time to head to the launch party.

* [...]

- The launch party is at a small event space in downtown. You and your partner arrive a little late, as is right for parties.

The space is crowded. Everyone on the team, even those from far out of town, have made it. Most have brought a +1 - a partner, or just a friend - to celebrate with them.

* [You feel excited.]
You're excited. It's awesome that everyone managed to get together to celebrate before the launch. You're sure this will be a night to remember.
* [You feel overwhelmed.]
You feel a little overwhelmed. There are a lot of people here, and it's hard to know how to behave. This is your first real launch, after all.

-

Your partner notices, and she pushes you to go talk to some people. She can handle herself.

- (party_talk_choices)

* [Talk to your producer.]
    You go talk to your producer. They are here with their partner.
    
    It's been a particularly challening project for the producer because the team is very small and scrappy. It's been difficult to enforce any kind of structure on the team.
    
    As you chat with the producer, you move into topics that aren't about the game. You learn that they've also been going through a tough time at home. One of their relatives is moving in with them, and it's been difficult enforcing boundaries in their life.
    
    You had no idea that they were going through this. You sympathize with them, though they brush it off.
    -> party_talk_choices

* [Talk to an engineer.]
    You catch one of the engineers. They're here with a mutual friend of yours.
    
    The friend congratulates you on release. "It must be a big deal for you, eh?"
    
    ** [Yeah, it is.]
    You agree. It is a big deal. It's got you nervous and excited, all at once. And it's very cool to be celebrating here, with all of these people.
    
    ** [Less than you expected.]
    Actually, it's strange. Now that you're getting this close to release, the stress is falling away. There's not much that can be done. All that's left is to enjoy the party, and be in the moment.
    
 -- -> party_talk_choices

* [Talk to a designer.]
    You chat with a designer on the project. They laugh and apologize for all the localization bugs that you had to fix because of them.
    
    The designer has mixed feelings on the project. They're happy that it's releasing, but know that if the game had been scoped down some, it could have been in a much more polished state than it is now. They regret not pushing harder for more a more focused feature set.
    
    Ah, well, they muse. It's all in the past now. The game will release, and it will do as it does.
    
    -> party_talk_choices
    
* ->

- Suddenly, there is a small clamour at the front of the room. "Speech!" They're chanting. The creative director is up there, looking a little embarrased. Everyone turns towards him, and he clears his throat.

"Kind of hard to believe this is real, after four and a half years," he says. "We've finally made it. We're finally going to release Dog with a Sword."

The room cheers. Your partner squeezes your hand. You poured a lot of work into Dog with a Sword, and she's seen the stress you've gone through.

"And it's all thanks to you!" He gestures to the room. "You all made this possible. I couldn't have imagined making this game with another team."

* You smile. <>
    He's absolutely right. <>

* [You nod.]
    You nod, quietly pleased. <>
    
    
- Everyone's put forward their best work for the project. You're incredibly proud of the work you've done for Dog with a Sword, and it's been a hugely cool project to be a part of.
    
"You know, it's kind of surreal, to be here, after all that happened to us." The creative director shakes his head. "The pandemic nearly ended the project. And it's kind of like we're making games at the end of the world, what with climate change, and... all of the rest of what's happening. It's weird."

* Yeah, it is weird.

"The game releases tomorrow, so celebrate! Drink up! A toast to all of you." He raises his glass, and everyone in the room does the same. "To Dog with a Sword!"

"To Dog with a Sword!" Everyone toasts.

...

- Sometime later, late at night, you head home from the party. You kiss your partner goodnight.

* [Tomorrow, Dog with a Sword launches.]
 
->->




















