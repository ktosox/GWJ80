extends RigidBody2D



@export var target : Node2D
var walk_towards_target = false
enum Type{basic, fast, strong}

@export var type : Type
@export var speed = 120
@export var health : int

func _ready():
	pass




func _physics_process(delta: float) -> void:
	
	# aim gun at player needs to go here
	if target != null:
		$Gun.rotation = global_position.angle_to_point(target.global_position)
	
	
	
	
	
	if !walk_towards_target:
		linear_velocity = Vector2.ZERO
		return
	var walk_direction = target.global_position - global_position
	linear_velocity = walk_direction.normalized() * speed
	
	
	


func _on_player_detector_body_entered(body: Node2D) -> void:
	walk_towards_target = false
	pass # Replace with function body.


func _on_player_detector_body_exited(body: Node2D) -> void:
	walk_towards_target = true
	pass # Replace with function body.


func _on_hit_box_hit_detected() -> void:
	health -= 1
	if(health <= 0):
		get_parent().score += 1
		queue_free()
	
