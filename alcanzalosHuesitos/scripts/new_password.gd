extends CanvasLayer

@onready var titulo: Label = $"Título"

func _ready() -> void:
	titulo.text = "Contraseña\n" + Globals.passwords[Globals.nivel]

func _on_timer_final_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/new_level.tscn")
