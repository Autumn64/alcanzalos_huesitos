extends Node2D

@onready var area: Node2D = $Area

func _ready() -> void:
	area.visible = Globals.controles

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Controles"):
		Globals.controles = not Globals.controles
		area.visible = Globals.controles
