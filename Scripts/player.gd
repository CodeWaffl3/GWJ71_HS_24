extends CharacterBody2D

@export var move_speed = 600
@export var health = SceneManager.player_health
@export var damage_rate = 20.0
@export var bad_bullet_damage = 50.0
signal health_depleted

func _ready():
	#health = SceneManager.player_health
	$HealthBar.value = health

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction 
	if velocity.length() > 0:
		velocity = velocity.normalized() * move_speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	move_and_slide()

#if velocity.length() > 0.0:
	#play walk animation
#else:
	#play idle animation

	var overlapping_mobs = %Hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= damage_rate * overlapping_mobs.size() * delta
		$HealthBar.value = health
		if health <= 0.0:
			health_depleted.emit()


func _on_hurtbox_area_entered(area):
	if area.is_in_group("bad_bullets"):
		print("A bullet hit you!")
		health -= bad_bullet_damage
		$HealthBar.value = health
		if health <= 0.0:
			health_depleted.emit()
