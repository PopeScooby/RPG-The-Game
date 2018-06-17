extends KinematicBody2D

const UP = Vector2(0,-1)

var speed = 200
var gravity = 20
var jump_Height = -600
var acceleration = 50
var max_speed = 200
var motion = Vector2(0,0)

func _physics_process(delta):
	
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+acceleration, max_speed)
		$Hero_Image.flip_h = false
		$Hero_Image.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-acceleration, -max_speed)
		$Hero_Image.flip_h = true
		$Hero_Image.play("Run")
	else:
		$Hero_Image.play("Idle")
		friction = true
		
		
		

	if is_on_floor():
		if Input.is_action_pressed("ui_jump"):
			motion.y = jump_Height			
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y <0:
			$Hero_Image.play("Jump")
		else:
			$Hero_Image.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
		
	motion = move_and_slide(motion, UP)
	
	pass