extends CanvasLayer

@onready var hi: Label = $HI

func _ready() -> void:
	hi.text = "HI - " + Globals.ob_maxp() + "0"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Start"):
		get_tree().change_scene_to_file("res://scenes/new_level.tscn")
	
	if Input.is_action_pressed("Select"):
		get_tree().change_scene_to_file("res://scenes/credits.tscn")
