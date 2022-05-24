extends KinematicBody2D

var velocity = Vector2()
export var direction = -1

func _ready():
	if direction == 1:
		$Sprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction


func _physics_process(delta):
	if is_on_wall() and is_on_floor():
		direction = direction * -1
		$Sprite.flip_h = not $Sprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	
	velocity.x = 50 * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_top_checker_body_entered(body):
	print("top")
	#queue_free()


func _on_sides_checker_body_entered(body):
	print("sides")

