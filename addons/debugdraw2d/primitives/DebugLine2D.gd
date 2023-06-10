extends "./DebugPrimitive2D.gd"

var from = Vector2(0, 0)
var to = Vector2(10, 10)

func _init(from, to, color, line_width, duration):
	super(color, false, line_width, duration)
	self.from = from
	self.to = to

func get_points():
	var points = PackedVector2Array()
	
	points.push_back(from);
	points.push_back(to);

	return points
