extends CharacterBody2D

var speed: float = 300
@onready var player_sprite: Sprite2D = $PlayerSprite
@onready var player_dialog: Label = $PlayerDialog
@onready var timer: Timer = $Timer

var trash_attacker_lines: Array[String] = [
	"Get off my reef!",
	"This isn't your current, plastic!",
	"Back to the surface with you!",
	"I’m taking back the blue!",
	"You’ve drifted into the wrong neighborhood.",
	"Taste scale and tooth!",
	"Tear it open! Spill the secrets!",
	"I'll shred you to confetti!",
	"Fin-ishing move!",
	"Target locked. Engaging the heap!",
	"Time for some deep-sea disposal!",
	"Consider this a 'gill-ty' verdict!",
	"You’re looking a little... bagged down.",
	"I’m the reel deal, you’re just junk!",
	"Hope you can swim, because you're sinking!",
	"Chomp!",
	"Trash!",
	"Begone!",
	"Shredded!",
	"Filth!"
]

func _ready() -> void:
	timer.start(3)

func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		player_sprite.flip_h = true
		if position.x <= 90:
			pass
		else:
			position.x -= speed * delta
	
	if Input.is_action_pressed("right"):
		player_sprite.flip_h = false
		if position.x >= 1045:
			pass
		else:
			position.x += speed * delta

func _on_timer_timeout() -> void:
	var plr_line = trash_attacker_lines.pick_random()
	player_dialog.text = plr_line
