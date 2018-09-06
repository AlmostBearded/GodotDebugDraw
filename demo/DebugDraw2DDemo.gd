extends Node

func _process(delta):
	var viewport_size = get_viewport().size
	
	DebugDraw2D.draw_circle(viewport_size/2, 25, 16, Color(1, 1, 1))
	DebugDraw2D.draw_circle(viewport_size/2, 10, 8, Color(1, 1, 1), true)
	
	DebugDraw2D.draw_cube(viewport_size/2 - Vector2(100, 0), 50, Color(1, 1, 1))
	DebugDraw2D.draw_cube(viewport_size/2 - Vector2(100, 0), 20, Color(1, 1, 1), true)
	
	DebugDraw2D.draw_circle_arc(viewport_size/2 + Vector2(100, 0), 25, 45, 135, true, 16, Color(1, 1, 1))
	DebugDraw2D.draw_circle_arc(viewport_size/2 + Vector2(110, 0), 10, 45, 135, true, 16, Color(1, 1, 1), true)