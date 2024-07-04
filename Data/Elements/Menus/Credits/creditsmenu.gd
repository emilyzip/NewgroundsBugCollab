extends Control

@onready var return_to_menu = $"Control Menu/VBoxContainer/Return to Menu"

func _ready():
	return_to_menu.disabled = false
	print(Engine.get_license_text())

func _on_return_to_menu_pressed():
	return_to_menu.disabled = true
	TransitionScreen.transition()
	await TransitionScreen.on_trans_finish
	get_tree().change_scene_to_file("res://Data/Elements/Menus/Main/mainmenu.tscn")
