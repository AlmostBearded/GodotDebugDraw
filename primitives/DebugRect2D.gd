extends "./DebugPrimitive2D.gd"

var center = Vector2(0, 0)
var size = Vector2(10, 10)

func _init(center, size, color, filled, line_width, duration):
	super(color, filled, line_width, duration)
	self.center = center
	self.size = size

func get_points():
	var half_x = size.x / 2
	var half_y = size.y / 2

	var points = PackedVector2Array()
	
	if filled:
		points.push_back(center)

	points.push_back(center + Vector2(-half_x, half_y));
	points.push_back(center + Vector2(half_x, half_y));
	points.push_back(center + Vector2(half_x, -half_y));
	points.push_back(center + Vector2(-half_x, -half_y));
	points.push_back(center + Vector2(-half_x, half_y));

	return points
