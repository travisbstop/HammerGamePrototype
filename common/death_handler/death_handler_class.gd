class_name DeathHandler
extends Node

var parent: RigidBody2D
var enemy_died: Signal

func handle_death() -> void:
	pass
	
func init(p: RigidBody2D, enemy_died_signal: Signal) -> void:
	parent = p
	enemy_died = enemy_died_signal
