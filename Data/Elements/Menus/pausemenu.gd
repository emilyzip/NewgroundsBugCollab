extends CanvasLayer

@onready var return_to_main = $NinePatchRect/VBoxContainer/ReturnToMain

# theres probably a better way to do this but im tired

func _ready():
	return_to_main.disabled = false
	
func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		_on_return_to_main_pressed()

func _on_return_to_main_pressed():
	return_to_main.disabled = true
	TransitionScreen.transition()
	await TransitionScreen.on_trans_finish
	get_tree().change_scene_to_file("res://Data/Elements/Menus/Main/mainmenu.tscn")
	DoorwaysManager.spawn_door_tag = null
	queue_free()
