extends Node
var level_names = ['level1', 'level2', 'level3']
var is_main_current_scene = true
var safe_chance = 0.2
var is_safe = false
var safe_roll
var player_health = 100.0

func change_to_random_level():
	if is_safe:
		is_safe = false
	var random_level = level_names[randi_range(0, level_names.size() - 1)]
	var random_level_path = "res://Levels/" + random_level + ".tscn"
	print(random_level)
	get_tree().change_scene_to_file(random_level_path)
	SEffectsManager.apply_special_effects.emit()

func apply_safe_chance():
	player_health = get_tree().get_nodes_in_group("players")[0].health
	print(player_health)
	safe_roll = randf()
	if is_main_current_scene:
		is_main_current_scene = false
	if is_safe:
		print("Safe chance: " + str(safe_chance))
		change_to_random_level()
	elif safe_roll <= safe_chance:
		is_safe = true
		safe_chance = 0.2
		print("Safe chance: " + str(safe_chance))
		get_tree().change_scene_to_file("res://Levels/safe.tscn")
	else: 
		safe_chance += 0.2
		print("Safe chance: " + str(safe_chance))
		change_to_random_level()
