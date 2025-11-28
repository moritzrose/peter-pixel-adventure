extends Node

static var mapping = {
	
	#forrest
	Vector2i(7,8): {"scene": preload("res://forrest/bridge.gd")},
	Vector2i(2,7): {"scene": null},
	Vector2i(2,5): {"scene": null},
	Vector2i(16,5): {"scene": null},
}

static func get_object(key: Vector2i) -> Dictionary:
	if mapping.has(key):
		return mapping[key]
	return Dictionary()
