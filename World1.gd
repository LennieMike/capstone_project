extends Node2D


onready var ball_container = $ball_Spawner
onready var ball_spawn_location = $ball_Spawner/respawn_point
onready var ball = $ball_Spawner/ball

onready var score_label = $background_objects/score_label
const WIN_NUMBER = 2
var score = Vector2(0,0)

onready var song1 = $audio/music_node/tembrerossosangue

export var nums = 14


func _on_wallW_ball_out(wall_name):
	match wall_name:
		"wallE":
			score.x += 1
		"wallW":
			score.y += 1
	print(score)
	update_score_label()
	#missing timer call below, fixed now
	yield(get_tree().create_timer(2.0), "timeout")
	if score.x >= WIN_NUMBER || score.y >= WIN_NUMBER:
		game_over()
	else:
		update_ball_position()

#Ost.
onready var world_theme = $audio/music_node
#When game starts...
func _ready():
	song1.play()









func update_ball_position():
	ball.direction = Vector2.LEFT
	ball.global_position = ball_spawn_location.global_position

func update_score_label():
	score_label.text = str(score.x) + " - " + str(score.y)

func game_over():
	print("THE GAME IS OVER")
	if score.x == WIN_NUMBER:
		print("p1 wins")
		score_label.text = "Player 1 wins!"
	elif score.y == WIN_NUMBER:
		print("p2 wins")
		score_label.text = "Player 2 wins!"
	yield(get_tree().create_timer(2.0), "timeout")
	score = Vector2(0,0)
	update_score_label()
	update_ball_position()

#function not properly connected, you connected area_entered and not the signal_out function
#player 1 would always receive the point regardless of who scored.
#your score.y and score.x were incorrectly placed
#working now
func _on_wallE_ball_out(wall_name):
	match wall_name:
		"wallE":
			score.x += 1
		"wallW":
			score.y += 1
	print(score)
	update_score_label()
	#missing timer call below, fixed now
	yield(get_tree().create_timer(2.0), "timeout")
	if score.x >= WIN_NUMBER || score.y >= WIN_NUMBER:
		game_over()
	else:
		update_ball_position()
