extends "./DebugPrimitive2D.gd"

var center = Vector2(0, 0)
var radius = 10
var angle_from = 0
var angle_to = 360
var resolution = 16

func _init(center, radius, angle_from, angle_to, resolution, color, filled, duration).(color, filled, duration):
	self.center = center
	self.radius = radius
	self.angle_from = angle_from
	self.angle_to = angle_to
	self.resolution = resolution

func get_points():
	var points = PoolVector2Array()

	if filled:
		points.push_back(center)

	for i in range(resolution+1):
		var angle_point = deg2rad(angle_from + i * (angle_to-angle_from) / resolution - 90)
		points.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	
	return points