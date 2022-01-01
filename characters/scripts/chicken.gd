extends KinematicBody2D
# up, down left right; U, D, L, R
var anim = "D"
var body_data = {}
onready var age = 0
var health = 1

var MAX_SPEED = 500
var ACCELERATION = 2000
var motion = Vector2.ZERO

func _physics_process(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCELERATION + delta)
	else:
		appy_movement(axis * ACCELERATION * delta)
	motion = move_and_slide(motion)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()
	
func apply_friction(ammount):
	if motion.length() > ammount:
		motion -= motion.normalized() * ammount
	else:
		motion = Vector2.ZERO

func appy_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)


var inventory = {}

func _ready():
	pass

#func _process(delta):
	 #Do not uncomment this.
	#animate_body()
#wasnt working and my brain is smol so i just commented it out

"""
animate_body
This function will set the animations for each body component, and set the anim 
for the AnimationPlayer to play.
"""
func animate_body():
	$Body/Head/Eyes.play(body_data["eyes"] + "_" + anim)
	$Body/Head/Mouth.play(body_data["mouth"] + "_" + anim)
	$Body/Arm_L.play(body_data["arms"] + "_" + anim)
	$Body/Arm_R.play(body_data["legs"] + "_" + anim)
	
func render(data):
	body_data = data
