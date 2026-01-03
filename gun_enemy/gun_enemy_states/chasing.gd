extends EnemyState

var player_node: RigidBody2D

@export
var aiming_state: EnemyState

func enter() -> void:
	player_node = get_tree().root.get_child(0).get_node('Player')

func exit() -> void:
	pass

#move towards the player until they are within 300 units, at which point switch to "aiming" state
func process_physics(delta) -> EnemyState:
	#TODO: this movement logic is shared between both of the "chasing" enemy states.
	#get rid of this duplication by using inheritance, composition, or some other mechanism
	var direction_towards_player = parent.position.direction_to(player_node.position)
	var acceleration = (direction_towards_player * force_towards_player * delta)/parent.mass
	var new_velocity = parent.linear_velocity + acceleration
	
	if parent.linear_velocity.length() < max_speed or new_velocity.length() < max_speed:
		parent.apply_force(acceleration)
	
	if parent.position.distance_to(player_node.position) < 1000:
		return aiming_state
	
	return null
