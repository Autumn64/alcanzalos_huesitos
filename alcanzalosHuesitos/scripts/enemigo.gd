extends Node2D

@onready var ray_cast_izq: RayCast2D = $RayCastIzq
@onready var ray_cast_der: RayCast2D = $RayCastDer
@onready var ray_cast_abj_izq: RayCast2D = $RayCastAbjIzq
@onready var ray_cast_abj_der: RayCast2D = $RayCastAbjDer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animated_sprite_2: AnimatedSprite2D = $AnimatedSprite2D2
@onready var audio_stream: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var timer: Timer = $Timer
@onready var bgm: AudioStreamPlayer2D = $"../../BGM"
@onready var corazon: AnimatedSprite2D = $"../../HUD/AnimatedSprite2D"

const SPEED = 30
var dir = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_der.is_colliding():
		dir = -1
	if ray_cast_izq.is_colliding():
		dir = 1
	if not ray_cast_abj_izq.is_colliding():
		dir = 1
	if not ray_cast_abj_der.is_colliding():
		dir = -1
	
	if dir == 1:
		animated_sprite.flip_h = true
		animated_sprite_2.flip_h = true
		
	elif dir == -1:
		animated_sprite.flip_h = false
		animated_sprite_2.flip_h = false
		
	position.x += dir * SPEED * delta
	
func _on_killzone_body_entered(body: Node2D) -> void:
	corazon.play("vacío")
	timer.start()
	bgm.stop()
	audio_stream.play()
	Globals.mover_vidas(-1)
	get_tree().paused = true
	
func _on_timer_timeout() -> void:
	get_tree().paused = false
	if Globals.vidas < 1:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		return
	get_tree().change_scene_to_file("res://scenes/new_level.tscn")
