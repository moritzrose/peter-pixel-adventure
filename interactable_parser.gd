extends Node2D

@export var object_mapping: InteractableMapping
@export var tile_map_layer: TileMapLayer:
	set(new_layer):
		tile_map_layer = new_layer
		create_objects()

func create_objects():
	for cell_pos in tile_map_layer.get_used_cells():
		var obj_id:Vector2i = tile_map_layer.get_cell_atlas_coords(cell_pos)
		add_object(obj_id, cell_pos)
	tile_map_layer.clear()
		
func add_object(id, pos):
	var obj = InteractableMapping.get_object(id)
	if obj and obj.get("scene"):
		var scene = obj.get("scene")
		var new_obj = scene.instantiate()
		new_obj.position = pos * GameConstants.TILE_SIZE
		add_child(new_obj)
