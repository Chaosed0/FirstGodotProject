
VAR bug_count = 50
VAR time = 1000

=== function get_time()
    ~ get_time_custom(time)
        
=== function get_time_custom(custom_time) ===
    ~ temp daytime = "AM"
    ~ temp time_of_day = custom_time
    
    {
    - custom_time > 1200:
        ~ daytime = "PM"
        
    - custom_time < 100:
        ~ time_of_day = time_of_day + 1100
        
    - custom_time > 1300:
        ~ time_of_day = time_of_day - 1200
    }
        
    ~ temp hours = time_of_day / 100
    ~ temp minutes = time_of_day mod 100
    
    {hours < 10:0}{hours}:{minutes < 10:0}{minutes}{daytime}