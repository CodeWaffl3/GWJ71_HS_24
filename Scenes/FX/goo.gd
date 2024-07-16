extends Area2D

func _process(delta):
	if $".".has_overlapping_bodies():
		print("GOO!")

func _on_timer_timeout():
	queue_free()
