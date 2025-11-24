extends Area2D

@export var offset: Vector2i

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D


func _ready() -> void:
	sprite_2d.offset = offset
	collision_polygon_2d.position = offset
