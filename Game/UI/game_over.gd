extends ColorRect
@onready var animation_player: AnimationPlayer = $Label2/AnimationPlayer


func _ready() -> void:
	get_tree().paused = true
	animation_player.play("flashing")
	$Label3/AnimationPlayer.play("flashing")

func _on_reset_pressed() -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("up"):
		get_tree().paused = false
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("down"):
		get_tree().change_scene_to_file("res://level/home.tscn")
