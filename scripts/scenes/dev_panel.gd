extends CanvasLayer

@export var entries := {
}
@export var showing := false

func set_entry(key, value) -> void:
	self.entries[key] = value

func _process(_delta):
	if showing:
		var buf = "\n"
		for key in self.entries.keys():
			buf += "  " + str(key) + ": " + str(self.entries[key]) + "\n"
		$"container/Label".text = buf

func cart_to_polar(point: Vector2):
	pass
