class_name Plant extends Node2D

@onready var hp: Node2D = $"../HP"
# Called when the node enters the scene tree for the first time.
func _ready():
	$HitBox.Damaged.connect(TakeDamage)
	pass # Replace with function body.


func TakeDamage(damage: int) -> void:
	hp.DecreaseHp(damage)
	if hp.hit_points == 0:
		queue_free()
	pass
