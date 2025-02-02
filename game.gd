extends Node


var mouse_position: Vector2
var doodle: RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	doodle = $ChainContainer/ChainBeginning


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	



func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("click"):
		print('click event activated physics process')
		mouse_position = get_viewport().get_mouse_position()
		var direction = doodle.position.direction_to(mouse_position)
		var distance = doodle.position.distance_to(mouse_position)
		
		if distance <= 100:
			# doodle.constant_force = -direction * 50000 * (distance/50)
			doodle.linear_velocity = Vector2.ZERO
		else:
			doodle.constant_force = direction * 50000
		
		# doodle.constant_force = (direction * 10000)
		print(doodle)
	else:
		doodle.constant_force = Vector2.ZERO

#func _physics_process(delta: float) -> void:
	#if Input.is_action_pressed("click"):
		#var test_node: AnimatableBody2D = get_node("TestAnimateableBody2D")
		#mouse_position = get_viewport().get_mouse_position()
		#var direction = test_node.position.direction_to(mouse_position)
		#
		#test_node.move_and_collide(direction)
