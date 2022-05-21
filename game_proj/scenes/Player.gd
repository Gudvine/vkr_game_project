extends KinematicBody2D

const SPEED = 150.0
const FLOOR = Vector2(0, -1)
const GRAVITY = 950
const JUMP_POWER = 350

var velocity_value = Vector2()

func _physics_process(delta):
	
	if position.y > 800:
		position.y = 0
	
	if Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		velocity_value.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		velocity_value.x = SPEED
	else:
		velocity_value.x = 0
	
	if Input.is_action_pressed("ui_up") && is_on_floor():
		velocity_value.y = -JUMP_POWER

	velocity_value.y += GRAVITY * delta
	velocity_value = move_and_slide(velocity_value, FLOOR)  
