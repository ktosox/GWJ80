extends CharacterBody2D

signal player_got_hit(damage)
@onready var capture_powerup_animator: AnimationPlayer = $capturePowerupAnimator

var ammo = 0
const SPEED = 300.0

func _ready():
	GameManager.current_player = self
	GameManager.connect("game_over", Callable(self, "on_death_detected"))
	GameManager.connect("changePlayerState", Callable(self, "powerupPickedUp"))
	connect("player_got_hit",Callable(GameManager,"change_health"))
	pass

func _physics_process(delta: float) -> void:
	var direction := Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down"))
	velocity = direction.normalized() * SPEED
	move_and_slide()
	look_at(get_global_mouse_position())
	


func _on_hit_box_hit_detected() -> void:
	if $DamageAnimator.is_playing():
		return
	$DamageAnimator.play("damage")
	emit_signal("player_got_hit",-1)
	pass # Replace with function body.

func on_death_detected():
	$DamageAnimator.stop()
	$DamageAnimator.play("death")

func powerupPickedUp():
	capture_powerup_animator.play("powerUP")
