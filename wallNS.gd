extends Area2D

signal ball_out(wallNS)

export (bool) var bouncy = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_wallNS_area_entered(area):
	if area is Ball:
		if bouncy:
			area.direction.y *= -1
		else:
			emit_signal("ball_out", Ball)
			area.queue_free()
