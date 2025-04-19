class_name finish extends Sprite2D

var worldToLoadName: String
var worldNames: Array = ["cone","pine","aisu"]
@onready var worldTitlePref := preload("res://worldAnnounce.tscn") 
var titleDict := {"cone":"Abstract Coneland","pine":"Squirrely Pinetree","aisu":"The WaferCone Dimension"}

func _ready():
	worldToLoadName = worldNames.pick_random()
	worldNames.erase(worldToLoadName)

func announce():
	var temp = worldTitlePref.instantiate()
	temp.get_node("RichTextLabel").text = titleDict[worldToLoadName]
	get_tree().root.get_node("gameManager/CanvasLayer").add_child(temp)
	get_node("AudioStreamPlayer2D").playing = true
