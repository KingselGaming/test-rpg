class_name PlayerInteractionHost extends Node2D

@onready var player: Player = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.DirectionChanged.connect(UpdateDirection)
	pass # Replace with function body.



func UpdateDirection(new_direction: Vector2) -> void:
	match new_direction:
		Vector2.RIGHT:
			scale.x = 1
		Vector2.LEFT:
			scale.x = -1
	pass
