
VAR day_count = 0
VAR break_time = 1200
VAR debug = true
VAR morning_anxious_count = 0
VAR morning_excited_count = 0
VAR watched_baking_show = false
VAR played_video_game = false

LIST bug1_names = (cat_enemy),(wood_wall),(blue_orb),(big_red_hat),(katana_sword),(dash_ability)
VAR bug1_fixed = ()
VAR bug1_fixed_again = ()
VAR bug1_name = bug1_names.cat_enemy
VAR bug1_description = ""

=== function get_bug1_name()
    {
        - bug1_name == cat_enemy:
            cat enemy
        - bug1_name == wood_wall:
            wood wall
        - bug1_name == blue_orb:
            blue orb
        - bug1_name == big_red_hat:
            big red hat
        - bug1_name == katana_sword:
            katana sword
        - bug1_name == dash_ability:
            dash ability
    }

LIST bug2_names = (upgrading_sword),(deconstruct_building),(petting_cat),(attacking_enemy)
VAR bug2_name = bug2_names.upgrading_sword
VAR bug2_encountered = ()
VAR bug2_progress = 0
VAR bug2_skip_wrong_build = true

=== function get_bug2_name()
    {
        - bug2_name == upgrading_sword:
            upgrading a Sword
        - bug2_name == deconstruct_building:
            deconstructing a building
        - bug2_name == petting_cat:
            petting a cat
        - bug2_name == attacking_enemy:
            attacking an enemy
    }
    
LIST bug3_solution = designer,art,audio,none
VAR bug3_occurrences = 0

=== function increment_bug3_count()
    ~ bug3_occurrences = (bug3_occurrences + 1) mod 13

=== function get_bug3_name()
    {bug3_occurrences:
        - 0: the art for the cat enemy is broken
        - 1: the otter's attack makes no sound
        - 2: the boss does way too much damage
        - 3: deconstructing any object crashes the game
        - 4: the tutorial cinematic doesn't play
        - 5: the rat enemy dies in one hit
        - 6: the portal doesn't unlock at the end of the tutorial
        - 7: the sword swing doesn't make sound
        - 8: the fire visual effect is missing
        - 9: the fire sound effect is missing
        - 10: the fire is broken
        - 11: the wood floor looks weird
        - 12: the background art for the world is missing
        - else: < THIS IS A BUG! >
    }
    
=== function get_bug3_fix()
    {bug3_occurrences:
        - 0:
            ~ return bug3_solution.art
        - 1:
            ~ return bug3_solution.audio
        - 2:
            ~ return bug3_solution.designer
        - 3:
            ~ return bug3_solution.none
        - 4:
            ~ return bug3_solution.designer
        - 5:
            ~ return bug3_solution.designer
        - 6:
            ~ return bug3_solution.designer
        - 7:
            ~ return bug3_solution.audio
        - 8:
            ~ return bug3_solution.audio
        - 9:
            ~ return bug3_solution.designer
        - 10:
            ~ return bug3_solution.none
        - 11:
            ~ return bug3_solution.art
        - 12:
            ~ return bug3_solution.audio
        - else: < THIS IS A BUG! >
    }
    
=== function get_bug3_special_note()
    {bug3_occurrences:
        - 0: The artist checks in a re-exported version of the cat enemy and all is fixed.
        - 1: The audio designer checks in a re-exported version of the otter's attack sound and all is fixed.
        - 2: The designer adjusts the boss' damage downwards. Hopefully that does it.
        - 4: The designer does some tweaks to the tutorial level. Hopefully that fixes the problem.
        - 5: The designer adjusts the rat's health upwards. Hopefully that fixes the problem.
        - 6: The designer adjusts the tutorial level's portal. Hopefully that fixes the problem.
        - 7: The audio designer adjusts the spatialization properties on the sword swing and all is fixed.
        - 8: Weirdly, the visual effect was tied to the sound effect somehow. Once the audio designer makes the sound play correctly, it'll be fixed.
        - 9: The sound designer made the sound play correctly, but it wasn't hooked up in the game's data files. The designer goes and fixes that.
        - 11: The artist does some tweaks to the wood floor texture. Hopefully that fixes the problem.
        - 12: For some reason the background art was tied to the audio? Who knows why. You track down the problem and the audio designer gets a fix in.
        - else: < THIS IS A BUG! >
    }

VAR bug_count = 50
VAR addl_bug_count = 20
VAR time = 1000

=== function add_time(time_to_add)
    ~ time += time_to_add
    
    {
    - time mod 100 >= 60:
        ~ time -= 60
        ~ time += 100
        ~ add_time(0)
    }

=== function get_time()
    ~ get_time_custom(time)
        
=== function get_time_custom(custom_time) ===
    ~ temp daytime = "AM"
    ~ temp time_of_day = custom_time
    
    { custom_time > 1200:
        ~ daytime = "PM"
    }
        
    { custom_time < 100:
        ~ time_of_day = time_of_day + 1100
    }
        
    { custom_time > 1300:
        ~ time_of_day = time_of_day - 1200
    }
        
    ~ temp hours = time_of_day / 100
    ~ temp minutes = time_of_day mod 100
    
    {hours}:{minutes < 10:0}{minutes}{daytime}
    
EXTERNAL shuffle_next_choices()
=== function shuffle_next_choices() ===
    < DEBUG > NEXT CHOICES SHOULD BE SHUFFLED
    
EXTERNAL begin_audio()
=== function begin_audio() ===
    < DEBUG > AUDIO SHOULD BEGIN