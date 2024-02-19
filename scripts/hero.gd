extends CharacterBody2D


const SPEED = 300.0

const ITEM_NONE = 0
const ITEM_SPEAR = 1
const ITEM_STICK = 2

const SPEAR = preload("res://scenes/items/spear.tscn")
const STICK = preload("res://scenes/items/stick.tscn")

var item = ITEM_SPEAR

func _physics_process(delta):
	var dirX = Input.get_axis("MoveLeft", "MoveRight")
	var dirY = Input.get_axis("MoveUp", "MoveDown")
	var direction = Vector2(dirX, dirY).normalized()
	velocity = (direction * SPEED)

	if Input.is_action_pressed("Throw"):
		# chuck current item
		match item:
			ITEM_NONE:
				pass
			ITEM_SPEAR:
				throw(SPEAR)
			ITEM_STICK:
				throw(STICK)

	move_and_slide()

func throw(node):
	var projectile = node.instantiate()
	projectile.position = position + Vector2.UP * 30
	get_parent().add_child(projectile)
	item = ITEM_NONE
