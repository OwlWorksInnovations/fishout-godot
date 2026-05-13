extends Sprite2D

var speed: float = 300
var velocity: Vector2 = Vector2(speed, -100)
@onready var trashbag: Sprite2D = $"."
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

func _process(delta: float) -> void:
	position += velocity * delta
	
	if position.y <= 15:
		velocity.y = -velocity.y
		audio_stream_player_2d.play()
	elif position.y >= 633:
		position = Vector2(592.0, 543.0)
		velocity = Vector2(speed, randf_range(-100, -25))
	
	if position.x <= 0:
		velocity.x = -velocity.x
		audio_stream_player_2d.play()
	elif position.x >= 1167:
		velocity.x = -velocity.x
		audio_stream_player_2d.play()

func _on_ball_area_body_entered(body: Node2D) -> void:
	velocity.y = -velocity.y
	audio_stream_player_2d.play()

func _on_ball_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Trashbag") or area.get_parent().is_in_group("Trashbag"):
		velocity.y = -velocity.y
		area.get_parent().queue_free()
		audio_stream_player_2d.play()
		cpu_particles_2d.emitting = true
