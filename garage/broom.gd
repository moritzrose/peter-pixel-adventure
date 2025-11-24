extends Area2D

signal clicked

@export var description = "Besen"

func _on_mouse_entered() -> void:
	print(description)
