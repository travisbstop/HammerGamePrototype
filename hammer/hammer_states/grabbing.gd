extends TelekeneticObjectState

@export
var idle_state: TelekeneticObjectState

var mouse_position

func enter() -> void:
	parent.constant_force = Vector2.ZERO
	mouse_position = get_viewport().get_mouse_position()
	cursor_animatable_body_2d.position = mouse_position
	
func exit() -> void:
	cursor_pinjoint_2d.node_b = ''

func process_physics(delta) -> TelekeneticObjectState:
	mouse_position = get_viewport().get_mouse_position()
	cursor_pinjoint_2d.node_b = parent.get_path()
	if Input.is_action_pressed('click'):
		cursor_animatable_body_2d.position = mouse_position
		return null

	return idle_state
