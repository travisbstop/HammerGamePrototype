extends RigidBody2D

@onready
var bullet_timer = $BulletTimer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("enemies")
	apply_impulse(Vector2.RIGHT.rotated(rotation) * 3000)


func _on_body_entered(_body: Node) -> void:
	bullet_timer.start()


func _on_bullet_timer_timeout() -> void:
	queue_free()
