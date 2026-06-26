class_name HitPoints extends HurtBox

@export var hit_points: int = 5




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func DecreaseHp(new_np: int):
	var new_hp = hit_points - damage
	hit_points = new_hp
	if new_hp < 0:
		hit_points = 4	
	print(new_hp)
