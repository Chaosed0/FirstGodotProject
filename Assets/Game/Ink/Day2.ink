
=== Day_2 ===

~ day_count = 1
~ time = 900

You wake up to your alarm. It is 9AM on Wednesday, the 11th of October. The game you have been working on for three years, Dog with a Sword, is releasing on Friday - in two days.

How are you feeling about the release of Dog with a Sword today?

* [You are feeling anxious.]
{morning_anxious_count == 1: You're still feeling very anxious about the release. You're tense under the sheets, and you realize you had a hazy dream about the release. You can't remember it, but you feel like it wasn't pleasant.}
{morning_anxious_count == 0: You were excited yesterday, but the nervousness is setting in. The closer it gets, the more real it is, and you can't help but wonder whether the game will be received well.}

The anxiousness makes you get out of bed.

* [You are feeling excited.]
{morning_excited_count == 1: You're still feeling real excited about the release. You wonder where this confidence is coming from, but don't question it.}
{morning_excited_count == 0: You were nervous yesterday, but today you feel confident about the release. The team is doing great work, and you can tell that it's going to show in the final product.}

You get out of bed feeling energized and ready to get to work.

-

-> common_morning ->
-> common_bus_ride ->
 
-
* [...]

- You arrive at work, and walk to your desk.

Your coworkers have already arrived at work, and they are chatting about the baking show. Your coworkers are running a fantasy league with the contestants in the show - kind of like fantasy football, but for baking. They are debating over their favorites.

* [Engage with the conversation.]
    You join in the conversation. {watched_baking_show: Since you watched the baking show last night, you're all up-to-date on who's in and who's out. You personally support the delightful Sri Lankan woman who always has a giggle ready.|You ask your coworkers to update you on who's in and who's out. They tell you all about the hearing-impaired girl who's the dark horse contestant this year.}
    
    Your coworkers ask you if you're going to join the fantasy league.
    ~add_time(15)
    
    ** [Yeah, why not.]
        You say, yeah, you'll definitely join. You sign up and do your draft picks for this week.
        ~add_time(20)
    ** [Nah, it's silly.]
        You're not really into it, sorry. They shrug. That's okay.
        
    -- The conversation comes to a close. You go to sit at your desk, but one of the designers leans over and reminds you that there's a sync meeting today. That's right - you'd forgotten.

* [Sit down at your desk. It's time to get work done.]
    No time for this conversation. There's bugs to crush.
    
    You go to sit at your desk, but one of the designers leans over and reminds you that there's a sync meeting today. That's right - you'd forgotten. You sigh. Bugs will have to wait.
    
- You head over to the meeting room, and the designers slowly gather. Your producer pulls up the agenda, and you start discussing design. It's too late to change anything for the release version of the game, but you need to start thinking about the post-release content already. It's a tricky balance to strike, doing a release while also working on new content, but it's a necessary one.

You start discussing a particularly contentious part of the combat design in Dog with a Sword.

* [Push your opinions.]
    You feel like you have good ideas, so you begin confidently voicing your opinion. Some of the designers agree, some of them don't. The producer quietly takes notes, and interjects occasionally to clarify.

* [Withhold your opinions.]
    You know you have good ideas, but sometimes it's better to let another person drive. The conversation rages on for a while, with you occasionally interjecting to clarify on engineering estimates. The producer takes lots of notes.
    
- Eventually, everyone comes to a compromise. You're just glad that's over with. That meeting took two whole hours. It's already lunchtime.

~add_time(200)

* [Scarf something down quick and get to work.]
    After that meeting, you feel particularly pressured today, so you scarf down some lunch and then head straight back to your desk.
    ~add_time(10)
* [Sit down with your coworkers.]
    You sit down with your coworkers to have lunch. They're talking about the video games that they have been playing. {played_video_game:You join the conversation and mention the video game you played last night. You talk about some of the systems that you think could apply to Dog with a Sword too. The conversation energizes you.|The meeting really took it out of you, so you quietly listen while the others talk. Nonetheless, it's nice to be around people, and you feel a little more energized afterward.}
    
    You return to your desk after lunch.
    ~add_time(30)

- It's now {get_time()}. You have until {get_time_custom(break_time)} to get as much work done as you can. Yesterday, QA found {addl_bug_count} more bugs. There are {bug_count} bugs left to fix.

* [Time to crush bugs.]

->->
 
=== Day_2_End ===

 It's {get_time()}. Time to head home. You know you could work more, but your company has a no-crunch policy, and it's better if you follow it and stay healthy.

You walk to the bus stop. You end up having to wait twenty minutes for the next bus. Sometimes a bus in the schedule is mysteriously skipped, and you have no idea why. It puts you in a bit of a bad mood.

Nevertheless, when the bus gets there, you get on without complaint. Don't complain at bus drivers - it does no one any good.

-> common_bus_ride ->

When you get home, your partner is not there. She's at the gym late tonight.

You prepare some dinner for yourself, then sit down at the couch.

-> common_watch_show ->

After dinner, you wash your plates up. What will you do now?

-> common_post_dinner ->

After you finish your post-dinner activity, your partner comes home. It's quite late, so you kiss them and then head straight to sleep.

 * [Continue]
 
->->