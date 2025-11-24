extends Node2D

signal item_clicked

@export var interactable_list: Node2D
func _ready():
	for item in interactable_list.get_children():
		item.connect("clicked", _on_item_clicked)

func _on_item_clicked(item):
	emit_signal("item_clicked", item)
