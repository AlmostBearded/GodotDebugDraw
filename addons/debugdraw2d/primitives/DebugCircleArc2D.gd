extends "./DebugPrimitive2D.gd"

var center = Vector2(0, 0)
var radius := 10.0
var angle_from := 0.0
var angle_to := 360.0
var pie = true
var resolution = 16

func _init(center, radius, angle_from, angle_to, pie, resolution, color, filled, line_width, duration):
	super(color, filled, line_width, duration)
	self.center = center
	self.radius = radius
	self.angle_from = angle_from
	self.angle_to = angle_to
	self.pie = pie
	self.resolution = resolution

func get_points():
	var points = PackedVector2Array()

	if filled || pie:
		points.push_back(center)

	for i in range(resolution+1):
		var angle_point = deg_to_rad(angle_from + i * (angle_to-angle_from) / resolution - 90)
		points.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	if pie:
		points.push_back(center)

	return points
