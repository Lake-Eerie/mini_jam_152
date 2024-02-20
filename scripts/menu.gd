extends Control

var scene = preload("res://scenes/main.tscn")

var fade_out_started = false
var fade_out_time = 2.0 # Duration of the fade in seconds
var fade_out_timer = 0.0 # A timer to track the fade duration
var start_volume_db = 0.0
var target_volume_db = -40.0 # Target volume to fade out to

func _ready():
	$MainMenuMusic.volume_db = start_volume_db
	$ButtonsContainer/StartButton.connect("pressed", Callable(self, "_on_StartButton_pressed"))
	$ButtonsContainer/SettingsButton.connect("pressed", Callable(self, "_on_SettingsButton_pressed"))
	$ButtonsContainer/QuitButton.connect("pressed", Callable(self, "_on_QuitButton_pressed"))

func _on_StartButton_pressed():
	start_fade_out()

func _on_SettingsButton_pressed():
	print("Settings Button Pressed")

func _on_QuitButton_pressed():
	get_tree().quit()

func start_fade_out():
	fade_out_started = true

func _process(delta):
	if fade_out_started:
		fade_out_timer += delta
		var progress = fade_out_timer / fade_out_time
		$MainMenuMusic.volume_db = lerp(start_volume_db, target_volume_db, progress)
		
		# finished audio fade
		if progress >= 1.0:
			fade_out_started = false
			$MainMenuMusic.stop()
			get_tree().change_scene_to_packed(scene)
