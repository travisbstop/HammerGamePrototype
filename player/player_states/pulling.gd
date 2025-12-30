extends TelekeneticCharacterState

@export
var idle_state: TelekeneticCharacterState

var mouse_position: Vector2

func process_physics(delta):
	if Input.is_action_pressed('right_click'):
		mouse_position = get_viewport().get_mouse_position()
		var direction = parent.position.direction_to(mouse_position)
		var distance = parent.position.distance_to(mouse_position)
		parent.constant_force = direction * 1000000/2 * delta
		
		if distance < 100:
			return idle_state
		return null
		
	return idle_state
