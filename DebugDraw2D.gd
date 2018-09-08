extends Node2D

const Line = preload("./primitives/DebugLine2D.gd")
const Rect = preload("./primitives/DebugRect2D.gd")
const CircleArc = preload("./primitives/DebugCircleArc2D.gd")

var rects = []
var circle_arcs = []
var lines = []

func draw_line(from, to, color = Color(1, 0, 1), line_width = 1, duration = 0):
	var line = Line.new(from, to, color, line_width, duration)
	lines.push_back(line)

func draw_line_vector(origin, vector, color = Color(1, 0, 1), line_width = 1, duration = 0):
	var line = Line.new(origin, origin + vector, color, line_width, duration)
	lines.push_back(line)

func draw_cube(center, size = 10, color = Color(1, 0, 1), line_width = 1, duration = 0):
	var cube = Rect.new(center, Vector2(size, size), color, false, line_width, duration)
	rects.push_back(cube)

func draw_cube_filled(center, size = 10, color = Color(1, 0, 1), duration = 0):
	var cube = Rect.new(center, Vector2(size, size), color, true, 1, duration)
	rects.push_back(cube)

func draw_rect(center, size = Vector2(15, 10), color = Color(1, 0, 1), line_width = 1, duration = 0):
	var rect = Rect.new(center, size, color, false, line_width, duration)
	rects.push_back(rect)

func draw_rect_filled(center, size = Vector2(15, 10), color = Color(1, 0, 1), duration = 0):
	var rect = Rect.new(center, size, color, true, 1, duration)
	rects.push_back(rect)
	
func draw_circle(center, radius = 10, resolution = 16, color = Color(1, 0, 1), line_width = 1, duration = 0):
	var circle = CircleArc.new(center, radius, 0, 360, false, resolution, color, false, line_width, duration)
	circle_arcs.push_back(circle)
	
func draw_circle_filled(center, radius = 10, resolution = 16, color = Color(1, 0, 1), duration = 0):
	var circle = CircleArc.new(center, radius, 0, 360, false, resolution, color, true, 1, duration)
	circle_arcs.push_back(circle)

func draw_circle_arc(center, radius = 10, angle_from = 0, angle_to = 90, pie = true, resolution = 16, 
		color = Color(1, 0, 1), line_width = 1, duration = 0):
	var circle_arc = CircleArc.new(center, radius, angle_from, angle_to, pie, resolution, color, false, line_width, duration)
	circle_arcs.push_back(circle_arc)

func draw_circle_arc_filled(center, radius = 10, angle_from = 0, angle_to = 90, pie = true, resolution = 16, 
		color = Color(1, 0, 1), duration = 0):
	var circle_arc = CircleArc.new(center, radius, angle_from, angle_to, pie, resolution, color, true, 1, duration)
	circle_arcs.push_back(circle_arc)

func _ready():
	set_process(true)
	z_index = 1000

func _process(delta):
	_process_primitives(rects, delta)
	_process_primitives(circle_arcs, delta)
	_process_primitives(lines, delta)
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
	_draw_primitives(rects)
	_draw_primitives(circle_arcs)
	_draw_primitives(lines)

func _draw_primitives(primitives):
	for primitive in primitives:
		var points = primitive.get_points()
		if primitive.filled:
			.draw_polygon(points, PoolColorArray([primitive.color]))
		else:
			for i in range(0, points.size() - 1):
				var from = points[i]
				var to = points[i + 1]
				.draw_line(from, to, primitive.color, primitive.line_width)