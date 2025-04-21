
extends Area2D
class_name Ball

var speed = 300
var direction = Vector2.LEFT
# I believe this defines the direction where the ball will move.
func _physics_process(delta):
		speed += delta
		global_position += speed * direction * delta
# I believe this sets the ball's speed.
