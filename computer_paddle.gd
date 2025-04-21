extends KinematicBody2D

const SPEED = 370
#This sets the paddle's speed.
onready var ball_ptr = get_node("/root/World1")
#This checks what the parent node, which allows the code to track the ball.

func _process(delta):
	if is_instance_valid(ball_ptr.ball):
		move_and_slide(Vector2(0, global_position.y *opponent_direction())*SPEED * delta)
	global_position.y = clamp(global_position.y, 0, 520)

func opponent_direction():
	if abs(ball_ptr.ball.position.y - position.y) > 10:
		if ball_ptr.ball.position.y > position.y: return 1
		else: return -1
	else: return 0


func _on_Area2D_area_entered(area):
	if area is Ball:
		area.direction.x *= -1
		var ball_angle = area.global_position.y - global_position.y
		if ball_angle > 0:
			area.direction.y += 1
		elif ball_angle < 0:
			area.direction.y -= -1
		else:
			area.direction.y=0
