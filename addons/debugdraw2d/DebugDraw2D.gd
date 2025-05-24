extends Node2D

const Line = preload("./primitives/DebugLine2D.gd")
const Rect = preload("./primitives/DebugRect2D.gd")
const CircleArc = preload("./primitives/DebugCircleArc2D.gd")

var rects = []
var circle_arcs = []
var lines = []

func line(from, to, color = Color(1, 0, 1), line_width = 1.0, duration = 0.0):
	var line = Line.new(from, to, color, line_width, duration)
	lines.push_back(line)

func line_vector(origin, vector, color = Color(1, 0, 1), line_width = 1.0, duration = 0.0):
	var line = Line.new(origin, origin + vector, color, line_width, duration)
	lines.push_back(line)

func arrow(from, to, color = Color(1, 0, 1), line_width = 1.0, duration = 0.0):
	var arrow_len = (to - from).length()
	var arrow_dir = (to - from) / arrow_len
	var arrow_head_size = arrow_len * .25
	var arrow_head_start = from + arrow_dir * arrow_len * .75
	var arrow_normal = Vector2(arrow_dir.y, -arrow_dir.x)
	var arrow_start_1 = arrow_head_start + arrow_normal * arrow_head_size
	var arrow_start_2 = arrow_head_start - arrow_normal * arrow_head_size

	var line = Line.new(from, to, color, line_width, duration)
	var head_line_1 = Line.new(arrow_start_1, to - arrow_dir * line_width/2, color, line_width, duration)
	var head_line_2 = Line.new(arrow_start_2, to - arrow_dir * line_width/2, color, line_width, duration)

	lines.push_back(line)
	lines.push_back(head_line_1)
	lines.push_back(head_line_2)

func arrow_vector(origin, vector, color = Color(1, 0, 1), line_width = 1.0, duration = 0.0):
	arrow(origin, origin + vector, color, line_width, duration)

func cube(center, size = 10.0, color = Color(1, 0, 1), line_width = 1.0, duration = 0.0):
	var cube = Rect.new(center, Vector2(size, size), color, false, line_width, duration)
	rects.push_back(cube)

func cube_filled(center, size = 10.0, color = Color(1, 0, 1), duration = 0.0):
	var cube = Rect.new(center, Vector2(size, size), color, true, 1, duration)
	rects.push_back(cube)

func rect(center, size = Vector2(15, 10), color = Color(1, 0, 1), line_width = 1.0, duration = 0.0):
	var rect = Rect.new(center, size, color, false, line_width, duration)
	rects.push_back(rect)

func rect_filled(center, size = Vector2(15, 10), color = Color(1, 0, 1), duration = 0.0):
	var rect = Rect.new(center, size, color, true, 1, duration)
	rects.push_back(rect)

func circle(center, radius = 10.0, resolution = 16, color = Color(1, 0, 1), line_width = 1.0, duration = 0.0):
	var circle = CircleArc.new(center, radius, 0, 360, false, resolution, color, false, line_width, duration)
	circle_arcs.push_back(circle)

func circle_filled(center, radius = 10.0, resolution = 16, color = Color(1, 0, 1), duration = 0.0):
	var circle = CircleArc.new(center, radius, 0, 360, false, resolution, color, true, 1, duration)
	circle_arcs.push_back(circle)

func circle_arc(center, radius = 10.0, angle_from = 0.0, angle_to = 90.0, pie = true, resolution = 16,
		color = Color(1, 0, 1), line_width = 1.0, duration = 0.0):
	var circle_arc = CircleArc.new(center, radius, angle_from, angle_to, pie, resolution, color, false, line_width, duration)
	circle_arcs.push_back(circle_arc)

func circle_arc_filled(center, radius = 10.0, angle_from = 0.0, angle_to = 90.0, pie = true, resolution = 16,
		color = Color(1, 0, 1), duration = 0.0):
	var circle_arc = CircleArc.new(center, radius, angle_from, angle_to, pie, resolution, color, true, 1, duration)
	circle_arcs.push_back(circle_arc)

func _ready():
	set_process(true)
	z_index = 1000

func _process(delta):
	_process_primitives(rects, delta)
	_process_primitives(circle_arcs, delta)
	_process_primitives(lines, delta)
	queue_redraw()

func _process_primitives(primitives, delta):
	var indices_to_remove = []
	for i in range(0, primitives.size()):
		var primitive = primitives[i]
		if primitive.duration_left < 0:
			indices_to_remove.push_back(i)
		primitive.duration_left -= delta
	for i in range(indices_to_remove.size() - 1, -1, -1):
		primitives.remove_at(indices_to_remove[i])

func _draw():
	_draw_primitives(rects)
	_draw_primitives(circle_arcs)
	_draw_primitives(lines)

func _draw_primitives(primitives):
	for primitive in primitives:
		var points = primitive.get_points()
		if primitive.filled:
			super.draw_polygon(points, PackedColorArray([primitive.color]))
		else:
			for i in range(0, points.size() - 1):
				var from = points[i]
				var to = points[i + 1]
				super.draw_line(from, to, primitive.color, primitive.line_width)
