class_name enemy extends CharacterBody2D

var pl: player
var speed = 70
@onready var explosion = preload("res://boom.tscn") 

func _physics_process(_delta):
	var direction = global_position.direction_to(pl.global_position)
	velocity = direction * speed
	move_and_slide()

func die():
	var tE = explosion.instantiate()
	tE.position = position
	add_sibling(tE)
	tE.emitting = true
	queue_free()
