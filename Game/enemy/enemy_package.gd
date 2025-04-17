extends Resource

class_name EnemyPackage # used for spawning enemies, contains all of the variables needed to create an Enemy

@export var ID = 0

@export var walk_speed = 90

enum Walkers {BOUNCY, FOLLOWY}

var walker_map ={
	Walkers.BOUNCY : preload("res://enemy/walker/bouncy_walker.tscn"),
	Walkers.FOLLOWY : preload("res://enemy/walker/followy_walker.tscn"),
}

@export var walker_type : Walkers

enum Shooters {SPINY, AIMED}

var shooter_map ={
	Shooters.SPINY : preload("res://enemy/shooter/spiny_shooter.tscn"),
	Shooters.AIMED : preload("res://enemy/shooter/aimed_shooter.tscn"),
}

@export var shooter_type : Shooters

@export var guns : Array[PackedScene] 

@export var bullet_speed = 60 ## how fast the bullets move

@export var attack_speed = 1.0 ## attacks per second
