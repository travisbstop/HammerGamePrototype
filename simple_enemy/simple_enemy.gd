class_name SimpleEnemy
extends RigidBody2D

@onready
var state_machine = $EnemyStateMachine

@export
var force_towards_player: int = 150000

@export
var max_speed: int = 1500

func _ready() -> void:
	state_machine.init(self, force_towards_player, max_speed)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
