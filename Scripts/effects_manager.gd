extends Node

var player_sleep_effects = ["", "", ""]
var mobs_sleep_effects = []

signal apply_special_effects

func HelloWorld():
	print("YOU BEACH")

func on_apply_special_effects():
	pass
	

# Called when the node enters the scene tree for the first time.
func _ready():
	SEffectsManager.apply_special_effects.connect(on_apply_special_effects)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func activate_sleep_effects():
	await get_tree().create_timer(1.0).timeout
	print("Sleeping")


