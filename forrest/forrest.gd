extends Node2D

signal item_clicked
signal show_item_tooltip

@export var interactable_list: Node2D

var bridge_repaired

func _ready():
	bridge_repaired = false

	for item in interactable_list.get_children():
		item.connect("clicked", _on_item_clicked)
		item.connect("hovering", _on_item_hovering)

func _on_item_clicked(item):
	emit_signal("item_clicked", item)

func _on_item_hovering(tooltip: Tooltip):
	if tooltip:
		show_item_tooltip.emit(tooltip)
	else:
		show_item_tooltip.emit(null)
		
