class_name road extends Area2D

var pl: player
@onready var fLinePref = preload("res://finishLine.tscn")

func _ready():
	for i in get_overlapping_bodies():
		if i is player:
			pl = i
			get_parent().get_parent().pl = i
	if get_parent().get_parent().pl != null and int(floor(get_parent().get_parent().pl.score))  >= 200 * get_parent().get_parent().fCount and get_parent().get_parent().shouldSpawnFLine == true:
		add_child(fLinePref.instantiate())
		get_parent().get_parent().shouldSpawnFLine = false
		get_parent().get_parent().fCount += 1
func _on_enter(inp):
	if inp is player:
		if get_parent().get_parent().get_child_count() < 20 and pl == null:
			get_parent().get_parent().appendTile()
		pl = inp
		get_parent().get_parent().pl = inp

func _on_exit(inp):
	if inp == pl:
		get_parent().get_node("Timer").start()
