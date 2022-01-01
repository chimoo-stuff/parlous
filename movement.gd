extends KinematicBody2D

""" 
im not sure if you wanted me
to make this a seperate script
"""

var velocity = Vector2(0,-1)
const SPEED = 180
const GRAVITY = 30
const JUMPFORCE = -900
func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
	if Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
