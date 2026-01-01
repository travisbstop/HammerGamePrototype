extends Node

@export
var starting_state: TelekeneticCharacterState

var current_state: TelekeneticCharacterState

func init(parent: TelekeneticCharacter, get_global_mouse_position: Callable) -> void:
	for child in get_children():
		child.parent = parent
		child.get_global_mouse_position = get_global_mouse_position
	change_state(starting_state)
	

func change_state(new_state: TelekeneticCharacterState) -> void:
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
