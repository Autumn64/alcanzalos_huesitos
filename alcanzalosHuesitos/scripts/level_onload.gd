extends Node2D

@onready var puntos: Label = $HUD/Puntos
@onready var vidas: Label = $HUD/Vidas


func _ready() -> void:
	puntos.text = "Puntos: " + Globals.ob_puntos() + "0"
	vidas.text = "x " + Globals.ob_vidas()

func _process(delta: float) -> void:
	puntos.text = "Puntos: " + Globals.ob_puntos() + "0"
