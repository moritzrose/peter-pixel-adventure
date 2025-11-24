extends Area2D

signal clicked

@export var description = "Werkzeugkiste"

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var is_filled: bool
var is_open: bool

func _ready() -> void:
	is_filled = true
	is_open = false
	animated_sprite_2d.frame = 0
	
func watch():
	return true
	
func use():
	return false

func use_with(item: String):
	return false

func open():
	if !is_open:
		is_open = true
		update_sprite()
		return true
	return false
	
func close():
	if is_open:
		is_open = false
		update_sprite()
		return true

func take():
	if is_open and is_filled:
		is_filled = false
		update_sprite()
		return true
	return false

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		clicked.emit(self)

func update_sprite():
	if is_open:
		if is_filled:
			animated_sprite_2d.frame = 1
		else:
			animated_sprite_2d.frame = 2
	else:
		animated_sprite_2d.frame = 0



func _on_mouse_entered() -> void:
	print(description)
