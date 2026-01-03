class_name GunEnemy
extends RigidBody2D

@onready
var state_machine = $EnemyStateMachine

@export
var force_towards_player: int = 150000

@export
var max_speed: int = 1500

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
	var contact_count = state.get_contact_count()
	var total_velocity := Vector2.ZERO
	
	# TODO: switch impulse with contact velocity if possible since impulse is often erroneously 0
	for i in range(contact_count):
		if "Hammer" in state.get_contact_collider_object(i).to_string():
			var velocity := state.get_contact_local_velocity_at_position(i)
			#print("Impulse %d length: %f" %[i, impulse.length()])
			total_velocity += velocity
			
			print("contact velocity %d length: %f" %[i, velocity.length()])
	
	var velocity_length := total_velocity.length()
		
	if velocity_length > 4000:
		queue_free()
		enemy_died.emit()
	
