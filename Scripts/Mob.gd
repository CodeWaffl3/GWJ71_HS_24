extends CharacterBody2D

@export var health = 3
@export var move_speed = 300.0
@onready var player = get_node("/root/Main/Player")

func _physics_process(delta):
	$AnimatedSprite2D.play()
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * move_speed
	move_and_slide()

func take_damage():
	health -= 1
	#play damage animation
	
	if health <= 0:
		queue_free()
	#instantiate smoke
	#
