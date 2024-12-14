extends CanvasLayer
@onready var titulo: Label = $"Título"
@onready var puntos: Label = $Puntos
@onready var vidas: Label = $Vidas
@onready var total: Label = $Total
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	titulo.text = "Nivel " + str(Globals.nivel - 1)
	puntos.text = "Puntuación\n" + Globals.ob_puntos() + "0"
	vidas.visible = false
	total.visible = false
	Globals.aumentar_puntos((Globals.vidas * Globals.puntos) - Globals.puntos)

func _on_timer_vidas_timeout() -> void:
	audio.play()
	vidas.text = "Vidas    x " + Globals.ob_vidas()
	vidas.visible = true

func _on_timer_total_timeout() -> void:
	audio.play()
	total.text = "Total\n" + Globals.ob_puntos() + "0"
	total.visible = true

func _on_timer_final_timeout() -> void:
	if Globals.nivel > Globals.cant_niveles:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		return
	Globals.mover_vidas(1)
	get_tree().change_scene_to_file("res://scenes/new_level.tscn")
