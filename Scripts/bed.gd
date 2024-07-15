extends Area2D
var can_interact = false

func _input(event):
	if event.is_action_pressed("sleep") && can_interact:
		activate_sleep_effect()
	pass

func _on_body_entered(body):
	can_interact = true
	$Label.show()


func _on_body_exited(body):
	can_interact = false
	$Label.hide()

func activate_sleep_effect():
	SEffectsManager.activate_sleep_effects()
