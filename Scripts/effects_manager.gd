extends Node
const goo = preload("res://Scenes/FX/goo.tscn")

var player_sleep_effects = ["", "", ""]
var mobs_sleep_effects = []
var is_goo = true

var timer:Timer


signal apply_special_effects


func on_apply_special_effects():
	print("SIGNAL")
	get_tree().get_root().add_child(timer)
	pass
	

# Called when the node enters the scene tree for the first time.
func _ready():
	SEffectsManager.apply_special_effects.connect(on_apply_special_effects)
	timer = Timer.new()
	timer.one_shot = false
	timer.autostart = true
	timer.wait_time = 0.7
	timer.timeout.connect(goo_spawn)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func activate_sleep_effects():
	await get_tree().create_timer(1.0).timeout
	print("Sleeping")

func goo_spawn():
	print("GOO SPAWN")
	if is_goo:
		var enemies = get_tree().get_nodes_in_group("enemies")
		for enemy in enemies:
			var temp_goo = goo.instantiate()
			temp_goo.global_position = enemy.global_position
			get_tree().get_root().add_child(temp_goo)
		
