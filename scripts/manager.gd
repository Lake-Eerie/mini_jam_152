extends Node2D

const FROG_TIME = 365 # time in seconds for frog to reach village (no mult)
const EVAC_TIME = 500 # time in seconds for villagers to evacuate
var timeElapsed = 0
var frogSpeedMult = 1 # decreases when blinded
var bgSpeed = 1

@onready var frogRemaining = FROG_TIME # (FROG_TIME - timeElapsed) / frogSpeedMult
@onready var hero := $hero
@onready var boss := $Froggie

func _process(delta):
	timeElapsed += delta
	frogRemaining = (FROG_TIME - timeElapsed) / frogSpeedMult
	
	# endgame logic
	if timeElapsed >= EVAC_TIME:
		best_win()
	elif EVAC_TIME - timeElapsed < frogRemaining:
		win()
	elif frogRemaining <= 0:
		lose_time()

func best_win():
	pass

func win():
	pass

func lose_time():
	pass

func lose_die():
	pass
