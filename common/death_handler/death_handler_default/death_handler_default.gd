extends DeathHandler

func handle_death() -> void:
	enemy_died.emit()
	parent.queue_free()
	var enemy_debris = load("res://assets/enemy_debris/enemy_debris.tscn")
	var enemy_debris_instance = enemy_debris.instantiate()
	enemy_debris_instance.position = parent.position
	get_tree().root.get_child(0).add_child(enemy_debris_instance)
