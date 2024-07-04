extends Control

@onready var return_to_menu = $"Control Menu/VBoxContainer/Return to Menu"
@onready var music_toggle = $OptionsMenu/VBoxContainer/MusicToggle

func _ready():
	return_to_menu.disabled = false
	if AudioManager.IsMusicDisabled == true:
		music_toggle.button_pressed = true

func _input(_event):
	if Input.is_action_pressed("ui_soundtest"):
		AudioManager.dialog_progress.play()

func _on_return_to_menu_pressed():
	return_to_menu.disabled = true
	TransitionScreen.transition()
	await TransitionScreen.on_trans_finish
	get_tree().change_scene_to_file("res://Data/Elements/Menus/Main/mainmenu.tscn")

func _on_music_toggle_toggled(toggled_on):
	AudioManager.IsMusicDisabled = toggled_on
	if AudioManager.IsMusicDisabled == true:
		AudioManager.bg_music.stop()
		AudioManager.IsMusicPlaying = false
	elif AudioManager.IsMusicDisabled == false:
		AudioManager.bg_music.play()
		AudioManager.IsMusicPlaying = true
