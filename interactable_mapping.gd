extends Node

class_name InteractableMapping

static var mapping = {
	Vector2i(30,36): {"scene": null}, # "notes"
	Vector2i(2, 28): {"scene": preload("res://toolbox.tscn")}, #  "toolbox",
	Vector2i(6, 31): {"scene": null}, #  "fire_extinguisher",
	Vector2i(5, 33): {"scene": null}, #  "box_closed",
	Vector2i(4, 35): {"scene": null}, #  "loan_mower",
	Vector2i(12, 21): {"scene": null}, #  "door_wood",
	Vector2i(3, 31): {"scene": null}, #  "broom",
	Vector2i(4, 31): {"scene": preload("res://shovel.tscn")},
	Vector2i(2, 35): {"scene": null}, #  "ladder",
	Vector2i(2, 30): {"scene": null}, #  "paint",
	Vector2i(6, 30): {"scene": null}, #  "fuse_box"
}

static func get_object(key: Vector2i) -> Dictionary:
	return mapping[key]
	
