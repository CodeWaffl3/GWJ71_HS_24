extends Area2D

@export var speed = 1000
@export var range = 1200
var travelled_distance = 0

func _ready():
	if is_in_group("bad_bullets"):
		speed = speed / 2

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	travelled_distance += speed * delta
	if travelled_distance > range:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
