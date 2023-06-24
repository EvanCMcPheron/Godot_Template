class_name TouchCamera2D
extends Camera2D


@export var zoom_speed: float = 1.003
@export var max_twist: float = 15.0 # In degrees

@onready var dev_panel = get_node("/root/scene_manager/dev_panel")



func _vector_projection_scalar_signed_length(projecting_vec: Vector2, terminal_vec: Vector2) -> float:
	var projected_vec = projecting_vec.project(terminal_vec)
	# ~= Vector2.zero if value should be positive, used instead of comparison to provide margin for error
	var dif_normalized_vec = projected_vec.normalized() - terminal_vec.normalized()
	if abs(dif_normalized_vec.x) < 0.5 and abs(dif_normalized_vec.y) < 0.5:
		return projected_vec.length()
	return -projected_vec.length()

func _calculate_pinch(raw_input: RawGesture) -> float:
	var drag1_rel = raw_input.drags[0].relative
	var drag2_rel = raw_input.drags[1].relative
	var drag1_pos = raw_input.drags[0].position
	var drag2_pos = raw_input.drags[1].position
	var centroid = (drag1_pos + drag2_pos) * 0.5
	var drag1_pinch_vec = drag1_rel.project(drag1_pos - centroid)
#	var drag_1_pinch = 
	return (
		_vector_projection_scalar_signed_length(drag1_rel, drag1_pos - centroid)
		+ _vector_projection_scalar_signed_length(drag2_rel, drag2_pos - centroid)
		)

func _get_centroid(raw_input: RawGesture) -> Vector2:
	var sum := Vector2()
	for key in raw_input.drags.keys():
		sum += raw_input.drags[key].position
	return sum / raw_input.drags.size()

func _pinch_zoom(centroid: Vector2, pinch: float) -> void:
	self.zoom *= pow(self.zoom_speed, pinch)
	var offset = centroid - (get_viewport_rect().size * 0.5)
	self.position += offset*(pow(zoom_speed,pinch)-1.0) / self.zoom

func _input(event):
#	dev_panel.showing = true;
	if dev_panel.has_method("set_entry"): 
		if event is InputEventSingleScreenDrag:
			self.position -= event.relative / self.zoom
		elif event is InputEventMultiScreenDrag:
			if event.fingers == 2:
				_pinch_zoom(_get_centroid(event.raw_gesture), _calculate_pinch(event.raw_gesture))
			self.position -= event.relative / self.zoom
		elif event is InputEventMultiScreenLongPress:
#			dev_panel.set_entry("input", "InputEventMultiScreenLongPress")
			pass
		elif event is InputEventMultiScreenSwipe:
#			dev_panel.set_entry("input", "InputEventMultiScreenSwipe")
			pass
		elif event is InputEventMultiScreenTap:
#			dev_panel.set_entry("input", "InputEventMultiScreenTap")
			pass
		elif event is InputEventScreenCancel:
#			dev_panel.set_entry("input", "InputEventScreenCancel")
			pass
		elif event is InputEventScreenPinch:
			self._pinch_zoom(event.position, event.relative)
		elif event is InputEventScreenTwist:
#			dev_panel.set_entry("input", "InputEventMultiScreenLongTwist")
			pass
		elif event is InputEventSingleScreenLongPress:
#			dev_panel.set_entry("input", "InputEventSingleScreenDrag")
			pass
		elif event is InputEventSingleScreenLongPress:
#			dev_panel.set_entry("input", "InputEventSingleScreenLongPress")
			pass
		elif event is InputEventSingleScreenSwipe:
#			dev_panel.set_entry("input", "InputEventSingleScreenSwipe")
			pass
		elif event is InputEventSingleScreenTap:
#			dev_panel.set_entry("input", "InputEventSingleScreenTap")
			pass
		elif event is InputEventSingleScreenTouch:
#			dev_panel.set_entry("input", "InputEventSingleScreenTouch")
			pass


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass
