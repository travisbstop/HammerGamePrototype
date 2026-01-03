extends Node2D


var current_wave = 1
var wave_scene_instance: Node2D

func _ready() -> void:
	load_wave(current_wave, wave_scene_instance)
	connect_enemy_died_signal()

func _input(event: InputEvent) -> void:
	if (event.is_action("Restart")):
		get_tree().reload_current_scene()
	
func on_enemy_died() -> void:
	var enemies = get_tree().get_nodes_in_group("enemies")
	var remaining_enemies = enemies.size() - 1
	if remaining_enemies == 0:
		current_wave += 1
		load_wave(current_wave, wave_scene_instance)
		connect_enemy_died_signal()
	


func connect_enemy_died_signal() -> void:
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.enemy_died.connect(on_enemy_died)
		
func load_wave(wave: int, wave_instance: Node2D):
	if wave_instance:
		wave_instance.queue_free()
	var wave_scene = load("res://waves/wave_%d.tscn" %wave)
	if wave_scene:
		wave_instance = wave_scene.instantiate()
		add_child(wave_instance)
	
