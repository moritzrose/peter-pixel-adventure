extends Node

class_name InteractableMapping

static var mapping = {
	Vector2i(30,36): {"scene": preload("res://garage/notes.tscn")}, # "notes"
	Vector2i(2, 28): {"scene": preload("res://garage/toolbox.tscn")}, #  "toolbox",
	Vector2i(6, 31): {"scene": null}, #  "fire_extinguisher",
	Vector2i(5, 33): {"scene": null}, #  "box_closed",
	Vector2i(4, 35): {"scene": null}, #  "loan_mower",
	Vector2i(12, 21): {"scene": preload("res://garage/door_wood.tscn")}, #  "door_wood",
	Vector2i(3, 31): {"scene": preload("res://garage/broom.tscn")}, #  "broom",
	Vector2i(4, 31): {"scene": preload("res://garage/shovel.tscn")},
	Vector2i(2, 35): {"scene": preload("res://garage/ladder.tscn")}, #  "ladder",
	Vector2i(2, 30): {"scene": preload("res://garage/paint.tscn")}, #  "paint",
	Vector2i(6, 30): {"scene": preload("res://garage/fuse_box.tscn")}, #  "fuse_box"
}

static func get_object(key: Vector2i) -> Dictionary:
	return mapping[key]
	
