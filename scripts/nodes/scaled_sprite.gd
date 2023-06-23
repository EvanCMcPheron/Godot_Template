class_name ScaledSprite
extends Sprite2D
@tool


func _ready() -> void:
	var s: int = ProjectSettings.get_setting("global/Scale")
	self.scale = Vector2(s, s)

