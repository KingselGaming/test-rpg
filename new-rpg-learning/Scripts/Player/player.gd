class_name Player extends CharacterBody2D

var main_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO

signal DirectionChanged(new_direction: Vector2)

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine



func _ready() -> void:
	state_machine.Initialize(self)
	pass
	
func _process(delta):
	
	#direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	#direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")	
	direction = Vector2(
	Input.get_axis("left", "right"),
	Input.get_axis("up", "down"),
	).normalized()
	pass
	
func _physics_process(delta):
	move_and_slide()

func SetDirection() -> bool:
	var new_dir: Vector2 = main_direction
	
	if direction == Vector2.ZERO:
		return false
	
	# ORIGINAL LOGIC: Check X first
	if direction.x != 0:
		# --- ONLY CHANGE TO LEFT/RIGHT IF IT FORCES A SPRITE FLIP ---
		var wants_left = direction.x < 0
		var currently_facing_left = sprite.scale.x == -1
		
		if main_direction == Vector2.UP or main_direction == Vector2.DOWN:
			# If we are walking vertically, only switch to side-walking if our key press
			# forces the sprite to physically flip to the opposite side!
			if (wants_left and not currently_facing_left) or (not wants_left and currently_facing_left):
				new_dir = Vector2.LEFT if wants_left else Vector2.RIGHT
			else:
				# Keep moving vertically, ignore the side animation change
				new_dir = main_direction
		else:
			# Normal horizontal movement behavior
			new_dir = Vector2.LEFT if wants_left else Vector2.RIGHT
	else:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
		
	if new_dir == main_direction:
		return false
		
	main_direction = new_dir
	DirectionChanged.emit(new_dir)
	if direction.x != 0:
		sprite.scale.x = -1 if main_direction == Vector2.LEFT else 1
	
	return true

#func SetDirection() -> bool:
	#var new_dir: Vector2 = main_direction
	#
	#if direction == Vector2.ZERO:
		#return false
	#
	#if direction.x != 0:
		#new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	#else:
		#new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
		#
	#if new_dir == main_direction:
		#return false
		#
	#main_direction = new_dir
	#
	#if direction.x != 0:
		#sprite.scale.x = -1 if main_direction == Vector2.LEFT else 1
	#
	#return true

	
func UpdateAnimation(state: String) -> void:
	var anim_to_play = state + "_" + AnimDirection()
	#animation_player.play(state + "_" + AnimDirection())
	if animation_player.current_animation != anim_to_play:
		animation_player.play(anim_to_play)
	pass

func AnimDirection() -> String:
	if main_direction == Vector2.DOWN:
		return "down"
	elif main_direction == Vector2.UP:
		return "up"
	else: 
		return "side"
