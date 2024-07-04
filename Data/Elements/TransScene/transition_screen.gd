extends CanvasLayer

signal on_trans_finish

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var trans_sprite: = $SpiralSwirl

func _ready():
	trans_sprite.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black_new":
		on_trans_finish.emit()
		animation_player.play("fade_to_normal_new")
	elif anim_name == "fade_to_normal_new":
		trans_sprite.visible = false
	
func transition():
	trans_sprite.visible = true
	AudioManager.door_enterexit.play()
	animation_player.play("fade_to_black_new")
