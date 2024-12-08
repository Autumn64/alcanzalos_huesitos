extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var timer: Timer = $Timer
@onready var bgm: AudioStreamPlayer2D = $"../BGM"
	
func _on_body_entered(body: Node2D) -> void:
	timer.start()
	bgm.stop()
	audio_stream_player_2d.play()
	Globals.aumentar_puntos(100)
	Globals.mover_vidas(1)
	Globals.aumentar_nivel()
	get_tree().paused = true

func _on_timer_timeout() -> void:
	get_tree().paused = false
	if Globals.nivel > 2:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		return
	get_tree().change_scene_to_file("res://scenes/nivel" + str(Globals.nivel) + ".tscn")
