extends Node2D

class_name Level

func _ready():
	if DoorwaysManager.spawn_door_tag != null:
		_on_level_spawn(DoorwaysManager.spawn_door_tag)
		
func _on_level_spawn(destination_tag: String):
	# Assigns the door its proper tag
	var door_path = "Doors/Door_" + destination_tag
	var door = get_node(door_path) as Door
	DoorwaysManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)
