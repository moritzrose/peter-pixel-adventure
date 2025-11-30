extends VBoxContainer

var current_level: Node2D
var current_action
var current_tooltip: Tooltip
var future_task: FutureTask

enum {OPEN, CLOSE, USE, TALK, PUSH, PULL, LOOK, TAKE, GIVE, WALK}

@onready var inventory: GridContainer = $Panel/HBoxContainer/MarginContainer/Inventory
@onready var levelcontainer: MarginContainer = $Levelcontainer
@onready var character: CharacterBody2D = $Levelcontainer/Character

func _ready() -> void:
	current_level = levelcontainer.get_child(0)
	current_level.connect("item_clicked", on_item_clicked)
	current_level.connect("show_item_tooltip", on_show_item_tooltip)
	current_action = WALK

func _process(delta: float) -> void:
	if current_tooltip:
		var mouse_pos = get_global_mouse_position()
		current_tooltip.global_position = mouse_pos
		
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_global_mouse_position()
		if mouse_pos.y < 480:
			var current_target = Vector2(get_global_mouse_position().x, GameConstants.LEVEL_WALKING_HEIGHT)
			character.current_target = current_target
			future_task = null
			print("Walk to " + str(current_target))

func on_show_item_tooltip(tooltip: Tooltip):
	if tooltip:
		current_tooltip = tooltip
	else:
		current_tooltip = null
		

func on_item_clicked(item):
	if current_action == OPEN:
		open_item(item)
	elif current_action == CLOSE:
		close_item(item)
	elif current_action == USE:
		use_item(item)
	elif current_action == TALK:
		talkTo_item(item)
	elif current_action == PUSH:
		push_item(item)
	elif current_action == PULL:
		pull_item(item)
	elif current_action == LOOK:
		lookAt_item(item)
	elif current_action == TAKE:
		if character.can_reach(item.item_id):
			take_item(item)
		else:
			future_task = FutureTask.new()
			future_task.item_id = item.item_id
			future_task.item = item
			future_task.action = Callable(self, "take_item")
			print("Going closer to " + item.description + " to execute: " + str(current_action))
	elif current_action == GIVE:
		give_item(item)

func open_item(item):
	var success = item.open()
	
	if GameConstants.DEBUG:
		if success:
			print(item.description + " has been opened")
		else:
			print(item.description + " was already open")

func close_item(item):
	var success = item.close()
	
	if GameConstants.DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")

func use_item(item):
	var success = item.use()
	
	if GameConstants.DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")

func talkTo_item(item):
	var success = item.talkTo()
	
	if GameConstants.DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")

func push_item(item):
	var success = item.push()
	
	if GameConstants.DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")

func pull_item(item):
	var success = item.pull()
	
	if GameConstants.DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")

func lookAt_item(item):
	var observation = item.lookAt()
	character.observe(observation)
	
	if GameConstants.DEBUG:
		if observation:
			print("Observation of " + item.description + ": " + observation)
		else:
			print("Could not observe " + item.description)

func take_item(item):
	var success = item.take()
	character.take_behind()
	
	if success:
		var inventory_item: Label = Label.new()
		inventory_item.text = item.description
		inventory.add_child(inventory_item)
		if GameConstants.DEBUG:
			print("Took " + item.description)
		else:
			print("Could not take " + item.description)

func give_item(item):
	var success = item.give()
	
	if GameConstants.DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")


func _on_use_pressed() -> void:
	current_action = USE


func _on_open_pressed() -> void:
	current_action = OPEN


func _on_close_pressed() -> void:
	current_action = CLOSE


func _on_take_pressed() -> void:
	current_action = TAKE


func _on_pull_pressed() -> void:
	current_action = PULL


func _on_give_pressed() -> void:
	current_action = GIVE


func _on_talk_to_pressed() -> void:
	current_action = TALK


func _on_push_pressed() -> void:
	current_action = PUSH




func _on_character_items_in_reach_changed() -> void:
	if future_task:
		if character.can_reach(future_task.item_id):
			print("Execute Callable " + str(future_task.action.get_method()) + " on " + str(future_task.item_id) + ": " + future_task.item.description)
			future_task.action.call(future_task.item)			
			future_task = null


func _on_look_at_pressed() -> void:
	current_action = LOOK
