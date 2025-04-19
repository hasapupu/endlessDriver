extends item

@onready var shell: CharacterBody2D = get_node("shell")

func _ready():
	shell.reparent(get_tree().root.get_node("gameManager/pp/player/shellPoint"),false)

func activate():
	shell.velocity = get_tree().root.get_node("gameManager/pp/player").velocity * 3.5
	shell.reparent(get_tree().root.get_node("gameManager"),true)
	call_deferred("queue_free")
	
