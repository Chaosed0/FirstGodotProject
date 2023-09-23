class_name DialogueInteraction
extends BaseInteractionNode

@export var story : InkStory

var storyUI : StoryUI

func on_interact():
	storyUI = get_tree().get_nodes_in_group("StoryUI")[0]
	storyUI.on_story_complete.connect(on_story_complete)
	storyUI.load_story(story)

func on_story_complete(_story : InkStory):
	storyUI.on_story_complete.disconnect(on_story_complete)
	stop_interact()
