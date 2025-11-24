extends Panel

signal action_clicked

enum actions {USE, OPEN}

func _on_open_pressed() -> void:
	action_clicked.emit(actions.OPEN)


func _on_use_pressed() -> void:
	action_clicked.emit(Actions.OPEN)
