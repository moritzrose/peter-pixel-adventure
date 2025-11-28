extends Area2D

signal clicked

@export var description = "Kaputte Brücke"

func _on_mouse_entered() -> void:
	print(description)
	

func _on_area_entered(area: Area2D) -> void:
	print("Player has fallen down the broken bridge")
