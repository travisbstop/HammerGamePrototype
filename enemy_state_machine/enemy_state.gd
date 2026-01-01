class_name EnemyState
extends Node

var parent: RigidBody2D
var force_towards_player: int
var max_speed: int

func enter() -> void:
	pass

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> EnemyState:
	return null

func process_frame(_delta: float) -> EnemyState:
	return null

func process_physics(_delta: float) -> EnemyState:
	return null
