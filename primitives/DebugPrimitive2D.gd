var duration_left = 0
var filled = false
var color = Color(1, 0, 1)

func _init(color, filled, duration):
	self.color = color
	self.filled = filled
	self.duration_left = duration