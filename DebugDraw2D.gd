extends Node2D

const Cube = preload("./primitives/DebugCube2D.gd")
const Circle = preload("./primitives/DebugCircle2D.gd")

var cubes = []
var circles = []

func draw_cube(center, size = 10, color = Color(1, 0, 1), filled = false, duration = 0):
	var cube = Cube.new(center, size, color, filled, duration)
	cubes.push_back(cube)
	
func draw_circle(center, radius = 10, color = Color(1, 0, 1), filled = false, duration = 0):
	var circle = Circle.new(center, radius, color, filled, duration)
	circles.push_back(circle)

func _ready():
	set_process(true)
	z_index = 1000

func _process(delta):
	_process_primitives(cubes, delta)
	_process_primitives(circles, delta)
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
	for cube in cubes:
		draw_rect(Rect2(cube.center - Vector2(cube.size, cube.size) / 2, Vector2(cube.size, cube.size)), 
			cube.color, cube.filled)
			
	for circle in circles:
		if circle.filled:
			_draw_circle_arc_filled(circle.center, circle.radius, 0, 360, circle.color)
		else:
			_draw_circle_arc(circle.center, circle.radius, 0, 360, circle.color)


# Taken and adapted from docs.godotengine.org/en/3.0/tutorials/2d/custom_drawing_in_2d.html
func _draw_circle_arc(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()

	for i in range(nb_points+1):
		var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	for index_point in range(nb_points):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color)


# Taken and adapted from docs.godotengine.org/en/3.0/tutorials/2d/custom_drawing_in_2d.html
func _draw_circle_arc_filled(center, radius, angle_from, angle_to, color):
    var nb_points = 32
    var points_arc = PoolVector2Array()
    points_arc.push_back(center)
    var colors = PoolColorArray([color])

    for i in range(nb_points+1):
        var angle_point = deg2rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
        points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
    draw_polygon(points_arc, colors)