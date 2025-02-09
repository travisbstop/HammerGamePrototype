extends TelekeneticObjectState

@export
var idle_state: TelekeneticObjectState

@export
var grabbing_state: TelekeneticObjectState

var mouse_position: Vector2

func process_physics(delta):
	if Input.is_action_pressed('click'):
		mouse_position = get_viewport().get_mouse_position()
		var direction = parent.position.direction_to(mouse_position)
		var distance = parent.position.distance_to(mouse_position)
		parent.constant_force = direction * 1000000 * delta
		
		if distance < 100:
			return grabbing_state
		return null
		
	return idle_state
