extends TelekeneticObjectState

@export
var idle_state: TelekeneticObjectState

var mouse_position

func enter() -> void:
	parent.constant_force = Vector2.ZERO
	mouse_position = get_global_mouse_position.call()
	cursor_animatable_body_2d.position = mouse_position

func exit() -> void:
	cursor_pinjoint_2d.node_b = ''

'''
Connect the telekenetic object to the pinjoint that is always positioned at the players cursor so that it is being "grabbed"
'''
func process_physics(_delta) -> TelekeneticObjectState:
	mouse_position = get_global_mouse_position.call()
	cursor_pinjoint_2d.node_b = parent.get_path()
	if Input.is_action_pressed('click'):
		cursor_animatable_body_2d.position = mouse_position
		return null

	return idle_state
