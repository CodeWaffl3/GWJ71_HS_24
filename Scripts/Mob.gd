extends CharacterBody2D

@export var health = 3
@export var move_speed = 300.0
@onready var player = get_node("/root/Main/Player")

const BULLET = preload("res://Scenes/white_slime_bullet.tscn")

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

func shoot():
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = position
	var direction = global_position.direction_to(player.global_position)
	new_bullet.rotation = direction.angle()
	add_child(new_bullet)
  
func _on_shoot_timer_timeout():
	shoot()

func leave_goo():
	pass