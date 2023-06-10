extends Node

func _process(delta):
	var viewport_size = get_viewport().size

	DebugDraw2D.draw_circle(viewport_size/2, 25, 16, Color(1, 1, 1))
	DebugDraw2D.draw_circle(viewport_size/2, 18, 16, Color(1, 1, 1), 3)
	DebugDraw2D.draw_circle_filled(viewport_size/2, 10, 8, Color(1, 1, 1))

	DebugDraw2D.draw_cube(viewport_size/2 - Vector2(100, 0), 50, Color(1, 1, 1))
	DebugDraw2D.draw_cube_filled(viewport_size/2 - Vector2(100, 0), 20, Color(1, 1, 1))

	DebugDraw2D.draw_rect(viewport_size/2 - Vector2(100, -100), Vector2(50, 25), Color(1, 1, 1))
	DebugDraw2D.draw_rect_filled(viewport_size/2 - Vector2(100, -100), Vector2(20, 10), Color(1, 1, 1))

	DebugDraw2D.draw_circle_arc(viewport_size/2 + Vector2(100, 0), 25, 45, 135, true, 16, Color(1, 1, 1))
	DebugDraw2D.draw_circle_arc_filled(viewport_size/2 + Vector2(110, 0), 10, 45, 135, true, 16, Color(1, 1, 1))

	DebugDraw2D.draw_line(viewport_size/2 + Vector2(-25, 90), viewport_size/2 + Vector2(25, 90), Color(1, 1, 1), 4)
	DebugDraw2D.draw_line_vector(viewport_size/2 + Vector2(-25, 110), Vector2(50, 0), Color(1, 1, 1), 4)

	DebugDraw2D.draw_arrow(viewport_size/2 + Vector2(75, 90), viewport_size/2 + Vector2(125, 90), Color(1, 1, 1), 1)
	DebugDraw2D.draw_arrow_vector(viewport_size/2 + Vector2(125, 110), Vector2(-50, 0), Color(1, 1, 1), 5)
