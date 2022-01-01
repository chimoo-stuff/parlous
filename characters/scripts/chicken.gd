extends KinematicBody2D
# up, down left right; U, D, L, R
var anim = "D"
var body_data = {}
onready var age = 0
var health = 1

var inventory = {}

func _ready():
	pass

func _process(delta):
	# Do not uncomment this.
	animate_body()

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
