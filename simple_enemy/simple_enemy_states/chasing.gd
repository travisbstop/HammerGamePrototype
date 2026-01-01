extends EnemyState

var player_node: RigidBody2D

func enter() -> void:
	player_node = get_tree().root.get_child(0).get_node('Player')

func exit() -> void:
	pass
	
func process_physics(delta) -> EnemyState:
	var direction_towards_player = parent.position.direction_to(player_node.position)
	var acceleration = (direction_towards_player * force_towards_player * delta)/parent.mass

	var new_velocity = parent.linear_velocity + acceleration
	#
	if parent.linear_velocity.length() < max_speed or new_velocity.length() < max_speed:
		parent.apply_force(acceleration)
	
	
	return null
