class_name TelekeneticObject
extends Node2D

@onready
var state_machine = $TelekeneticObjectStateMachine

# animated body that follows the cursor while in the grabbing state and connects to the hammer for grabbing
@export
var cursor_animatable_body_2d: AnimatableBody2D

# pinjoint node used for grabbing the hammer
@export
var cursor_pinjoint_2d: PinJoint2D



func _ready() -> void:
	state_machine.init(self, cursor_animatable_body_2d, cursor_pinjoint_2d, get_global_mouse_position)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
