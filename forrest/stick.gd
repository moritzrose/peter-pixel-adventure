extends Area2D

signal clicked

@export var description = "Zweig"

var item_id = get_instance_id()

func _on_mouse_entered() -> void:
	# show tooltip with item description
	print(description, global_position)
	
func take():
	queue_free()
	return true

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		clicked.emit(self)
