extends Node2D
var WORLD_SIZE = 100
var Global_Time = 0
var players = []
var rng = RandomNumberGenerator.new()
var biome_ids = 2
var biomes = {}
var day = true
var daytrans = false
onready var canvas_color = $Darkness.get_color()
func _ready():
	Global_Time += 1
	_generate(100)

func _process(delta):
	
	if daytrans == true:
		if day == false:
			if canvas_color.a > 0:
				canvas_color.a -= .01
				$Darkness.set_color(canvas_color)
			else:
				daytrans = false
		else:
			if canvas_color.a < 0:
				canvas_color.a += .01
				$Darkness.set_color(canvas_color)
func _generate(n):
	WORLD_SIZE = n
	generate_biomes()
	populate_tiles()
	$GlobalTime.start()
	
"""
populate_times
Iterates over the tile count given by WORLD_SIZE, fills in the values with 
base tiles.
"""
func populate_tiles():
	for x in range(0, 100):
		for y in range(0, 100):
			pass
func generate_biomes():
	rng.randomize()
	var biome_s = WORLD_SIZE / 4 + rng.randi_range(1, 5)
	var biome_c = WORLD_SIZE / 50
	for biome in range(0, biome_c):
		var biometype = rng.randi_range(0, biome_ids)
		print(biome)
		biomes[biome] = [biometype]



func _on_GlobalTime_timeout():
	Global_Time += .5
	for player in players:
		player.age += .5
	switch_dayn()
		
func switch_dayn():
	daytrans = true
