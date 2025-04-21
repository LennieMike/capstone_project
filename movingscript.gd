extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var speed = 370
# This defines a function  named speed; it'll be used when the player moves up or down.
func _physics_process(delta):
	if Input.is_action_pressed("p1_move_up"):
		global_position.y = global_position.y - speed * delta
	if Input.is_action_pressed("p1_move_down"):
		global_position.y = global_position.y + speed * delta
		# These define the movement speed for the padel to allow it to move.
	global_position.y = clamp(global_position.y, 68, 530)
 # This limits to padel's movement to prevent it from going off-screen.


func _on_p1_area_entered(area):
	if area is Ball:
		area.direction.x *= -1
		var ball_angle = area.global_position.y - global_position.y
		if ball_angle > 0:
			area.direction.y += 1
		elif ball_angle < 0:
			area.direction.y -= 1
		else:
			area.direction.y = 0
