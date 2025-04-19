extends Sprite2D

@onready var sprDict := {"debug":preload("res://stageAssets/defBg1.png"),"aisu":preload("res://stageAssets/defBg2.png"),"cone":preload("res://stageAssets/defBg3.png"),"pine":preload("res://stageAssets/defBg4.png")}
@onready var pl: player = get_tree().root.get_node("gameManager/pp/player")

func _process(delta):
	texture = sprDict[pl.currentWorld]
