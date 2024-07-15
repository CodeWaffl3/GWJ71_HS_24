extends Node2D

@export var move_speed = 300.0
var player

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	var velocity = direction * move_speed
	move_and_slide()
