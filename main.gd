extends VBoxContainer

var DEBUG: bool = true

var current_level: Node2D
var current_action

enum {OPEN, CLOSE, USE, TALK, PUSH, PULL, LOOK, TAKE}

@onready var levelcontainer: MarginContainer = $Levelcontainer

func _ready() -> void:
	current_level = levelcontainer.get_child(0)
	current_level.connect("item_clicked", on_item_clicked)

	
func on_item_clicked(item):
	if current_action == OPEN:
		open_item(item)
	if current_action == CLOSE:
		close_item(item)

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
			
func _on_use_pressed() -> void:
	current_action = USE


func _on_open_pressed() -> void:
	current_action = OPEN


func _on_close_pressed() -> void:
	current_action = CLOSE


func _on_take_pressed() -> void:
	current_action = TAKE
