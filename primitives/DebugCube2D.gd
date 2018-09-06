extends "./DebugPrimitive2D.gd"

var center = Vector2(0, 0)
var size = 10

func _init(center, size, color, filled, duration).(color, filled, duration):
	self.center = center
	self.size = size

func get_points():
	var half_size = size / 2

	var points = PoolVector2Array()
	
	if filled:
		points.push_back(center)
	
	points.push_back(center + Vector2(-half_size, half_size));
	points.push_back(center + Vector2(half_size, half_size));
	points.push_back(center + Vector2(half_size, -half_size));
	points.push_back(center + Vector2(-half_size, -half_size));
	points.push_back(center + Vector2(-half_size, half_size));
	
	return points