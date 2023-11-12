
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
    
=== function shuffle_next_choices() ===
    < DEBUG > NEXT CHOICES SHOULD BE SHUFFLED