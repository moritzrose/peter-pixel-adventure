extends PanelContainer

class_name Tooltip

@onready var content: RichTextLabel = $Content

func set_text(tooltip):
	content.text = tooltip
