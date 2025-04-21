extends Area2D

signal ball_out(wallEW)

export (bool) var bouncy = false




func _on_wallEW_area_entered(area):
	if area is Ball:
		if bouncy:
			area.direction.x *= -1
		else:
			emit_signal("ball_out", Ball)
			# area.queue_free()
