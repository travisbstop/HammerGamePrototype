extends EnemyState

func exit() -> void:
	pass
	
func process_physics(delta) -> EnemyState:
	var direction_towards_player = parent.position.direction_to(player.position)
	var acceleration = (direction_towards_player * force_towards_player * delta)/parent.mass

	var new_velocity = parent.linear_velocity + acceleration
	#
	if parent.linear_velocity.length() < max_speed or new_velocity.length() < max_speed:
		parent.apply_force(acceleration)
	
	
	return null
