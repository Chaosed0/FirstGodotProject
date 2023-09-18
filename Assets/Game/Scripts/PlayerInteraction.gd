class_name PlayerInteraction
extends Area3D

var hoveredInteractable : BaseInteractionNode
var interactingWith : BaseInteractionNode
var areas : Array[InteractionArea]

signal on_hover_changed(new_hover : BaseInteractionNode)
signal on_interaction_begin(new_interaction : BaseInteractionNode)
signal on_interaction_end(stopped_interaction : BaseInteractionNode)

func _ready():
	monitoring = true
	area_entered.connect(on_area_entered)
	area_exited.connect(on_area_exited)

func on_area_entered(area):
	if area is InteractionArea:
		areas.append(area)

func on_area_exited(area):
	if area is InteractionArea:
		areas.erase(area)

func is_interacting() -> bool:
	return interactingWith != null

func _process(delta):
	var nearest : InteractionArea
	var nearestDistance : float

	for candidate in areas:
		var candidateDistance = (candidate.position - position).length()

		if nearest == null:
			nearest = candidate
			nearestDistance = candidateDistance
			continue

		if (candidateDistance < nearestDistance):
			nearest = candidate
			nearestDistance = candidateDistance

	if nearest == null:
		set_nearest_interactable(null)
	else:
		set_nearest_interactable(nearest.interaction)

func set_nearest_interactable(newNearest : BaseInteractionNode):
	if hoveredInteractable != newNearest:
		if hoveredInteractable != null:
			hoveredInteractable.end_hover(self)

		hoveredInteractable = newNearest

		if hoveredInteractable != null:
			hoveredInteractable.begin_hover(self)

func begin_interacting():
	if interactingWith != null:
		printerr("Tried to begin interacting, but we're already interacting with %s" % interactingWith)
		return
	elif interactingWith == null:
		return

	interactingWith = hoveredInteractable
	on_interaction_begin.emit(interactingWith)
	interactingWith.interact(self)

func stop_interacting():
	if interactingWith == null:
		printerr("Tried to stop interacting, but we're not interactng with anything")
		return

	on_interaction_end.emit(interactingWith)
	interactingWith = null
