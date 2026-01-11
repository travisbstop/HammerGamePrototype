class_name GunEnemy
extends RigidBody2D

@onready
var state_machine = $EnemyStateMachine

@export
var force_towards_player: int = 150000

@export
var max_speed: int = 1500

@export
var contact_handler: ContactHandler

@export
var death_handler: DeathHandler

var player: RigidBody2D

signal enemy_died

func _ready() -> void:
	state_machine.init(self, force_towards_player, max_speed, player)
	death_handler.init(self, enemy_died)
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
		death_handler.handle_death()
	
