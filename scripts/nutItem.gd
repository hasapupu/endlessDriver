extends item

@onready var pl := get_tree().root.get_node("gameManager/pp/player") as player
@onready var rainbowMat: ShaderMaterial = preload("res://rainbow.tres")
var pMat: Material

func activate():
	nodeBody.call_deferred("queue_free")
	pl.damageable = false
	pMat = pl.get_node("Sprite2D").get_material() 
	(pl.get_node("Sprite2D") as Sprite2D).set_material(rainbowMat)

func _on_timer_timeout():
	pl.damageable = true
	pl.get_node("Sprite2D").set_material(pMat)
	call_deferred("queue_free")
