extends CanvasLayer

@onready var jugar: AnimationPlayer = $Jugar/AnimationPlayer
@onready var password: AnimationPlayer = $Password/AnimationPlayer

@onready var hi: Label = $HI
var opcion: int = 1

func opciones() -> void:
	if opcion == 1:
		if jugar.current_animation != "parpadeando": jugar.play("parpadeando")
		if password.current_animation != "quieto": password.play("quieto")
	elif opcion == 2:
		if jugar.current_animation != "quieto": jugar.play("quieto")
		if password.current_animation != "parpadeando": password.play("parpadeando")
	else:
		opcion = 1

func _ready() -> void:
	hi.text = "HI - " + Globals.ob_maxp() + "0"

func _process(delta: float) -> void:
	opciones()
	
	if Input.is_action_just_pressed("Start") and opcion == 1:
		get_tree().change_scene_to_file("res://scenes/new_level.tscn")
	
	elif Input.is_action_just_pressed("Start") and opcion == 2:
		get_tree().change_scene_to_file("res://scenes/password.tscn")
	
	if Input.is_action_just_pressed("Abajo") and opcion == 1:
		opcion = 2
	
	elif Input.is_action_just_pressed("Abajo") and opcion == 2:
		opcion = 1
		
	if Input.is_action_just_pressed("Arriba") and opcion == 1:
		opcion = 2
	
	elif Input.is_action_just_pressed("Arriba") and opcion == 2:
		opcion = 1
	
	if Input.is_action_pressed("Select"):
		get_tree().change_scene_to_file("res://scenes/credits.tscn")
