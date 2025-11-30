extends Area2D

signal clicked
signal hovering

@export var description = "Zweig"
@onready var tooltip: Tooltip = $Tooltip

var item_id = get_instance_id()

func _ready() -> void:
	tooltip.set_text(description)

func _on_mouse_entered() -> void:
	hovering.emit(tooltip)
	tooltip.show()
	
func _on_mouse_exited() -> void:
	hovering.emit(null)
	tooltip.hide()
	
func take():
	queue_free()
	return true

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		clicked.emit(self)
