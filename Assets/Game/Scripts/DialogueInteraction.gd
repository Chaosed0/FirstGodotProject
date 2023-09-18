class_name DialogueInteraction
extends BaseInteractionNode

@export var story : InkStory

func on_interact():
	var storyUI : StoryUI = get_tree().get_nodes_in_group("StoryUI")[0]
	storyUI.load_story(story)
	return;
