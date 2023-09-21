class_name StoryUI
extends VBoxContainer

var story : InkStory

signal on_story_complete(story : InkStory)

func load_story(new_story : InkStory):
	for child in get_children():
		child.queue_free()

	story = new_story
	continue_story();

func continue_story():
	var text : String = story.ContinueMaximally()

	if text.is_empty() && story.GetCurrentChoices().size() == 0:
		on_story_complete.emit(story)
		return

	var content : Label = Label.new()
	content.text = text
	content.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(content)

	for choice in story.GetCurrentChoices():
		var button : Button = Button.new()
		button.text = choice.GetText()

		var index : int = choice.GetIndex()
		button.pressed.connect(func(): 
			print(index)
			story.ChooseChoiceIndex(index);
			continue_story());

		add_child(button);
