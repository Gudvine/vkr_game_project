extends Node2D


var noise = OpenSimplexNoise.new()


func _ready():
	
	noise.period = 32
	noise.persistence = 0.3
	
	for x in range(30):
		for y in range(20):
			var noise_height = noise.get_noise_1d(x)
			
			if ceil(noise_height * 10) < y or y > 5:
				$TileMap.set_cellv(Vector2(x,y), 0)
	
	$TileMap.update_bitmask_region(Vector2(0,0), Vector2(300,200))
