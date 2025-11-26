extends CharacterBody2D

@export var CHARACTER_SPEED = 150

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var current_target = position

func _ready() -> void:
	animated_sprite_2d.play("idle")
	print(current_target)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_global_mouse_position()
		if mouse_pos.y < 480:
			current_target = Vector2(get_global_mouse_position().x, GameConstants.LEVEL_CHARACTER_HEIGHT)
			print("Command: Walk to " + str(current_target))

func _process(delta: float) -> void:
	velocity = position.direction_to(current_target) * CHARACTER_SPEED
	if position.distance_to(current_target) > 10:
		var walk_left = current_target.x < position.x
		if walk_left:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("walk")
		move_and_slide()
	else:
		animated_sprite_2d.play("idle")
