extends Node2D

@onready
var transition_handler = $TransitionHandler

var current_wave = 1
var wave_scene_instance: Node2D

func _ready() -> void:
	load_wave(current_wave, wave_scene_instance)
	
	transition_handler.transition_timer.timeout.connect(_on_transition_timer_timeout)

func _input(event: InputEvent) -> void:
	if (event.is_action("Restart")):
		get_tree().reload_current_scene()
	
func on_enemy_died() -> void:
	print("on enemy died called")
	var enemies = get_tree().get_nodes_in_group("enemies")
	var remaining_enemies = enemies.size() - 1
	if remaining_enemies == 0:
		current_wave += 1
		load_wave(current_wave, wave_scene_instance)
	

func connect_enemy_died_signal() -> void:
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.enemy_died.connect(on_enemy_died)
		
func load_wave(wave: int, wave_instance: Node2D):
	print("load wave called")
	if wave_instance:
		wave_instance.queue_free()
	var wave_scene = load("res://waves/wave_%d.tscn" %wave)
	if wave_scene:
		print("load wave exists")
		wave_instance = wave_scene.instantiate()
		wave_scene_instance = wave_instance
		transition_handler.transition(wave_instance)

func _on_transition_timer_timeout() -> void:
	print("transition timeout game.gd")
	add_child(wave_scene_instance)
	connect_enemy_died_signal()
	
