
 === BugGame ===
It is {get_time()}. You're trying to solve a bug.

+ {debug} [< DEBUG! > skip to break time]
~ time = break_time
-> bug_game_check_end
+ {debug} [< DEBUG! > localization] -> localization_bug ->
+ {debug} [< DEBUG! > crash] -> crash_bug ->
+ {debug} [< DEBUG! > broken asset] -> broken_asset ->
+ {debug} [< DEBUG! > random] -> bug_game_random ->
+ -> bug_game_random ->

-

{time >= break_time: ->->}
-> bug_game_check_end

=== bug_game_random

{ shuffle:
    - -> localization_bug ->
    - -> localization_bug ->
    - -> localization_bug ->
    - -> broken_asset ->
    - -> broken_asset ->
    - -> broken_asset ->
    - -> crash_bug ->
}

-> bug_game_check_end

=== bug_game_check_end

{
 - time >= break_time: ->->
 - else: -> BugGame
}

=== localization_bug ===
 ~ temp wtf_stew = false
 ~ bug1_name = LIST_RANDOM(bug1_names)
 ~ bug1_description = "{~a stone door|a newt|a toad|a sword}"

 On this bug, QA says that the description for the {get_bug1_name()} says that it's "{bug1_description}".
 
 - (localization_bug_toplevel)        
 
  + {!wtf_stew && bug1_seen_locsheet_count > 3} [What the fuck. How many times have you seen these localization bugs?]
  You're pretty sure you've seen at least {bug1_seen_locsheet_count} localization bugs. You sit there and stew for a bit. Why are there so many fucking localization bugs? Why is your process so brittle?
  
  You spends ten minutes stewing over this. At least you feel a little better at the end.
  ~ add_time(10)
  ~ wtf_stew = true
  -> localization_bug_toplevel
      
  + {bug1_fixed has bug1_name} [Wait, haven't you fixed this one already?] -> refix ->
 
  + {bug1_fixed hasnt bug1_name} [Revise the description.] -> fix ->
  
  + [Mark it with a "won't fix" tag. This is not high-priority enough to fix.]
  You spend a few minutes moving bugs around the task tracker. The number of bugs stays the same.
  ~ add_time(3)
  
  + {day_count >= 1} [Send it to someone else. Clearly this is not important enough for you to fix.]
  You spend a few minutes moving bugs around the task tracker. The number of bugs stays the same.
  ~ add_time(2)
  
  -
  
  + [On to the next bug.] ->->
  
= fix
~ temp rub_eyes = false

{Looks like an easy fix.|You think to yourself, another one of these? Where are these localization bugs coming from?|You roll your eyes. You really need to take another look at the localization process later on, but this close to release, you'd better just fix it.|You really wish there weren't so many of these description bugs, but you'll fix it.}
~ bug1_fixed += bug1_name

  + [Open the localization sheet.]
  You find your bookmark to the localized string table on Google Sheets, and open it.
   
  ++ [Add a new row to the localization sheet.]
   You add a new row to the localization sheet. You enter a new string term key. You add a new description for the {get_bug1_name()}.
   -- (rub_eyes_back)
   
  +++ (bug1_seen_locsheet_count) [Import the localization sheet to Unity.]
  You export the localization sheet. You save it to your downloads folder. You open up the localization asset in Unity. You import the localization sheet.
  
      ++++ [Open up the asset for the {get_bug1_name()}.]
      You open up the asset. {The project is structured weirdly, so now you have to track down the description entry.|This weird project. Why isn't the description entry part of the asset?|You hate how poorly the project is structured. Who made this so hard to navigate?|Why is a simple description bug so GODDAMN hard to fix?}
       
      +++++ [Open up the description entry for the {get_bug1_name()}.]
      You open the description entry.
      
      ++++++ {bug1_seen_locsheet_count > 2} [Just fucking give up. How many times do you have to do this?]
      The number of these description bugs just makes you want to scream. You close the project and spend 45 minutes outside. Not that it does much good.
      ~ add_time(45)
      
      ++++++ [Set the new string key for the {get_bug1_name()}.]
      You click on the dropdown for the name. You search the new string key you added. You set the correct description. {bug1_seen_locsheet_count > 3: You lean back in your chair and sigh.}
      
      You have fixed the bug. You commit to source control. You make a pull request. In total, you have spent 30 minutes.
      ~ bug_count--
      ~ add_time(30)
       
  +++ {!rub_eyes} {bug1_seen_locsheet_count > 2} [Rub your eyes.]
  Ugh, how many of these description bugs are there? You take a break and contemplate your life.
  ~ add_time(10)
  ~ rub_eyes = true
  -> rub_eyes_back
  
 - ->->
 
= refix

~ temp seen_engineers = false
~ temp seen_designers = false
~ temp seen_producer = false

You flip back in the pages of your brain. You've definitely seen a bug from QA about the description for the {get_bug1_name()} already. {bug1_fixed_again has bug1_name: And in fact, you took extra care to fix this a second time.} How did this get broken again?

    + [Ask around to figure out how this got broken again.]
    You open your work's slack.
    -- (refix_choices)
    
        ++ {!seen_engineers} [Ask other engineers if they know how this got broken.]
        ~seen_engineers = true
        You have a protracted discussion with the engineers on how this got broken. They mostly shrug. The conversation took 10 minutes.
        ~ add_time(10)
        -> refix_choices

        ++ {!seen_producer} [Ask the producer if they know how this got broken.]
        ~seen_producer = true
        Your producer doesn't have an answer for you, but they point you at the designers as the likely cause. The conversation took 10 minutes.
        ~ add_time(10)
        -> refix_choices
        
        ++ {!seen_designers} [Ask the designers if they know how this got broken.]
        ~seen_designers = true
        
        {
        - bug1_fixed_again has bug1_name:
            This time, you go directly to the designer who broke it last time. They shake their head - no, it wasn't them.
            
            You have a talk with all the designers. Sit them down, and go over the best practices on how to update the localization table. They all nod. In the end, though, you're unable to track down what happened, and you have to go fix it yourself anyway.
            
            This waste of a conversation took an hour, but maybe it will make for less bugs in the future.
            
            ~ addl_bug_count -= 2
            ~ add_time(90)
            -> fix ->
            
        - else:
            One of the designers mentions that they recently copy-pasted the new localization entries into the sheet. Maybe it was broken then?
            
            You track down exactly what went wrong with the previous localization entry and why this copy paste would have broken it. It requires lots of back and forth with the designer who copy-pasted the sheet.
            
            In the end, you fix the bug, and you give the designer some tips on how they should be copy/pasting into the sheet, but it takes you 45 minutes. At least this won't happen again... Hopefully, anyway.
            
            ~ addl_bug_count -= 1
            ~ bug1_fixed_again += bug1_name
            ~ add_time(45)
        }
        
        ++ [Nevermind. It's faster to just fix the bug.]
        Whatever. Who cares how this got broken again. Just fix the damn bug.
        -> fix ->
    
    + [Nevermind. It's faster to just fix the bug.]
    Whatever. Who cares how this got broken again. Just fix the damn bug.
    -> fix ->

- ->->

=== crash_bug ===

 ~ bug2_name = LIST_RANDOM(bug2_names)
 ~ bug2_progress = 0

 QA has found a crash while playing through the game. The crash occurred while they were {get_bug2_name()}.
 
 Tracking down the cause of a crash can be somewhat difficult. There's a few approaches you can use to try to debug it. You might be able to solve it with one, or you might have to try all three.

 -> crash_choices ->
 ->->
 
= crash_choices
 ~ temp used_replay_file = false
 ~ temp used_crash_dump = false
 ~ temp used_repro = false

 - (re_crash_choices)
 
 {bug2_progress >= 10:
    -> crash_success ->
    ->->
  }
 
 + {!used_replay_file} [Use the replay file to see where the crash occurred.]
    ~ used_replay_file = true
    -> use_replay ->
 + {!used_crash_dump} [Open the crash dump to figure out what line of code the crash occurred.]
    ~ used_crash_dump = true
    -> use_crash_dump ->
 + {!used_repro} [Try the reproduction steps to see if the crash happens for you.]
    ~ used_repro = true
    -> use_repro ->
 + {!used_replay_file or !used_crash_dump or !used_repro} [Give up.]
    You decide it's not worth spending {re_crash_choices > 0: more} time on this crash. You mark it as won't fix and move on.
    ->->
 + {CHOICE_COUNT() == 0} [You've run out of things to try.]
    You tried everything you could, but sometimes a crash simply can't be fixed until you get more data. What a waste.
    ->->
 
 - -> re_crash_choices

= use_replay

 ~ temp replay_steps = 0

 To open up the replay, you must do the following in order:
 
 1. Find the version of the game where the crash occurred
 2. Check out that version of the game from source control
 3. Open up the core-replay scene
 4. Load the replay file
 5. Play the replay back until the last frame
 6. Inspect the console
 
 This will give you a hint on where the crash is. Each of these steps will take a few minutes.
 
 + [Got it]
 
 - (replay_debug)
 You are debugging a replay. It is currently {get_time()}. <>
 
 {replay_steps:
 - 0:
 - 1: You have obtained the version of the game where the crash occurred.
 - 2: You have checked out a version of the game from source control.
 - 3: You have the core-replay scene open.
 - 4: Load the replay file.
 - 5: You have played the replay back.
 }
 
 {debug: < DEBUG: replay_steps is {replay_steps} >}
 
 ~ shuffle_next_choices()
 
 + [Find the version of the game where the crash occurred]
    {replay_steps < 0: You haven't opened the log file yet. You can't find the version without the log file.}
    { replay_steps == 0:
        ~replay_steps++
        You open up the log file from the bug report and scan the log file until you find the version marker.
    }
    
 + [Check out the correct version of the game from source control]
    {replay_steps < 1: You open up your source control software to check out the correct version, but you don't know the version to check out yet.}
    {replay_steps > 1: You open up your source control software to check out the correct version, but you realize that you've already checked out the correct version.}
    { replay_steps == 1:
        ~replay_steps++
        You check out the correct version of the game from source control.
    }
 
 + [Open up the core-replay scene]
    {replay_steps < 2: You fire up Unity and open the core-replay scene, but sigh as you realize you don't have the right game version open.}
    {replay_steps > 2: You already have the core-replay scene open.}
    { replay_steps == 2:
        ~replay_steps++
        You fire up Unity and open the core-replay scene.
    }
  
 + [Load the replay file]
    {replay_steps < 3: You try to load the replay file, but slap your forehead. You haven't even opened the right scene yet.}
    {replay_steps > 3: You've already loaded the replay file }
    {replay_steps == 3:
        ~replay_steps++
        You put Unity into play mode. You load up the replay file. The replay playback window opens up.
    }
 
 + [Play the replay]
    {replay_steps < 4: The replay hasn't been loaded yet.}
    {replay_steps > 4: You've already played the replay forward.}
    {replay_steps == 4:
        ~replay_steps++
        You play the replay back until the last frame.
    }
    
 + [Inspect the console]
    {replay_steps < 5: The replay hasn't been loaded yet.}
    {replay_steps == 5:
        ~replay_steps++
        You take a look at the console. Great - there's the data you needed. You have {bug2_progress == 0:a | another} hint as to where the crash might be.

        -> crash_advance_progress ->
        ->->
    }
 
 + [Give up]
    Replays have always been terribly finicky. Perhaps it's best to try another tactic.
    ->->
 
 -
 ~ add_time(10)
 -> replay_debug
 
= use_crash_dump
To use the crash dump, you first have to locate the build. Unfortunately, finding it is not always easy.

- (use_crash_dump_skip_text)
~ temp find_build_yourself = false
~ temp ask_producer = false
~ temp ask_qa = false


- (find_build)

+ {!find_build_yourself} [Try to save time by finding the build yourself.]
    ~ find_build_yourself = true
    ~ temp yourself = RANDOM(1, 3)
    {debug: < DEBUG: random is {yourself} >}
    { yourself > 2:
        Luckily, the build is in an easily found place, and you find it in just 10 minutes.
        ~ add_time(10)
     - else:
        You search for 20 minutes, but you can't find the build. It looks like someone put it in a non-standard location.
        ~ add_time(20)
        -> find_build
    }
    
+ {!ask_producer} [Ask your producer if they know where the build is.]
    ~ ask_producer = true
    Your producer is very busy, so it takes them a little while to respond. <>
    
    ~ temp producer = RANDOM(1, 3)
    {debug: < DEBUG: random is {producer} >}
    { producer > 1:
        In 15 minutes, they point you right to the correct build. Your producer is a lifesaver.
        ~ add_time(15)
     - else:
        They respond in about 20 minutes. However, they were unable to locate the build. Looks like someone screwed up the build upload process.
        ~ add_time(20)
        -> find_build
    }
    
+ {!ask_qa} [QA doesn't usually know where the build is, but you might as well try asking.]
    ~ ask_qa = true
    ~ temp qa = RANDOM(1, 4)
    {debug: < DEBUG: random is {qa} >}
    { qa > 3:
        QA actually happens to know where the build is! QA can be lifesavers. They hand it to you in just 5 minutes.
        ~ add_time(5)
     - else:
        QA searches for 20 minutes, but gets back to you saying they can't find the build.
        ~ add_time(20)
        -> find_build
    }
    
+ {CHOICE_COUNT() > 0} [This is taking too long. Try another tactic.]
    You decide that using the crash dump is taking way too long. It's better to forget it and move on.
    ->->
    
+ ->
    Since you can't find the build, you have no choice but to abandon trying to read the crash dump.
    ->->
        
-

 + (crash_dump_build_download) [Download the build]
 
 - Downloading the build can take a while. Dog with a Sword is not particularly big, but your build server is pretty slow.
 
 It takes you 10 minutes to download the build.
 
 ~add_time(10)
 
 + [Load the dump file]
 
 - You fire up Visual Studio and load the dump file. Then, you point Visual Studio at the build you downloaded to correctly symbolicate the dump file.
 
 ~ temp load_wrong_symbols = 0
 
 {not bug2_skip_wrong_build:
    ~ load_wrong_symbols = RANDOM(0, 2)
 }
 
 {load_wrong_symbols == 0: The symbols load correctly, and you obtain a hint to where the crash could be located. <>}
 {load_wrong_symbols != 0: -> loaded_wrong_symbols }
 
 ~ bug2_skip_wrong_build = false
 -> crash_advance_progress ->
 ->->


= loaded_wrong_symbols
 ~ temp loaded_wrong_symbols_tries = 0
 Unfortunately, something has gone wrong. The screen displays a bunch of meaningless numbers and letters. Why isn't the crash dump symbolicating correctly?
 
 You look dumbly at your computer monitor.
 
 - (loaded_wrong_symbols_choices)
 + [Try again]
    You try loading the symbols again. The same thing happens.
    ~ loaded_wrong_symbols_tries++
 + [Ask a coworker]
    You ask a coworker for help. They shrug.
    ~ loaded_wrong_symbols_tries++
 + [Double-check your steps]
    You look over the steps you've done, and try them all again.
    ~ loaded_wrong_symbols_tries++
 + {loaded_wrong_symbols > 1} [Remember that you've done this before. Double-check that you have the right build.]
    Right, this has happened before. You downloaded the wrong build again. <> -> loaded_wrong_symbols_resolution
 
 -
 
 {loaded_wrong_symbols_tries < 4: -> loaded_wrong_symbols_choices }
 
Wait a second. You look over the build number of the build you downloaded. It looks like you've downloaded the wrong build.

- (loaded_wrong_symbols_resolution)
You lean back. Your head is heavy. You've just wasted 30 minutes, and now you have to go locate the actual, correct build.
~add_time(30)
~bug2_skip_wrong_build = true
-> use_crash_dump_skip_text
 
 
= use_repro
  ~ temp repro_tries = 0
  Trying to reproduce the crash, even with good reproduction steps from QA feels like it's up to luck. Sometimes QA has great reproduction steps. Sometimes the crash was caused by something totally random happening offscreen. It might take you a while to get a hint to the crash, or it might happen instantly.
  
  ~ temp random_max = RANDOM(2, 10)
  ~ random_max = random_max * random_max
  ~ temp repro_max = 10
  
  - (try_repro_options)
  
  It's currently {get_time()}.
  
  {debug: < DEBUG: tries {repro_tries} >}
  
  + {repro_tries < repro_max} [Try to reproduce the issue.]
  You try to reproduce the issue using the steps QA listed in the bug. <>
  ~ repro_tries++
  ~ temp repro_random = RANDOM(1, random_max)
  ~ add_time(8)
  
    {repro_random == 1:
        You successfully reproduce the issue!
        -> crash_advance_progress ->
        ->->
      - else:
        You do not manage to reproduce the issue. You can try again though.
        -> try_repro_options
    }
  
  + {repro_tries < repro_max} [Try a different tactic.]
    You decide that this is not getting you anywhere, and you decide to try something else.
    ->->
    
  + ->
    You decide that {repro_max} tries is enough. You call it and try a different tactic.
    ->->

= crash_advance_progress
    ~ bug2_progress += RANDOM(3, 12)
    
    {debug: < DEBUG: bug2_progress becomes {bug2_progress} >}
    
    {bug2_progress > 10:
        ->->
    - else:
        You've made some progress on finding where the game is crashing, but you need more data to solve it fully. ->->
    }

= crash_success
    With this new data, you've got enough to solve the crash.
    
    + [Fix the bug.]
        It's {a short fix that takes you 20 minutes|a bit of an involved fix that takes you 40 minutes|a really long fix that takes you 90 minutes}, but you feel better for having tracked that crash down.
        
    {crash_success:
     - 0: ~add_time(20)
     - 1: ~add_time(40)
     - 2: ~add_time(90)
     - else: ~add_time(90)
    }
    
    ~ bug_count--
    
    ->->
        
=== broken_asset ===
    ~ temp asked_designer = false
    ~ temp asked_artist = false
    ~ temp asked_audio = false
    
    This bug from QA notes that there is a broken asset. The notes on the bug state: {get_bug3_name()}.
    
    Who do you ask for help on tracking down this issue?
    
    - (broken_asset_choices)
    
    + {!asked_designer} [Ask a designer.]
    ~ asked_designer = true
    
    {get_bug3_fix():
        - bug3_solution.designer:
            {get_bug3_special_note()}
            ~ increment_bug3_count()
            ~ add_time(20)
            Asking around and walking them through the fix took 20 minutes.
        - else:
            The designer shrugs. Seems that it's not their problem. You spend ten minutes chatting with them.
            ~ add_time(10)
            -> broken_asset_choices
    }
    
    
    + {!asked_artist} [Ask an artist.]
    ~ asked_artist = true
    
    {get_bug3_fix():
        - bug3_solution.art:
            {get_bug3_special_note()}
            ~ increment_bug3_count()
            ~ add_time(20)
            Asking around and walking them through the fix took 20 minutes.
        - else:
            The artist shrugs. Seems that it's not their problem. You spend ten minutes chatting with them.
            ~add_time(10)
            -> broken_asset_choices
    }
    
    + {!asked_audio} [Ask an audio person.]
    ~ asked_audio = true
    
    {get_bug3_fix():
        - bug3_solution.audio:
            {get_bug3_special_note()}
            ~ increment_bug3_count()
            ~ add_time(20)
            Asking around and walking them through the fix took 20 minutes.
        - else:
            The audio person shrugs. Seems that it's not their problem. You spend ten minutes chatting with them.
            ~add_time(10)
            -> broken_asset_choices
    }
    
    ~asked_audio = true
    
    + [Fix it yourself.]
    {asked_audio && asked_artist && asked_designer: It seems no one is able to help you fix the bug. You track down the fix yourself.|You track down the bug yourself. It takes a bit longer than if someone helped you.} This takes 45 minutes.
    ~ increment_bug3_count()
    ~ add_time(45)

    -
    ~ bug_count--
    + [On to the next bug.]
    ->->











