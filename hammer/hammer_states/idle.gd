extends TelekeneticObjectState


@export
var pulling_state: TelekeneticObjectState

func enter() -> void:
	parent.constant_force = Vector2.ZERO

func process_physics(delta) -> TelekeneticObjectState:
	if Input.is_action_pressed('click'):
		return pulling_state
	return null
