class_name State extends Node

# Stores a reference to the player that this state belongs
static var player: Player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# What happens when the player enter this state
func Enter() -> void:
	pass
	
	
# What happens when the player exits this state	
func Exit() -> void:
	pass

# What happens during the _process update in this State?		
func Process(delta: float)  -> State:
	return null
	
# What happens during the _physics_process update in this State?	
func Physics(delta: float)  -> State:
	return null	
	
# What happens with input events in this State	
func HandleInput(delta: InputEvent)  -> State:
	return null	
