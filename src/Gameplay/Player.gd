extends CharacterBody2D

const JUMP_HEIGHT = -350.0
const JUMP_BUFFER_TIMER = 0.15

const SPEED: float = 200.0
const ACCELERATION: float = 16.0
const FRICTION: float = 12.5
const GRAVITY: float = 14.5

var jump_buffer_timer: float = 0.0

func _physics_process(delta: float) -> void:
	var x_input: float = Input.get_action_strength("walk_right") - Input.get_action_strength("walk_left")
	var velocity_weight: float = delta * (ACCELERATION if x_input else FRICTION)
	velocity.x = lerp(velocity.x, x_input * SPEED, velocity_weight)
	
	if is_on_floor() and jump_buffer_timer > 0:
		velocity.y = JUMP_HEIGHT
		jump_buffer_timer = 0

	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer = JUMP_BUFFER_TIMER
	elif velocity.y < 0.0:
		if Input.is_action_just_released("jump"):
			jump_buffer_timer -= delta
			velocity.y *= 0.5

	velocity.y += GRAVITY
	move_and_slide()
