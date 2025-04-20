class_name pickup extends Node2D

@onready var spr: Sprite2D = get_node("Sprite2D")
@onready var hitSprite: Texture2D = preload("res://cones2.png")
@onready var sound: AudioStreamPlayer2D = get_node("AudioStreamPlayer2D")
@onready var itemDict := {"debug":preload("res://shellItem.tscn"),"pine":preload("res://nutItem.tscn"),"aisu":load(["res://coneItem.tscn","res://shellItem.tscn","res://nutItem.tscn"].pick_random()),"cone":preload("res://coneItem.tscn"),}
# 

func _ready():
	if randi_range(0,5) == 1:
		visible = true
		get_node("hurtBox/CollisionShape2D").set_deferred("disabled", false)
		
func _on_body_entered(body):
	if body is player:
		pass		
