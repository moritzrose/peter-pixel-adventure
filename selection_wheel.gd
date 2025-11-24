extends Control

@export var font: Font
@export var radius: int

signal use
signal open
signal close
signal talk
signal look

var actions: Array[String] = ["Benutzen", "Öffnen", "Schließen", "Reden", "Schauen"]

var selected_action

func _ready() -> void:
	hide()
		
func _process(delta: float) -> void:
	
	if visible == true:
		var mouse_pos = get_global_mouse_position()
		var mouse_radius = mouse_pos.length()
		print(mouse_pos.angle())
		
		if mouse_radius < radius:
			var mouse_rad = fposmod(mouse_pos.angle() * -1, TAU)
			selected_action = ceil(mouse_rad / TAU) * len(actions)
			print(selected_action)
			
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			# auf Textkörper -> emit signal			
			hide()		
			
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		queue_redraw()
		show()

	

		
		
func _draw() -> void:
	var mouse_pos_x = get_local_mouse_position().x
	var mouse_pos_y = get_local_mouse_position().y
	
	for i in range(len(actions)):
		var rad = TAU * i / len(actions)
		var pos_x = mouse_pos_x + radius * cos(rad) 
		var pos_y = mouse_pos_y + radius * sin(rad) 
		draw_string(font, Vector2(pos_x, pos_y) , actions[i])
