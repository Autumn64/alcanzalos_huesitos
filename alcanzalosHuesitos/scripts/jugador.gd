extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -300.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var salto: AudioStreamPlayer2D = $Salto
@onready var bgm: AudioStreamPlayer2D = $"../BGM"
var music: float = 0.0


func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Start") and Engine.time_scale == 0.00000000000001:
		bgm.play()
		bgm.play(music)
		Engine.time_scale = 1
	elif Input.is_action_just_pressed("Start") and Engine.time_scale == 1:
		music = bgm.get_playback_position()
		bgm.stop()
		Engine.time_scale = 0.00000000000001
	
	if Engine.time_scale == 0.00000000000001 or get_tree().paused == true:
		return
	
	# Add the gravity.
	if not is_on_floor():
		if sprite.animation != "saltar":
			sprite.play("saltar")
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Saltar") and is_on_floor():
		salto.play()
		velocity.y = JUMP_VELOCITY
		
	var direction := Input.get_axis("Izquierda", "Derecha")
	
	if direction != 0 and is_on_floor() and Engine.time_scale != 0.00000000000001:
		sprite.play("correr")
	if direction == 0 and is_on_floor() and Engine.time_scale != 0.00000000000001:
		sprite.play("default")
		
	if direction > 0 and Engine.time_scale != 0.00000000000001:
		sprite.flip_h = false
	elif direction < 0 and Engine.time_scale != 0.00000000000001:
		sprite.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
