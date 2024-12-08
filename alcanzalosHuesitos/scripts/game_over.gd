extends CanvasLayer
@onready var hi: Label = $HI

func _ready():
	Globals.set_maxp()
	hi.text = "Puntuación máxima:\n" + Globals.ob_maxp() + "0"

func _on_timer_timeout() -> void:
	Globals.vidas = 3
	Globals.nivel = 1
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
