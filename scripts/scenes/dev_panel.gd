extends CanvasLayer

@export var entries := {
}
@export var showing := false


func _process(_delta):
	var buf := "";
	if showing:
		$"container/Label".text = str(entries)

func cart_to_polar(point: Vector2):
	
