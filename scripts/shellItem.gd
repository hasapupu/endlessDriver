extends item

func activate():
	nodeBody.velocity = get_tree().root.get_node("gameManager/pp/player").velocity * 3.5
	nodeBody.reparent(get_tree().root.get_node("gameManager"),true)
	
func _on_finished():
	call_deferred("queue_free")
	


func _on_timer_timeout():
	pass # Replace with function body.
