extends CanvasLayer

@onready var caracteres: Array[Label] = [$C1, $C2, $C3, $C4, $C5, $C6]
@onready var animaciones: Array[AnimationPlayer] = [$C1/AnimationPlayer, $C2/AnimationPlayer,
$C3/AnimationPlayer, $C4/AnimationPlayer, $C5/AnimationPlayer, $C6/AnimationPlayer]
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var error_sound: AudioStreamPlayer2D = $ErrorSound
@onready var success_sound: AudioStreamPlayer2D = $SuccessSound
@onready var timer: Timer = $Timer
var currchar: int = 0
var listen: bool = true

func aumentar() -> void:
	var next: int = caracteres[currchar].text.to_ascii_buffer()[0] + 1
	
	if next > 90: next = 48
	if next > 57 and next < 65: next = 65
	caracteres[currchar].text = char(next)

func disminuir() -> void:
	var next: int = caracteres[currchar].text.to_ascii_buffer()[0] - 1
	
	if next < 48: next = 90
	if next < 65 and next > 57: next = 57
	caracteres[currchar].text = char(next)

func verificar() -> void:
	var contrasena: String = ""
	for element in caracteres:
		contrasena += element.text
	
	if Globals.passwords.find_key(contrasena) != null:
		listen = false
		Globals.nivel = Globals.passwords.find_key(contrasena)
		animaciones[currchar].play("visible")
		audio_stream_player_2d.stop()
		timer.start()
		success_sound.play()
		return
	
	error_sound.play()
func _ready() -> void:
	for element in animaciones:
		element.play("invisible")

func _process(delta: float) -> void:
	if not listen: return
	
	animaciones[currchar].play("parpadeando")
	
	if Input.is_action_just_pressed("Arriba"):
		aumentar()
		
	if Input.is_action_just_pressed("Abajo"):
		disminuir()
	
	if (Input.is_action_just_pressed("Saltar") or Input.is_action_just_pressed("Derecha")) and currchar < 5:
		animaciones[currchar].play("visible")
		currchar += 1
	
	if Input.is_action_just_pressed("Izquierda") and currchar >= 0:
		caracteres[currchar].text = "A"
		animaciones[currchar].play("invisible")
		currchar -= 1
	
	if Input.is_action_just_pressed("Izquierda") and currchar < 0:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
	
	if Input.is_action_just_pressed("Start"):
		verificar()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/new_level.tscn")
