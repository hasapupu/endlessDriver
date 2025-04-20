extends item

@onready var coneRot := preload("res://coneCircle.tscn").instantiate() 

func activate():
	nodeBody.call_deferred("queue_free")
	get_tree().root.get_node("gameManager/pp/player").call_deferred("add_child",coneRot)

func _on_timer_timeout():
	coneRot.call_deferred("queue_free")
	call_deferred("queue_free")
