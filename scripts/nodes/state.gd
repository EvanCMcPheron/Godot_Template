class_name State
extends Node


func _entered() -> void:
	pass


func _state_process(delta: float) -> void:
	pass


func _exiting() -> void:
	#When this vfunc is overwritten, you must complete the transfer!!!
	finish()


func finish():
	get_parent().complete_state_transfer()
