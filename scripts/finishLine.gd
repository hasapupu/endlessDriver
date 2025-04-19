class_name finish extends Sprite2D

var worldToLoadName: String
var worldNames: Array = ["cone","pine","aisu"]

func _ready():
	worldToLoadName = worldNames.pick_random()
	worldNames.erase(worldToLoadName)
