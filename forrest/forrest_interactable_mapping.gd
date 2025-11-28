extends Node

static var mapping = {
	
	#forrest
	Vector2i(1,28): {"scene": preload("res://forrest/stick.tscn")},
	Vector2i(24,15): {"scene": null}, #stone
	Vector2i(16,5): {"scene": null}, #well
}

static func get_object(key: Vector2i) -> Dictionary:
	if mapping.has(key):
		return mapping[key]
	return Dictionary()
