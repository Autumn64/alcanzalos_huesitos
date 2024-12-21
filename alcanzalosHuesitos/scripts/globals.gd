extends Node

var controles = false
var nivel = 1
var vidas = 3
var puntos = 0
var maxp = 0
const cant_niveles = 4

const passwords: Dictionary = {
	4: "R3N34G"
}

func ob_maxp() -> String:
	return str(maxp)
	
func ob_puntos() -> String:
	return str(puntos)
	
func set_maxp() -> void:
	if puntos > maxp:
		maxp = puntos
	puntos = 0
	
func mover_vidas(cant: int) -> void:
	vidas += cant
	
func aumentar_puntos(cant: int) -> void:
	puntos += cant
	
func aumentar_nivel() -> void:
	nivel += 1
	
func ob_vidas() -> String:
	return str(vidas)
