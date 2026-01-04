extends ContactHandler

# given physics processing state, get total contact speed from contacts
func get_contact_speed(state: PhysicsDirectBodyState2D) -> float:
	var contact_count = state.get_contact_count()
	var total_velocity := Vector2.ZERO
	
	for i in range(contact_count):
		if "Hammer" in state.get_contact_collider_object(i).to_string():
			var velocity := state.get_contact_local_velocity_at_position(i)
			total_velocity += velocity
			#print("contact velocity %d length: %f" %[i, velocity.length()])
	
	return total_velocity.length()
