# This is a non-grid based solution for player movement, Stored here for archival purposes.

extends CharacterBody2D

const moveSpeed = 130
var dirInput: get = _getInput
var spriteDirection: get = _getSpriteDirection
var isHoldingTwoKeys: get = _isHoldingTwoKeys

@export_category("Foundational")
@export var PlayerCamera: Camera2D
@export var sprDefault: AnimatedSprite2D

@onready var PlayerSprite: AnimatedSprite2D = sprDefault

func _physics_process(_delta):
	DefaultWalk()

func DefaultWalk():
	if isHoldingTwoKeys == false:
		velocity = dirInput*moveSpeed
		animateSprite(PlayerSprite,spriteDirection)
		move_and_slide()
		
		if velocity == Vector2.ZERO:
			PlayerSprite.stop()
	if isHoldingTwoKeys == true:
		sprDefault.stop()

func _getInput():
	var move = Vector2(0,0)
	if Input.get_action_strength("player_up"):
		move = Vector2(0,-1)
	elif Input.get_action_strength("player_down"):
		move = Vector2(0,1)
	elif Input.get_action_strength("player_left"):
		move = Vector2(-1,0)
	elif Input.get_action_strength("player_right"):
		move = Vector2(1,0)
	return move

func _getSpriteDirection():
	match dirInput:
		Vector2.LEFT:
			spriteDirection = "left"
		Vector2.RIGHT:
			spriteDirection = "right"
		Vector2.UP:
			spriteDirection = "up"
		Vector2.DOWN:
			spriteDirection = "down"
	return spriteDirection

func animateSprite(state,direction):
	if direction == null:
		state.stop()
	else:
		state.play(direction)

func _isHoldingTwoKeys():
	var iUp = Input.get_action_strength("player_up")
	var iDown = Input.get_action_strength("player_down")
	var iLeft = Input.get_action_strength("player_left")
	var iRight = Input.get_action_strength("player_right")
	var twoKeys = iUp+iDown+iLeft+iRight
	
	if twoKeys >= 2:
		return true
	else:
		return false
