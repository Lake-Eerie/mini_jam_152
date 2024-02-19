extends Node2D

var bgSpeed = 1
var bobTime = 0.3
const LIMIT = 0
@onready var itemSprite := $ItemSprite
@onready var bgSprite := $BGSprite
@onready var lifetime = 0.0
@onready var type = randi_range(1, 2)

func _ready():
	if type == 1:
		itemSprite.texture = load("res://sprites/items/spear.png")
		bgSprite.texture = load("res://sprites/items/spearBg.png")
	else:
		itemSprite.texture = load("res://sprites/items/stickIcon.png")
		bgSprite.texture = load("res://sprites/items/stickBg.png")

func _process(delta):
	position += bgSpeed * Vector2(0, -1)
	if position.y < LIMIT:
		queue_free()
	lifetime += delta
	var bobHeight = (sin(lifetime/bobTime) - 1) * 30
	itemSprite.position.y = bobHeight
