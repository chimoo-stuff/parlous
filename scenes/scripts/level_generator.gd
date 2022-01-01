extends Node2D

var WORLD_SIZE = 100
var Global_Time = 0
var players = []
var rng = RandomNumberGenerator.new()
var biome_ids = 2
var biomes = {}
var day = true
var daytrans = false
var weather = "clear"

onready var corresponding_ts = {1 : $grassland, 2 : $desert}
onready var canvas_color = $Darkness.get_color()
# Colors
onready var darkness = Color(91, 30, 89, 255)
onready var full_light = Color(255, 255, 255, 255)
func _ready():
	Global_Time += 1
	_generate(100)

func _process(delta):
	if daytrans == true:
		canvas_color = $Darkness.get_color()
		if day == false:
			if $Darkness.get_color().r > 91:
				canvas_color.r -= .001
			elif $Darkness.get_color().g > 30:
				canvas_color.g -= .001
			elif $Darkness.get_color().b > 89:
				canvas_color.b -= .01
			else:
				daytrans = false
		else:
			if $Darkness.get_color().r < 255:
				canvas_color.r += .01
			elif $Darkness.get_color().g < 255:
				canvas_color.g += .01
			elif $Darkness.get_color().b < 255:
				canvas_color.b += .01
			else:
				daytrans = false
		$Darkness.set_color(canvas_color)
func _fadeintocol():
	pass
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
			for biome in biomes:
				if abs(biomes[biome][2].x - x) <= biomes[biome][1]:
					rng.randomize()
					var tile_sel = rng.randi_range(0, 1)
					corresponding_ts[biome].set_cell(x, y, tile_sel)
				else:
					var tile_sel = rng.randi_range(0, 1)
					corresponding_ts[1].set_cell(x, y, tile_sel)

func generate_biomes():
	var biome_c = WORLD_SIZE / 50
	for biome in range(1, biome_c):
		rng.randomize()
		var biome_s = WORLD_SIZE / 4 + rng.randi_range(1, 5)
		rng.randomize()
		var biometype = rng.randi_range(1, biome_ids)
		var startposx = rng.randi_range(1, WORLD_SIZE)
		rng.randomize()
		var startposy = rng.randi_range(1, WORLD_SIZE)
		biomes[biome] = [biometype, biome_s, Vector2(startposx, startposy)]
	print(biomes)



func _on_GlobalTime_timeout():
	Global_Time += .5
	for player in players:
		player.age += .5
	switch_dayn()
	$GlobalTime.start()
	print("h")
		
func switch_dayn():
	daytrans = true
