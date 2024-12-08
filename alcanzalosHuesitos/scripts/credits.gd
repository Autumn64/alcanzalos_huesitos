extends CanvasLayer

func _process(delta: float) -> void:
	if Input.is_action_pressed("Start"):
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
