class_name tile extends Node2D

@onready var endPoint: Vector2 = get_node("endPoint").global_position
@export var endAngle: float = 0
@export var type: String = "STRAIGHT"

func _on_timer_timeout():
	queue_free()
