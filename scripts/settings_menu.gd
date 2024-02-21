extends Control

var config = ConfigFile.new()
var config_path = "user://settings.cfg"

var temp_sound_volume = 100
var temp_music_volume = 100

func _ready():
	load_settings()
	connect("visibility_changed", Callable(self, "_on_SettingsMenu_visibility_changed"))

	$VBoxContainer/SoundVolumeSlider.connect("value_changed", Callable(self, "_on_SoundVolumeSlider_value_changed"))
	$VBoxContainer/MusicVolumeSlider.connect("value_changed", Callable(self, "_on_MusicVolumeSlider_value_changed"))
	$VBoxContainer/ApplyButton.connect("pressed", Callable(self, "_on_ApplyButton_pressed"))
	$VBoxContainer/CloseButton.connect("pressed", Callable(self, "_on_CloseButton_pressed"))

func load_settings():
	var error = config.load(config_path)
	
	if error == ERR_FILE_NOT_FOUND:
		print("Settings file does not exist. Creating with default settings.")
		config.set_value("audio", "sound_volume", 100)
		config.set_value("audio", "music_volume", 100)
		save_settings()
	elif error != OK:
		print("An error occurred while loading the settings:", error)
		# Default value if settings can't be loaded
		temp_sound_volume = 100
		temp_music_volume = 100 
	else:
		# Load settings or use default values if the settings don't exist
		print("Loaded volume setting")
		temp_sound_volume = config.get_value("audio", "sound_volume", 100)
		temp_music_volume = config.get_value("audio", "music_volume", 100)
		
	$VBoxContainer/SoundVolumeSlider.value = temp_sound_volume
	$VBoxContainer/MusicVolumeSlider.value = temp_music_volume

func _on_SettingsMenu_visibility_changed():
	if visible:
		load_settings()

func save_settings():
	var error = config.save(config_path)
	if error != OK:
		print("An error occurred while saving the settings:", error)

func _on_SoundVolumeSlider_value_changed(value):
	temp_sound_volume = value

func _on_MusicVolumeSlider_value_changed(value):
	temp_music_volume = value

func _on_ApplyButton_pressed():
	config.set_value("audio", "sound_volume", temp_sound_volume)
	config.set_value("audio", "music_volume", temp_music_volume)
	save_settings()
	visible = false
	# TODO: Apply these settings to the game. This involves creating 2 audio buses for sound/music

func _on_CloseButton_pressed():
	visible = false
