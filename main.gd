extends VBoxContainer

var DEBUG: bool = true

var current_level: Node2D
var current_action

enum {OPEN, CLOSE, USE, TALK, PUSH, PULL, LOOK, TAKE, GIVE}

@onready var inventory: GridContainer = $Panel/HBoxContainer/MarginContainer/Inventory
@onready var levelcontainer: MarginContainer = $Levelcontainer
@onready var character: CharacterBody2D = $Levelcontainer/Character

func _ready() -> void:
	current_level = levelcontainer.get_child(0)
	current_level.connect("item_clicked", on_item_clicked)
	
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
		take_item(item)
	elif current_action == GIVE:
		give_item(item)

func open_item(item):
	var success = item.open()
	
	if DEBUG:
		if success:
			print(item.description + " has been opened")
		else:
			print(item.description + " was already open")

func close_item(item):
	var success = item.close()
	
	if DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")

func use_item(item):
	var success = item.use()
	
	if DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")

func talkTo_item(item):
	var success = item.talkTo()
	
	if DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")

func push_item(item):
	var success = item.push()
	
	if DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")

func pull_item(item):
	var success = item.pull()
	
	if DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")

func lookAt_item(item):
	var success = item.look_at()
	
	if DEBUG:
		if success:
			print(item.description + " has been closed")
		else:
			print(item.description + " was already closed")

func take_item(item):
	var success = item.take()
	
	if success:
		var inventory_item: Label = Label.new()
		inventory_item.text = item.description
		inventory.add_child(inventory_item)
		if DEBUG:
			print("Took " + item.description)
		else:
			print("Could not take " + item.description)

func give_item(item):
	var success = item.give()
	
	if DEBUG:
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
