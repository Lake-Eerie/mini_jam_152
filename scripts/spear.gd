extends Area2D

const SPEED = 600

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= SPEED * delta
