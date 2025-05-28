var duration_left := 0.0
var filled = false
var color = Color(1, 0, 1)
var line_width := 1.0

func _init(color, filled, line_width, duration):
	self.color = color
	self.filled = filled
	self.line_width = line_width
	self.duration_left = duration

func get_points():
	return PackedVector2Array()