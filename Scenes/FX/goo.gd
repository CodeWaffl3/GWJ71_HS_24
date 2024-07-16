extends Area2D

func _process(delta):
	print("GOO!")
	if $".".has_overlapping_bodies():
		print("GOO HIT!")

func _on_timer_timeout():
	queue_free()
