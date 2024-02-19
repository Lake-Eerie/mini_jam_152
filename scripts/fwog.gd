extends Node2D

@onready var body = {
	"ref": $Bits/Body,
	"aSprite": $Bits/Body/ASprite,
}
@onready var rEye = {
	"ref": $Bits/REye,
	"aSprite": $Bits/REye/ASprite,
}
@onready var lEye = {
	"ref": $Bits/LEye,
	"aSprite": $Bits/LEye/ASprite,
}
@onready var mouth = {
	"ref": $Bits/Mouth,
	"aSprite": $Bits/Mouth/ASprite,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	body["aSprite"].play("walk")
	rEye["aSprite"].play("walk")
	lEye["aSprite"].play("walk")
	mouth["aSprite"].play("walk")
