extends Node2D
var WORLD_SIZE = 1000
var Global_Time = 0

func _ready():
	Global_Time += 1

func _process(delta):
	pass
func _generate(n):
	WORLD_SIZE = n
	populate_tiles()
	$GlobalTime.start()

func populate_tiles():
	pass


func _on_GlobalTime_timeout():
	time 
