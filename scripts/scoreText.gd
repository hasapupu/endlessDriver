extends RichTextLabel

@onready var pl: player = get_tree().root.get_node("gameManager/pp/player")

func _process(_delta):
	text = "Score:[shake][rainbow]" + str(floor(pl.score))
