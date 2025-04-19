class_name hurtBox extends Area2D

func _init():
	collision_layer = 0
	collision_mask = 2

func _ready():
	self.connect("area_entered", _on_area_entered)

func _on_area_entered(hitbox: hitBox):
	if hitbox == null:
		return
	if owner is player:
		if hitbox.owner is enemy:
			hitbox.owner.die()
			owner.score -= 9
	if get_parent() is pickup:
		if hitbox.owner is player:
			get_parent().spr.texture = get_parent().hitSprite 
			get_parent().sound.play()
			call_deferred("queue_free")
	if owner is finish:
		if hitbox.owner is player:
			hitbox.owner.currentWorld = owner.worldToLoadName
			get_tree().root.get_node("gameManager/currentLevel").shouldSpawnFLine = true
			call_deferred("queue_free")
