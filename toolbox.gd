extends Area2D

enum State { CLOSED_FILLED, OPEN_FILLED, OPEN_EMPTY, CLOSED_EMPTY }

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var state: State

func _ready() -> void:
	state = State.CLOSED_FILLED
	animated_sprite_2d.frame = 0
	
func _on_mouse_entered() -> void:
	state = State.OPEN_FILLED
	animated_sprite_2d.frame = 1
	
	
func _on_mouse_exited() -> void:
	state = State.CLOSED_FILLED
	animated_sprite_2d.frame = 0
