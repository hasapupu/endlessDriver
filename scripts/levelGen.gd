extends Node

@export var levelPrefs : Array
@onready var enemyDict: Dictionary = {"debug":"res://enemy.tscn","aisu":"res://aisuEnemy.tscn","cone":"res://coneEnemy.tscn","pine":"res://squirrelCar.tscn"}
var cPos: Vector2
var cRot: float
@onready var pl: player = get_parent().get_node("pp/player")
@onready var finScene = preload("res://finishLine.tscn")
var shouldSpawnFLine := true
@onready var roadSpriteDict := {"STRAIGHT":{"debug":preload("res://stageAssets/heteRoad1.png"),"aisu":preload("res://stageAssets/heteRoad2.png"),"cone":preload("res://stageAssets/heteRoad3.png"),"pine":preload("res://stageAssets/heteRoad4.png")},"SMALLLEFT":{"debug":preload("res://stageAssets/smallRoadRight1.png"),"aisu":preload("res://stageAssets/smallRoadRight2.png"),"cone":preload("res://stageAssets/smallRoadRight3.png"),"pine":preload("res://stageAssets/smallRoadRight4.png")},"SMALLRIGHT":{"debug":preload("res://stageAssets/smallRoadLeft1.png"),"aisu":preload("res://stageAssets/smallRoadLeft2.png"),"cone":preload("res://stageAssets/smallRoadLeft3.png"),"pine":preload("res://stageAssets/smallRoadLeft4.png")},"BIGLEFT":{"debug":preload("res://stageAssets/bigRightRoad1.png"),"aisu":preload("res://stageAssets/bigRightRoad2.png"),"cone":preload("res://stageAssets/bigRightRoad3.png"),"pine":preload("res://stageAssets/bigRightRoad4.png")},"BIGRIGHT":{"debug":preload("res://stageAssets/bigLeftRoad1.png"),"aisu":preload("res://stageAssets/bigLeftRoad2.png"),"cone":preload("res://stageAssets/bigLeftRoad3.png"),"pine":preload("res://stageAssets/bigLeftRoad4.png")}}
var fCount := 1

func appendTile():
	var tempTile: tile = load(levelPrefs.pick_random()).instantiate()
	tempTile.global_position = cPos
	tempTile.global_rotation_degrees = cRot
	add_child(tempTile)
	if pl != null:
		tempTile.get_node("Sprite2D").texture = roadSpriteDict[tempTile.type][pl.currentWorld]
	cRot += tempTile.endAngle
	cPos = tempTile.endPoint
	#if currentLevels.size() > 15:
		#currentLevels[0].call_deferred("queue_free")

func spawnEnemy(inp:String):
	var tempE = load(enemyDict[inp]).instantiate() as enemy
	tempE.pl = pl
	tempE.global_position = pl.global_position+ Vector2(randi_range(-500,500),randi_range(-500,500))
	pl.add_child(tempE)
	
func _ready():
	cRot = get_node("Node2D").endAngle
	cPos = get_node("Node2D").endPoint
	for i in range(10):
		appendTile()
		print(cRot)
		print(cPos)

func _on_timer_timeout():
	for i in range(2):
		#spawnEnemy(pl.currentWorld)
		pass	

