extends Area2D

class_name Door

# NOTE: Make sure name Door entitys "Door_" + their Destination Tag.

## This field controls what Level to attempt loading.
## NOTE: Do not write the scene file name, Write the Level Tag as denoted in DoorwaysManager.gd
@export var destination_level_tag: String

## Controls what Door to [b]connect[/b] this to in the denoted Level.
## Do not write the name of the door in this field!
@export var destination_door_tag: String

## What direction to spawn the player facing when spawning through this door.
## Good practice is to have this direction be opposite the direction you would
## enter this door from.
@export var spawn_direction = "down"

@onready var spawn = $Spawn

func _on_body_entered(body):
	if body is Player:
		DoorwaysManager.go_to_level(destination_level_tag, destination_door_tag)
