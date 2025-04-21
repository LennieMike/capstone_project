extends Area2D

signal ball_out(wallW)

export (bool) var bouncy = false

func _on_wallW_area_entered(area):
	if area is Ball:
		if bouncy:
			area.direction.x *= -1
		else:
			emit_signal("ball_out", name)
			# area.queue_free()
