class_name State_Walk extends State

@export var move_speed: float = 100.0

@onready var idle: State = $"../Idle"
@onready var attack: State = $"../Attack"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




# What happens when the player enter this state
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass
	
	
# What happens when the player exits this state	
func Exit() -> void:
	pass

# What happens during the _process update in this State?		
func Process(delta: float)  -> State:
	if player.direction == Vector2.ZERO:
		return idle
		
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	
	return null
	
# What happens during the _physics_process update in this State?	
func Physics(delta: float)  -> State:
	return null	
	
# What happens with input events in this State	
func HandleInput(event: InputEvent)  -> State:
	if event.is_action_pressed("attack"):
		return attack
	return null	
