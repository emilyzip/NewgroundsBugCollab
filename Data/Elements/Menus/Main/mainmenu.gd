extends Control

@onready var logo = $Logo
@onready var start_button = $NinePatchRect/VBoxContainer/Start
@onready var options_button = $NinePatchRect/VBoxContainer/Options
@onready var credits_button = $NinePatchRect/VBoxContainer/Credits
@onready var version_info = $"Version Info"

func _ready():
	start_button.disabled = false
	options_button.disabled = false
	credits_button.disabled = false
	logo.play("default")
	if AudioManager.IsMusicDisabled == false and AudioManager.IsMusicPlaying == false:
		AudioManager.bg_music.play()
		AudioManager.IsMusicPlaying = true
		
	version_info.text = "Version "+ProjectSettings.get_setting("application/config/version")
	
	if get_tree().root.has_node('pausemenu'):
		get_tree().root.get_node('pausemenu').queue_free()
		TalkyManager.isTalky = false
		TalkyManager.canMove = true
	if get_tree().root.has_node('BugInspect'):
		get_tree().root.get_node('BugInspect').queue_free()
		TalkyManager.isTalky == false
		TalkyManager.canMove = true
	if get_tree().root.has_node('Talkybox'):
		get_tree().root.get_node('Talkybox').queue_free()
		TalkyManager.isTalky == false
		TalkyManager.canMove = true

func _on_start_pressed():
	start_button.disabled = true
	TransitionScreen.transition()
	await TransitionScreen.on_trans_finish
	get_tree().change_scene_to_file("res://Data/GameWorld/Outside/starting_house.tscn")

func _on_options_pressed():
	options_button.disabled = true
	TransitionScreen.transition()
	await TransitionScreen.on_trans_finish
	get_tree().change_scene_to_file("res://Data/Elements/Menus/Options/optionsmenu.tscn")

func _on_credits_pressed():
	credits_button.disabled = true
	TransitionScreen.transition()
	await TransitionScreen.on_trans_finish
	get_tree().change_scene_to_file("res://Data/Elements/Menus/Credits/creditsmenu.tscn")
