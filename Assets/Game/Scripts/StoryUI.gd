class_name StoryUI
extends VBoxContainer

var story : InkStory

func load_story(new_story)
    story = new_story
    continue_story();

func continue_story()
    for child in get_children():
        child.queue_free()

    var content : Label = new() { Text = story.ContinueMaximally() };
    add_child(content);

    for choice in story.current_choices:
        var button : Button = new() { Text = choice.Text };

        button.Pressed += func(): 
            story.choose_choice_index(choice.Index);
            ContinueStory();

        add_child(button);