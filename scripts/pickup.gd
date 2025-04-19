class_name pickup extends Node2D

@onready var spr: Sprite2D = get_node("Sprite2D")
@onready var hitSprite: Texture2D = preload("res://cones2.png")
@onready var sound: AudioStreamPlayer2D = get_node("AudioStreamPlayer2D")

func _ready():
	if randi_range(0,5) == 1:
		visible = true
		get_node("hurtBox/CollisionShape2D").set_deferred("disabled", false)
		
func _on_body_entered(body):
	if body is player:
		pass		
