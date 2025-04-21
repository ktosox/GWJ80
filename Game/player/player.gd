extends CharacterBody2D

signal player_got_hit(damage)



const SPEED = 300.0
const INC_SPEED = 500.0
var pick_up_enabled : bool = false
var pick_up : String = ""

var normal_speed : bool = true

func _ready():
	GameManager.current_player = self
	GameManager.connect("game_over", Callable(self, "on_death_detected"))
#	GameManager.connect("changePlayerState", Callable(self, "powerupPickedUp"))
	connect("player_got_hit",Callable(GameManager,"change_health"))
	GameManager.connect("enable_shield", Callable(self, "enable_shield"))
	GameManager.connect("speed_changed", Callable(self, "change_speed"))
	GameManager.connect("gravity_fx", Callable(self, "push_away_bullets"))

func _physics_process(delta: float) -> void:

	var direction := Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down"))
	look_at(get_global_mouse_position())
	
	if(normal_speed):
		velocity = direction.normalized() * SPEED
	else:
		velocity = direction.normalized() * INC_SPEED
	
	
	
	move_and_slide()


func _on_hit_box_hit_detected() -> void:
	if $DamageAnimator.is_playing():
		return
	if(!$ShieldAnimator.is_playing()):
		$DamageAnimator.play("damage")
		emit_signal("player_got_hit",-1)

func on_death_detected():
	$AudioComponent.play()
	$DamageAnimator.stop()
	$DamageAnimator.play("death")

func  powerupPickedUp():
	pass

func _on_shield_animator_animation_finished(anim_name: StringName) -> void:
	GameManager.pick_up_enabled = false

func enable_shield():
	$ShieldAnimator.play("show_shield")

func change_speed(normal_speed_):
	normal_speed = normal_speed_
	
func push_away_bullets():

	$PushAwayAnimator.play("push_away")

func _on_push_away_animator_animation_finished(anim_name: StringName) -> void:
	GameManager.pick_up_enabled = false
	pass # Replace with function body.
