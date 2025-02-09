extends Node


var mouse_position: Vector2
var doodle: RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	doodle = $Hammer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


# hammer movement version 1
#func _physics_process(delta: float) -> void:
	#if Input.is_action_pressed("click"):
		#print('click event activated physics process')
		#mouse_position = get_viewport().get_mouse_position()
		#var direction = doodle.position.direction_to(mouse_position)
		#var distance = doodle.position.distance_to(mouse_position)
		#
		#if distance <= 100:
			#doodle.linear_velocity = Vector2.ZERO
		#else:
			#doodle.constant_force = direction * 50000
		#
		#print(doodle)
	#else:
		#doodle.constant_force = Vector2.ZERO


@onready
var cursor_animatable_body_2d: AnimatableBody2D = $CursorAnimatableBody2D

@onready
var cursor_pinjoint_2d: PinJoint2D = $CursorAnimatableBody2D/CursorPinjoint2D

var hammer_touched_cursor_after_click = false


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("click"):
		mouse_position = get_viewport().get_mouse_position()
		if !hammer_touched_cursor_after_click:
			var direction = doodle.position.direction_to(mouse_position)
			var distance = doodle.position.distance_to(mouse_position)
			doodle.constant_force = direction * 1000000 * delta
			# could make Area2D appear at cursor, and if Hammer enters Area2D then we know to activate this state. More accurate
			if distance < 100:
				hammer_touched_cursor_after_click = true
				doodle.constant_force = Vector2.ZERO
				cursor_animatable_body_2d.position = mouse_position
		else:
			cursor_animatable_body_2d.position = mouse_position
			cursor_pinjoint_2d.node_b = doodle.get_path()
	else:
		doodle.constant_force = Vector2.ZERO
		hammer_touched_cursor_after_click = false
		cursor_pinjoint_2d.node_b = ''
