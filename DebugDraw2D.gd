extends Node2D

const Cube = preload("./primitives/DebugCube2D.gd")
const Circle = preload("./primitives/DebugCircle2D.gd")

var cubes = []
var circles = []

func draw_cube(center, size = 10, color = Color(1, 0, 1), duration = 0):
	var cube = Cube.new(center, size, color, duration)
	cubes.push_back(cube)
	
func draw_circle(center, radius = 10, color = Color(1, 0, 1), duration = 0):
	var circle = Circle.new(center, radius, color, duration)
	circles.push_back(circle)

func _ready():
	set_process(true)
	z_index = 1000

func _process(delta):
	process_primitives(cubes, delta)
	process_primitives(circles, delta)
	update()

func process_primitives(primitives, delta):
	var indices_to_remove = []
	for i in range(0, primitives.size()):
		var primitive = primitives[i]
		if primitive.duration_left < 0:
			indices_to_remove.push_back(i)
		primitive.duration_left -= delta
	for i in indices_to_remove:
		primitives.remove(i)

func _draw():
	for cube in cubes:
		draw_rect(Rect2(cube.center - Vector2(cube.size, cube.size) / 2, Vector2(cube.size, cube.size)), 
			cube.color, false)
	
	for circle in circles:
		.draw_circle(circle.center, circle.radius, circle.color)
	
#		var width = cube.width
#		var half_size = cube.size / 2
			
#		draw_line(center + Vector2(-half_size - width / 2, half_size),
#			center + Vector2(half_size + width / 2, half_size), cube.color, cube.width)
#		draw_line(center + Vector2(half_size, half_size),
#			center + Vector2(half_size, -half_size), cube.color, cube.width)
#		draw_line(center + Vector2(half_size + width / 2, -half_size),
#			center + Vector2(-half_size - width / 2, -half_size), cube.color, cube.width)
#		draw_line(center + Vector2(-half_size, -half_size),
#			center + Vector2(-half_size, half_size), cube.color, cube.width)