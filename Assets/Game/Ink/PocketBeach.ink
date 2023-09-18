
=== PocketBeach_Start ===

You beach the small kayak, pull it under the tarps you know are nearby.

 - (choices_1)

 * (mind_mask) [Check your mind-mask.]
 
 You feel the top of your head, tap the straps on your chin.. Your mind-mask is on securely. It's a good thing, too - the rain is only falling lightly today.
 -> choices_1
 
 * (reiometer) [Check the reiometer.]
 
 You take a look at the device on your wrist. The readings are low, this close to the ocean. Further inland, though... You'll feel safer after getting a forecast from Steven.
 -> choices_1
 
 * [Take a look around you.]
 
 Around you is a small beach, where the survivors land for supply trips. There is a small staging area here, with some equipment, but the real station is where Steven is, further inland.
 
 The city looms ahead of you, buildings like broken teeth. On the nearest ones, you can see the overgrown tangles of vines, nature beginning to reclaim its place.
 
 There weren't as many bombs here as other places - just not as important as New York City, or San Francisco - but one fell right smack in downtown. Nothing will ever be the same.
 
 -> choices_1
 
 * {choices_1 > 3} Move out.
 
 - Before you move out, you check your {TURNS_SINCE(-> mind_mask) > 1: mind-mask | reometer} again. Never hurts to be too careful.
 
 You start making your way up the beach, towards the grass. As you move, you think about...
 
 - (choices_2)
 
 * [Your task.]
 
 Your first stop should be to see Steven. He'll know more about the current conditions - what to avoid, and when to rest.
 
 After that, it'll be your choice. You'll want to head to the Reifier for sure - you need a refresh on your equipment. Then, there's an area east of the city where you might still find supplies.
 
 There's your old house up north, too. If you can find the time, this time. You think about the extra lump in your bag.
 -> choices_2
 (choices_2 == 3) -> after_choices_2
 
 * [Your equipment.]
 
 You've got your trusty rifle strapped to the side of your bag. You know you have five rounds of ammunition left. You wish you had more - maybe you can cajole the reifier into making you more, this time.
 
 As far as food, you've got rations enough for three meals. You probably shouldn't be out for more than a day, maybe a little more.
 
 Additionally, you have binoculars, some rope, a blanket and a tarp, a flashlight, and a compass.
 -> choices_2
 
 * [The extra lump in your bag.]
 In addition to your standard equipment, you have a small box, with a latched lid. It's surprisingly dense.
 
 You try to keep your mind off of it.
 -> choices_2
 
 * {choices_2 > 1} [Just keep moving.]
 
 - (after_choices_2)
 
 You reach the top of the beach. Steven is a short walk east of here.
 
 * Continue on. -> SeattleCenter_Start
 

-> DONE
