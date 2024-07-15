extends Node2D

@export var level_door_scene: PackedScene
var door_spawned = false
var is_main = true
var aim_sprite = load("res://Assets/Sprites/aim.png")

func _ready():
	if SceneManager.is_main_current_scene:
		get_tree().paused = true
	
func _process(delta):
	if (get_tree().get_nodes_in_group("enemies").size() <= 0) and not door_spawned:
		spawn_door()
		door_spawned = true

func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true

func _on_start_button_pressed():
	Input.set_custom_mouse_cursor(aim_sprite)
	get_tree().paused = false
	%StartMenu.visible = false

func _on_exit_button_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()

#NO FUNCIONA CORRECTAMENTE EL RETRY
#SI me funciono el retry
func _on_restart_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func spawn_door():
	#print("Spawning door")

	var level_door = level_door_scene.instantiate()
	var level_door_location = $LevelDoorPath/LevelDoorSpawnLocation
	level_door_location.progress_ratio = randf()
	level_door.position = level_door_location.position
	level_door.rotation = level_door_location.rotation
	
	add_child(level_door)
	level_door.body_entered.connect(on_level_door_on_body_entered)
	
func on_level_door_on_body_entered(body):
	print("Switching levels")
	is_main = false
	SceneManager.apply_safe_chance()
