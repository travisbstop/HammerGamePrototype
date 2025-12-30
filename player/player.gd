class_name TelekeneticCharacter
extends RigidBody2D

@onready
var state_machine = $TelekeneticCharacterStateMachine

func _ready() -> void:
	state_machine.init(self, get_global_mouse_position)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
