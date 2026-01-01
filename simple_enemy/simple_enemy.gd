class_name SimpleEnemy
extends RigidBody2D

@onready
var state_machine = $EnemyStateMachine

@export
var force: int = 100000

func _ready() -> void:
	state_machine.init(self, force)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
