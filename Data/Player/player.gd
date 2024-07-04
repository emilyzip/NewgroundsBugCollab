extends CharacterBody2D

class_name Player 

@export var PlayerCamera: Camera2D
@export var sprDefault: Sprite2D
@export var walk_speed = 6.0
var run_speed = walk_speed*1.7
var is_running: bool = false

@onready var ray: RayCast2D = $CollisionRay
@onready var interRay: RayCast2D = $InteractionRay
#@onready var TalkyBox: Control = $PlayerCamera/Talky
#@onready var TalkyText: Label = $PlayerCamera/Talky/NinePatchRect/TalkyText
@onready var PlayerSprite: Sprite2D = sprDefault
@onready var AnimTree: AnimationTree = $AnimationTree
@onready var AnimState = AnimTree.get("parameters/playback")

@export_category("Camera Limit")
@export var LimitLeft = -10000000
@export var LimitTop = -10000000
@export var LimitRight = 10000000
@export var LimitBottom = 10000000

const TILE_SIZE = 16

var startPos = Vector2(0, 0) # the starting position of a movement
var inputDir = Vector2(0, 0) # what direction you input to move
var isMoving = false # if the player is currently in motion
var moveTilePercent = 0.0 # percent moved to next tile

func _ready():
	#get_tree().root.add_child(load("res://Data/Elements/Menus/pausemenu.tscn").instantiate())
	# sets these variables so that the limits of the camera can be edited per scene
	PlayerCamera.limit_left = LimitLeft
	PlayerCamera.limit_top = LimitTop
	PlayerCamera.limit_right = LimitRight
	PlayerCamera.limit_bottom = LimitBottom
	
	# Doorways
	DoorwaysManager.on_trigger_player_spawn.connect(_on_spawn)
	
	# setup startPos var and make player idle and looking downwards
	startPos = position
	AnimTree.set("parameters/Idle/blend_position", Vector2(0,1))
	
func _on_spawn(posi: Vector2, direction: String):
	# conversion variable for Direction String
	var AnimDi = {
		"left": Vector2(-1,0),
		"up": Vector2(0,-1),
		"right": Vector2(1,0),
		"down": Vector2(0,1),
	}
	# sets the player to the correct spawn and makes them face the correct direction
	global_position = posi
	AnimTree.set("parameters/Idle/blend_position", AnimDi[direction])
	
func _physics_process(delta):
	# pausing the game
	if Input.is_action_just_pressed("ui_pause") and !get_tree().root.has_node('pausemenu') and !get_tree().root.has_node('BugInspect') and !get_tree().root.has_node('Talkybox'):
			AudioManager.dialog_progress.play()
			get_tree().root.add_child(load("res://Data/Elements/Menus/pausemenu.tscn").instantiate())
		
	# running toggle
	if Input.is_action_pressed("player_run"):
		is_running = true
	else:
		is_running = false
		
	# code for handling if player is moving or not, and what animations to play
	if isMoving == false:
		# if player is not moving, check for input
		if TalkyManager.canMove == true:
			process_player_input()
	elif inputDir != Vector2.ZERO:
		#if isTalking == false:
		# if player is moving, animate movement and call movement function
		if !ray.is_colliding():
			AnimState.travel("Walk")
		move(delta)
		if get_tree().root.has_node("pausemenu"):
			get_tree().root.get_node("pausemenu").queue_free()
	else:
		# if player is not moving, set idle animation and reset isMoving
		AnimState.travel("Idle")
		isMoving = false
		
	# Starts interaction
	if Input.is_action_just_pressed("ui_accept") and TalkyManager.isTalky == false:
		interRayTalky()

func interRayTalky():
	if interRay.is_colliding():
		# This grabs the values from the object being seen by the Raycast
		var collisioner = interRay.get_collider()
		#Dialouge!
		if collisioner.IsTerminal == false:
			TalkyManager.get_talky_text(collisioner.NPC_Talky)
			if TalkyManager.isTalky == false:
				get_tree().root.add_child(load("res://Data/Elements/Menus/talkywindow.tscn").instantiate())
				TalkyManager.isTalky = true
		#Inspect!
		elif collisioner.IsTerminal == true:
			BugManager.load_bug_menu(collisioner.TerminalEntryID)
			if BugManager.isInspect == false:
				get_tree().root.add_child(load("res://Data/Elements/Menus/bug_inspect.tscn").instantiate())
				BugManager.isInspect = true

func process_player_input():
	# finds what direction the player is pressing
	if inputDir.y == 0:
		inputDir.x = int(Input.get_action_strength("player_right")) - int(Input.get_action_strength("player_left"))
	if inputDir.x == 0:
		inputDir.y = int(Input.get_action_strength("player_down")) - int(Input.get_action_strength("player_up"))
	
	# sets up animation trees and triggers isMoving
	if inputDir != Vector2.ZERO: # and isTalking == false
		AnimTree.set("parameters/Idle/blend_position", inputDir)
		AnimTree.set("parameters/Walk/blend_position", inputDir)
		startPos = position
		isMoving = true
	else:
		AnimState.travel("Idle")

func move(delta):
	# uses a raycast to check the tile the player is attempting to move to
	ray.target_position = Vector2(inputDir * TILE_SIZE / 2)
	ray.force_raycast_update() # NOTE if you don't force update the raycast this breaks!
	
	# this updates the raycast for object/npc interaction
	interRay.target_position = Vector2(inputDir * TILE_SIZE)
	interRay.force_raycast_update()
	
	if !ray.is_colliding():
		if is_running == false:
			moveTilePercent += walk_speed * delta
		elif is_running == true:
			moveTilePercent += run_speed * delta
		# resets startPos to new location after moveTilePercent reaches 1.0
		# (meaning that a full movement between tiles has occured, and is finished)
		if moveTilePercent >= 1.0:
			position = startPos + (TILE_SIZE * inputDir)
			moveTilePercent = 0.0
			isMoving = false
		else: # if player is still moving, keep doing that! lol
			position = startPos + (TILE_SIZE * inputDir * moveTilePercent)
	else: # this code prevents the player from getting stuck when facing a wall
		moveTilePercent = 0.0
		isMoving = false
