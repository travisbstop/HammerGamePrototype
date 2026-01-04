extends EnemyState

@export
var shooting_state: EnemyState

var player_node: RigidBody2D

var aiming_timer_timed_out = false

var timer_node: Timer

func enter() -> void:
	player_node = get_tree().root.get_child(0).get_node('Player')
	parent.linear_velocity = Vector2(0, 0)
	timer_node = parent.get_node("AimingTimer")
	timer_node.start()

func exit() -> void:
	pass

# "aim" at the player until its time to shoot
func process_physics(_delta) -> EnemyState:
	#TODO: write some slightly more custom logic to apply torque to look at the player more naturally/physically
	parent.look_at(player_node.position)
	
	if aiming_timer_timed_out:
		aiming_timer_timed_out = false
		return shooting_state
	return null
	

func _on_aiming_timer_timeout() -> void:
	print("timed out")
	aiming_timer_timed_out = true
