extends Node2D

@onready var bgSpeed = 1
@onready var limit = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += bgSpeed * Vector2(0, -1)
	if position.y < limit:
		queue_free()
