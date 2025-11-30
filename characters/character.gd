extends CharacterBody2D

@export var CHARACTER_SPEED = 132

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var speechbubble_timer: Timer = $SpeechbubbleTimer
@onready var speechbubble: Tooltip = $Speechbubble

signal items_in_reach_changed

var current_target
var animation_running
var items_in_reach: Dictionary = {}

func _ready() -> void:
	animated_sprite_2d.play("idle")
	current_target = global_position
	speechbubble.hide()

func _physics_process(_delta: float) -> void:
	if !animation_running:
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

func take_behind():
	animation_running = true
	animated_sprite_2d.play("pick_up_behind")

func take_ground():
	animation_running = true
	animated_sprite_2d.play("pick_up_behind")

func observe(observation):
	speechbubble.set_text(observation)
	speechbubble.show()
	speechbubble_timer.start(5)
	
	
func take_in_front():
	pass

func _on_animated_sprite_2d_animation_finished() -> void:
	animation_running = false
	
	if GameConstants.DEBUG:
		print("Animation finished")
	

func _on_animated_sprite_2d_animation_changed() -> void:
	if GameConstants.DEBUG:
		print("Animation changed to " + animated_sprite_2d.animation)


func _on_pick_up_range_area_entered(area: Area2D) -> void:
	if area.item_id:
		items_in_reach[area.item_id] = area.description
		items_in_reach_changed.emit()
		
		if GameConstants.DEBUG:
			print("Items in reach: " + str(items_in_reach))

func _on_pick_up_range_area_exited(area: Area2D) -> void:
	if area.item_id:
		items_in_reach.erase(area.item_id)
		
		if GameConstants.DEBUG:
			print(items_in_reach)

func can_reach(item_id) -> bool:
	if items_in_reach.has(item_id):
		return true
	return false


func _on_speechbubble_timer_timeout() -> void:
	speechbubble.hide()
	speechbubble.set_text("")
