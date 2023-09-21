class_name BaseInteractionNode
extends Node

var currentInteractor : PlayerInteraction
var isHovered : bool

func begin_hover(interactor : PlayerInteraction):
	print("begin hover %s" % interactor)
	isHovered = true

func end_hover(interactor : PlayerInteraction):
	print("end hover %s" % interactor)
	isHovered = false

func interact(interactor : PlayerInteraction):
	currentInteractor = interactor
	on_interact()
	return

func stop_interact():
	currentInteractor.stop_interacting()
	currentInteractor = null

func on_interact():
	return
