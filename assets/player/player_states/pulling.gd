extends TelekeneticCharacterState

@export
var idle_state: TelekeneticCharacterState

var mouse_position: Vector2

func process_physics(delta):
	if Input.is_action_pressed("right_click") and not Input.is_action_pressed("click"):
		mouse_position = get_global_mouse_position.call()
		var direction = parent.position.direction_to(mouse_position)
		var distance = parent.position.distance_to(mouse_position)
		parent.constant_force = direction * 5000000/2 * delta
		
		if distance < 100:
			return idle_state
		return null
		
	return idle_state
