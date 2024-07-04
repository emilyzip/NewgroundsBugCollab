@tool

extends StaticBody2D
class_name NPC

## Sets the NPC's Visual sprite to one of the available sprites in the spritesheet.
## There are 31 available, starting at 0.
@export_range(0,31) var NPC_SheetID: int = 0

## The name typed into here will be what dialouge stack will be displayed when the NPC is interacted with.
## This value is ignored if IsTerminal is set to true.
## A list of available ones can be found in res://Data/Elements/Global Scripts/TalkyManager.gd
@export var NPC_Talky: String = "Default"

## This ID is what Bug's information will be displayed when interacted with.
## This value is ignored if IsTerminal is set to false.
@export var TerminalEntryID: int

## This switch controls wether or not the game will 
## load the NPC as a Terminal entity or an NPC Entity
@export var IsTerminal: bool = false

@export var force_new_sheet: CompressedTexture2D = null

@onready var NPC_Sprite: Sprite2D = $NPCsprite
@onready var Terminal_Sprite: AnimatedSprite2D = $TerminalSprite

func _ready():
	if force_new_sheet != null:
		NPC_Sprite.texture = force_new_sheet
	
	# Set up NPC visuals depending on if its an NPC or a Terminal
	if IsTerminal == false:
		NPC_Sprite.frame = NPC_SheetID
		Terminal_Sprite.visible = false
		
	elif IsTerminal == true:
		NPC_Sprite.visible = false
		Terminal_Sprite.visible = true
		Terminal_Sprite.play("default")

func _process(_delta):
	# Live updates Visuals in Editor for Quality of Life purposes.
	# Does not run if ingame.
	if Engine.is_editor_hint():
		if force_new_sheet != null:
			NPC_Sprite.texture = force_new_sheet
		if IsTerminal == false:
			NPC_Sprite.frame = NPC_SheetID
			NPC_Sprite.visible = true
			Terminal_Sprite.visible = false
		elif IsTerminal == true:
			NPC_Sprite.visible = false
			Terminal_Sprite.visible = true
