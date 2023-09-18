class_name DialogueInteraction
extends BaseInteractionNode

func on_interact():
    print("Begin dialogue interaction")
    currentInteractor.stop_interacting()
    return;