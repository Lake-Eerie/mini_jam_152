extends Node2D

func _ready():
	$FrogEntrance.connect("finished", Callable(self, "_on_CutsceneAudio_finished"))

func _on_CutsceneAudio_finished():
	get_parent().get_node("Cutscene").get_child(0).play("fadeOut")
	get_parent().get_node("hero").enable()
	$GameplayMusic_1.play()
