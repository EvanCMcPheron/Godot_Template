class_name StateMachine
extends Node


@export var entry_point: String


var _state: State = null
var _state_holder: State = null


func complete_state_transfer() -> void:
	_state = _state_holder
	_state._entered()


func _ready() -> void:
	_state = get_node(entry_point)
	_state._entered()


func _process(delta: float) -> void:
	_state._state_process(delta)


func request_state(name: String) -> void:
	_state_holder = get_node(name)
	_state._exiting()
