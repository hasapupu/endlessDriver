extends CharacterBody2D

@export var target: CharacterBody2D

func _physics_process(_delta):
	velocity = target.velocity * 0.8
	move_and_slide()
