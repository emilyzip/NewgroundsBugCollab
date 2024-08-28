extends Area2D

var tween_queue: Array = []
@onready var camera_marker = $Marker2D

func queue_tween(next_tween):
	tween_queue.push_back(next_tween)

func _on_body_entered(body):
	#print(body," entered ", self)
	queue_tween(pan_out(body))

func _on_body_exited(body):
	#print(body," exited ", self)
	queue_tween(pan_back_in(body))

func pan_out(body):
	var tween = get_tree().create_tween()
	tween.tween_property(body.PlayerCamera, "position", camera_marker.position, 1.0)
	tween.set_parallel()
	tween.tween_property(body.PlayerCamera, "zoom", Vector2(4,4), 1.5).set_trans(Tween.TRANS_CUBIC)

func pan_back_in(body):
	var tween = get_tree().create_tween()
	tween.tween_property(body.PlayerCamera, "position", Vector2(0,0), 1.0)
	tween.set_parallel()
	tween.tween_property(body.PlayerCamera, "zoom", Vector2(5,5), 1.0).set_trans(Tween.TRANS_CUBIC)
