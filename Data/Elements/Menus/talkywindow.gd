extends CanvasLayer

const CHAR_READ_RATE = 0.05

@onready var tween
@onready var talkywindow = $"."
@onready var textbox_container = $MarginContainer
@onready var arrow_sprite = $MarginContainer/NinePatchRect/TextureRect
@onready var label = $MarginContainer/NinePatchRect/TalkyText

# The whole system operates on a State Machine
enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY

func _ready():
	#print("Starting state: State.READY")
	arrow_sprite.visible = false
	hide_textbox()


func _process(_delta):
	match current_state:
		State.READY:
			if !TalkyManager.text_queue.is_empty():
				AudioManager.dialog_progress.play()
				display_text()
				stop_arrow()
		State.READING:
			if Input.is_action_just_pressed("ui_accept"):
				tween.kill()
				label.visible_characters = -1
				stop_arrow()
				change_state(State.FINISHED)
		State.FINISHED:
			arrow_sprite.play("default")
			if Input.is_action_just_pressed("ui_accept"):
				if TalkyManager.text_queue.is_empty():
					TalkyManager.canMove = true
					hide_textbox()
					await get_tree().create_timer(1.0).timeout
					TalkyManager.isTalky = false
					talkywindow.queue_free()
				change_state(State.READY)

func stop_arrow():
	arrow_sprite.stop()
	arrow_sprite.set_frame_and_progress(0,0)

func hide_textbox():
	label.text = ""
	textbox_container.hide()

func show_textbox():
	textbox_container.show()

func display_text():
	if tween: tween.kill()
	tween = get_tree().create_tween()
	var next_text = TalkyManager.text_queue.pop_front()
	label.text = next_text
	label.visible_characters = 0
	TalkyManager.canMove = false
	change_state(State.READING)
	show_textbox()
	tween.tween_property(label, "visible_characters", len(next_text), len(next_text) * CHAR_READ_RATE).from(0)
	tween.connect("finished", on_tween_finished)
	arrow_sprite.visible = true

func change_state(next_state):
	current_state = next_state
	#match current_state:
	#	State.READY:
	#		print("Changing state to: State.READY")
	#	State.READING:
	#		print("Changing state to: State.READING")
	#	State.FINISHED:
	#		print("Changing state to: State.FINISHED")

func on_tween_finished():
	change_state(State.FINISHED)
