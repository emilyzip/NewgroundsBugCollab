extends Node

const levels = {
	# Devtest
	"scene_test": preload("res://Data/GameWorld/Devtest/test.tscn"),
	"scene_test2": preload("res://Data/GameWorld/Devtest/test2.tscn"),
	
	# Starting House and Town
	"scene_starting_house": preload("res://Data/GameWorld/Outside/starting_house.tscn"),
	"scene_starting_house_downstairs": preload("res://Data/GameWorld/Outside/starting_house_downstairs.tscn"),
	"scene_town": preload("res://Data/GameWorld/Outside/town.tscn"),
	"scene_neighbor": preload("res://Data/GameWorld/Outside/neighbor.tscn"),
	
	# Lab Entrance Zone
	"scene_lab_entrance": preload("res://Data/GameWorld/Lab/EntranceZone/LabEntrance.tscn"),
	"scene_lab_1": preload("res://Data/GameWorld/Lab/EntranceZone/Lab1.tscn"),
	"scene_lab_2": preload("res://Data/GameWorld/Lab/EntranceZone/Lab2.tscn"),
	"scene_lab_3": preload("res://Data/GameWorld/Lab/EntranceZone/Lab3Long.tscn"),
	
	# Lab Buffer Zone
	"scene_lab_buffer": preload("res://Data/GameWorld/Lab/BufferZone/LabBuffer.tscn"),
	"scene_lab_A": preload("res://Data/GameWorld/Lab/BufferZone/LabA.tscn"),
	"scene_lab_B": preload("res://Data/GameWorld/Lab/BufferZone/LabB.tscn"),
	"scene_lab_C": preload("res://Data/GameWorld/Lab/BufferZone/LabC.tscn"),
	
}

signal on_trigger_player_spawn

var spawn_door_tag

func go_to_level(level_tag, destination_tag):
	var scene_to_load = null
	
	# These are the Available to load Level tags.
	# To add a new one, make sure it is established in the const "levels"
	match level_tag:
		# Devtest
		"test":
			scene_to_load = levels["scene_test"]
		"test2":
			scene_to_load = levels["scene_test2"]
			
		# Starting House and Town
		"starting_house":
			scene_to_load = levels["scene_starting_house"]
		"starting_house_downstairs":
			scene_to_load = levels["scene_starting_house_downstairs"]
		"town":
			scene_to_load = levels["scene_town"]
		"neighbor":
			scene_to_load = levels["scene_neighbor"]
			
		# Lab Entrance Zone
		"lab_entrance":
			scene_to_load = levels["scene_lab_entrance"]
		"lab_1":
			scene_to_load = levels["scene_lab_1"]
		"lab_2":
			scene_to_load = levels["scene_lab_2"]
		"lab_3":
			scene_to_load = levels["scene_lab_3"]
			
		# Lab Buffer Zone
		"lab_buffer":
			scene_to_load = levels["scene_lab_buffer"]
		"lab_A":
			scene_to_load = levels["scene_lab_A"]
		"lab_B":
			scene_to_load = levels["scene_lab_B"]
		"lab_C":
			scene_to_load = levels["scene_lab_C"]
			
		# Error Catcher
		_:
			scene_to_load = levels["scene_test"]
	
	# Starts the scene transition and loads the proper level, when desired.
	if scene_to_load != null:
		TransitionScreen.transition()
		await TransitionScreen.on_trans_finish
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed(scene_to_load)

func trigger_player_spawn(posi: Vector2, direction: String):
	on_trigger_player_spawn.emit(posi, direction)
