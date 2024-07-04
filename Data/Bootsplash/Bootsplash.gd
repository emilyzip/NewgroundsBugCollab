extends Control

@onready var animation_player = $AnimationPlayer
@onready var godotgrounds = $BoxContainer/GodotgroundsTransText

func _ready():
	animation_player.play("fade_in")

func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Data/Elements/Menus/Main/mainmenu.tscn")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		await get_tree().create_timer(2.0).timeout
		animation_player.play("fade_out")
	if anim_name == "fade_out":
		get_tree().change_scene_to_file("res://Data/Elements/Menus/Main/mainmenu.tscn")
