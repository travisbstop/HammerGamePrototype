extends Node

@export
var starting_state: EnemyState

var current_state: EnemyState

func init(parent: RigidBody2D, force_towards_player: int, max_speed: int, player: RigidBody2D) -> void:
	for child in get_children():
		child.parent = parent
		child.force_towards_player = force_towards_player
		child.max_speed = max_speed
		child.player = player
	change_state(starting_state)
	

func change_state(new_state: EnemyState) -> void:
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
