extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if animated_sprite.visible == false:
		return
	animated_sprite.hide()
	timer.start()
	audio_stream.play()
	Globals.aumentar_puntos(10)
	
func _on_timer_timeout() -> void:
	queue_free()
