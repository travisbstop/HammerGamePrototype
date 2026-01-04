class_name SimpleEnemy
extends RigidBody2D

@onready
var state_machine = $EnemyStateMachine

@export
var force_towards_player: int = 150000

@export
var max_speed: int = 1500

@export
var contact_handler: ContactHandler

signal enemy_died

func _ready() -> void:
	state_machine.init(self, force_towards_player, max_speed)
	add_to_group("enemies")
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var velocity_length := contact_handler.get_contact_speed(state)
		
	if velocity_length > 4000:
		queue_free()
		enemy_died.emit()
	
