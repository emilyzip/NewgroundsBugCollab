extends CanvasLayer

@onready var BugInspect = $"."
@onready var BugNameLabel = $MarginContainer/NinePatchRect/VBoxContainer/Bug
@onready var AuthorLabel = $MarginContainer/NinePatchRect/VBoxContainer/Author
@onready var DescLabel = $MarginContainer/NinePatchRect/VBoxContainer/Desc
@onready var arrow_sprite = $MarginContainer/NinePatchRect/TextureRect

var canProgress: bool = false

func _ready():
	BugNameLabel.set_text(BugManager.BugData[BugManager.inspectID]["Name"])
	AuthorLabel.set_text("Created by: "+BugManager.BugData[BugManager.inspectID]["Author"])
	DescLabel.set_text(BugManager.BugData[BugManager.inspectID]["Desc"])
	
	AudioManager.ui_inspect.play()
	TalkyManager.canMove = false
	
	# to prevent menu spam
	await get_tree().create_timer(0.1).timeout
	canProgress = true
	arrow_sprite.play("default")

func _process(_delta):
	if canProgress == true:
		# Close Menu
		if Input.is_action_just_pressed("ui_accept"):
			AudioManager.ui_close.play()
			TalkyManager.canMove = true
			$MarginContainer.hide()
			await get_tree().create_timer(0.5).timeout
			BugManager.isInspect = false
			BugInspect.queue_free()
		if Input.is_action_just_pressed("ui_link_open"):
			if BugManager.BugData[BugManager.inspectID].has("URL"):
				var link = BugManager.BugData[BugManager.inspectID]["URL"]
				OS.shell_open(link)
