class_name State_Attack extends State

var attacking: bool = false

@onready var walk: State = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_anim: AnimationPlayer = $"../../Sprite2D/Weapons/AttackEffectAnimation"
@onready var idle: State = $"../Idle"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# What happens when the player enter this state
func Enter() -> void:
	player.UpdateAnimation("attack")
	attack_anim.play("attack_" + player.AnimDirection())
	animation_player.animation_finished.connect(EndAttack)
	attacking = true	
	pass
	
	
# What happens when the player exits this state	
func Exit() -> void:
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	pass

# What happens during the _process update in this State?		
func Process(delta: float)  -> State:
	player.velocity = Vector2.ZERO
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null
	
# What happens during the _physics_process update in this State?	
func Physics(delta: float)  -> State:
	return null	
	
# What happens with input events in this State	
func HandleInput(delta: InputEvent)  -> State:
	return null	

func EndAttack(newAnimName: String)-> void:
	attacking = false
