
 === BugGame ===
 
It is {get_time()}. Solving the following problem will crush one bug.

{ shuffle:
    - -> bug1
    - -> bug2
    - -> bug3
}

= bug1

 What is red and yellow mixed together?
 
 {shuffle:
  - + [Blue]
  -> BugGame
  - + [Orange]
  -> BugGame
  - + [Teal]
  -> BugGame
 }

= bug2

 What is 17 + 26?
 
 {shuffle:
 - + [31]
  -> BugGame
 - + [43]
  -> BugGame
 - + [33]
  -> BugGame
 }

= bug3

All goobers are bumbles, and some bumbles are yonks. Therefore:

{shuffle:
- + [Some goobers are yonks]
  -> BugGame
- + [No yonks are goobers]
  -> BugGame
- + [All goobers are yonks]
  -> BugGame
}
 
 ->->