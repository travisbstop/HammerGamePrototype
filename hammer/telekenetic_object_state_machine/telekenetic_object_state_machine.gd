extends Node

@export
var starting_state: TelekeneticObjectState

var current_state: TelekeneticObjectState

func init(parent: TelekeneticObject, cursor_animatable_body_2d: AnimatableBody2D, cursor_pinjoint_2d: PinJoint2D, get_global_mouse_position: Callable) -> void:
	for child in get_children():
		child.parent = parent
		child.cursor_animatable_body_2d = cursor_animatable_body_2d
		child.cursor_pinjoint_2d = cursor_pinjoint_2d
		child.get_global_mouse_position = get_global_mouse_position
	change_state(starting_state)
	

func change_state(new_state: TelekeneticObjectState) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()
	
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)
		
func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
