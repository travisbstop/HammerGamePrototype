extends Node2D

@onready
var transition_timer = $TransitionTimer
	

func transition(wave_scene_instance: Node) -> void:
	var enemy_positions = get_enemies_from_parent(wave_scene_instance).map(get_enemy_position)
	var enemy_spawn_warning = load("res://assets/enemy_spawn_warning/enemy_spawn_warning.tscn")
	for enemy_position in enemy_positions:
		var enemy_spawn_warning_instance = enemy_spawn_warning.instantiate()
		enemy_spawn_warning_instance.position = enemy_position
		get_tree().root.get_child(0).add_child(enemy_spawn_warning_instance)
	print("transition_timer.start()")
	transition_timer.start()
		
	

func get_enemy_position(enemy: Node2D) -> Vector2:
	return enemy.position

func get_enemies_from_parent(parent: Node) -> Array[Node]:
	return parent.get_children().filter(func(node: Node):
		if node.is_in_group("enemies"):
			return true
		return false
	)
	


func _on_transition_timer_timeout() -> void:
	print("transition timeout transition_handler.gd")
	var enemy_spawn_warning_instances = get_tree().get_nodes_in_group("enemy-spawn-warnings")
	for instance in enemy_spawn_warning_instances:
		instance.queue_free()
