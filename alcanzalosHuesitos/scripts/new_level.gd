extends CanvasLayer
@onready var titulo: Label = $"Título"
@onready var puntos: Label = $HUD/Puntos
@onready var vidas: Label = $HUD/Vidas



func _ready() -> void:
	titulo.text = "Nivel " + str(Globals.nivel)
	puntos.text = "Puntos: " + Globals.ob_puntos() + "0"
	vidas.text = "x " + Globals.ob_vidas()

func _on_timer_final_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/nivel" + str(Globals.nivel) + ".tscn")
