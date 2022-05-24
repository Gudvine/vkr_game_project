extends Node2D


export var width = 128
export var height = 128
onready var tilemap = $TileMap
var simp_noise = OpenSimplexNoise.new()


func _ready():
	randomize()
	simp_noise.seed = randi()
	simp_noise.octaves = 5
	create_map()

func create_map() -> void:
	for x in width:
		for y in height:
			var rand = floor((abs(simp_noise.get_noise_2d(x,y))*100))
			tilemap.set_cell(x, y, rand)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
