extends EnemyState

@export
var aiming_state: EnemyState

@export
var chasing_state: EnemyState


var player_node: RigidBody2D

func enter() -> void:
	player_node = get_tree().root.get_child(0).get_node('Player')

func exit() -> void:
	pass
	
func process_physics(_delta) -> EnemyState:
	
	var bullet_scene = load("res://assets/bullet/bullet.tscn")
	var bullet_scene_instance = bullet_scene.instantiate()
	if bullet_scene_instance:
		var dir = parent.global_position.direction_to(player_node.global_position)
		bullet_scene_instance.position = parent.position + 75 * dir
		bullet_scene_instance.rotation = parent.rotation
		get_tree().root.get_child(0).add_child(bullet_scene_instance)
	
	
	if parent.position.distance_to(player_node.position) < 1000:
		return aiming_state
	return chasing_state
