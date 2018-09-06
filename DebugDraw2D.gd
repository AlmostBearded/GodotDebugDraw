extends Node2D

const Cube = preload("./primitives/DebugCube2D.gd")
const CircleArc = preload("./primitives/DebugCircleArc2D.gd")

var cubes = []
var circle_arcs = []

func draw_cube(center, size = 10, color = Color(1, 0, 1), filled = false, duration = 0):
	var cube = Cube.new(center, size, color, filled, duration)
	cubes.push_back(cube)
	
func draw_circle(center, radius = 10, resolution = 16, color = Color(1, 0, 1), filled = false, duration = 0):
	var circle = CircleArc.new(center, radius, 0, 360, false, resolution, color, filled, duration)
	circle_arcs.push_back(circle)

func draw_circle_arc(center, radius = 10, angle_from = 0, angle_to = 90, pie = true, resolution = 16, 
		color = Color(1, 0, 1), filled = false, duration = 0):
	var circle_arc = CircleArc.new(center, radius, angle_from, angle_to, pie, resolution, color, filled, duration)
	circle_arcs.push_back(circle_arc)

func _ready():
	set_process(true)
	z_index = 1000

func _process(delta):
	_process_primitives(cubes, delta)
	_process_primitives(circle_arcs, delta)
	update()

func _process_primitives(primitives, delta):
	var indices_to_remove = []
	for i in range(0, primitives.size()):
		var primitive = primitives[i]
		if primitive.duration_left < 0:
			indices_to_remove.push_back(i)
		primitive.duration_left -= delta
	for i in indices_to_remove:
		primitives.remove(i)

func _draw():
	_draw_primitives(cubes)
	_draw_primitives(circle_arcs)

func _draw_primitives(primitives):
	for primitive in primitives:
		var points = primitive.get_points()
		if primitive.filled:
			.draw_polygon(points, PoolColorArray([primitive.color]))
		else:
			for i in range(0, points.size() - 1):
				var from = points[i]
				var to = points[i + 1]
				.draw_line(from, to, primitive.color)