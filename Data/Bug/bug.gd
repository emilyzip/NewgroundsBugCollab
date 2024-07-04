@tool
extends Node2D

@onready var timer = $Timer
@onready var bug_sprite = $BugSprite
@onready var ray = $CollisionRay

## What frame in the spritesheet corrosponds to each direction? (Starts at 0)
@export var LeftFrame: int
@export var UpFrame: int
@export var RightFrame: int
@export var DownFrame: int

@export var WhatBug: CompressedTexture2D
@export var BugSize: String
const TILE_SIZE = 16

func _ready():
	bug_sprite.texture = WhatBug
	
func _process(_delta):
	# Live updates Visuals in Editor for Quality of Life purposes.
	# Does not run if ingame.
	if Engine.is_editor_hint():
		bug_sprite.texture = WhatBug

func _on_timer_timeout():
	var ran4 = randi_range(0,3)
	match ran4:
		0:
			# Left
			move(Vector2(-1,0))
			bug_sprite.frame = LeftFrame
		1:
			# Up
			move(Vector2(0,-1))
			bug_sprite.frame = UpFrame
		2:
			# Right
			move(Vector2(1,0))
			bug_sprite.frame = RightFrame
		3:
			# Down
			move(Vector2(0,1))
			bug_sprite.frame = DownFrame
	timer.wait_time = randi_range(2,4)
	#(2,4)

func move(direction):
	if BugSize == "small":
		ray.target_position = Vector2(direction * TILE_SIZE / 2)
		ray.force_raycast_update() # NOTE if you don't force update the raycast this breaks!
	elif BugSize == "big":
		ray.target_position = Vector2(direction * TILE_SIZE)
		ray.force_raycast_update() # NOTE if you don't force update the raycast this breaks!
	else:
		print("BugSize is NULL !", self)
	
	if !ray.is_colliding():
		position = position + (TILE_SIZE * direction)
