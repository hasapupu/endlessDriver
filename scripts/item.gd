class_name item extends Control

@onready var sf: AudioStreamPlayer2D = get_node("AudioStreamPlayer2D")
@onready var nodeBody = get_children()[0]

func _ready():
	nodeBody.reparent(get_tree().root.get_node("gameManager/pp/player/shellPoint"),false)

func activate():
	pass
