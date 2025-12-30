extends TelekeneticCharacterState


@export
var pulling_state: TelekeneticCharacterState

var last_velocity: Vector2

var hover_direction = 0
var hover_time = 0

func enter() -> void:
	parent.constant_force = Vector2.ZERO

func exit() -> void:
	parent.linear_damp = 0.1

func process_physics(delta) -> TelekeneticCharacterState:
	if Input.is_action_pressed('right_click'):
		return pulling_state
	
	hover_time += delta
	if hover_time <= 2:
		hover_direction = 0
	elif hover_time > 2:
		hover_direction = 1
		if hover_time >= 4:
			hover_time = 0
	
	
	if hover_direction == 0:
		parent.add_constant_force(Vector2.UP * delta * 25)
	else:
		parent.add_constant_force(Vector2.DOWN * delta * 25)
		
	parent.linear_damp = 5
	
	
	return null
