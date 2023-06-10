extends Node2D

func _process(delta):
	var screen_center = get_viewport().size / 2.0

	DebugDraw2D.circle(screen_center, 25, 16, Color(1, 1, 1))
	DebugDraw2D.circle(screen_center, 18, 16, Color(1, 1, 1), 3)
	DebugDraw2D.circle_filled(screen_center, 10, 8, Color(1, 1, 1))

	DebugDraw2D.cube(screen_center - Vector2(100, 0), 50, Color(1, 1, 1))
	DebugDraw2D.cube_filled(screen_center - Vector2(100, 0), 20, Color(1, 1, 1))

	DebugDraw2D.rect(screen_center - Vector2(100, -100), Vector2(50, 25), Color(1, 1, 1))
	DebugDraw2D.rect_filled(screen_center - Vector2(100, -100), Vector2(20, 10), Color(1, 1, 1))

	DebugDraw2D.circle_arc(screen_center + Vector2(100, 0), 25, 45, 135, true, 16, Color(1, 1, 1))
	DebugDraw2D.circle_arc_filled(screen_center + Vector2(110, 0), 10, 45, 135, true, 16, Color(1, 1, 1))

	DebugDraw2D.line(screen_center + Vector2(-25, 90), screen_center + Vector2(25, 90), Color(1, 1, 1), 4)
	DebugDraw2D.line_vector(screen_center + Vector2(-25, 110), Vector2(50, 0), Color(1, 1, 1), 4)

	DebugDraw2D.arrow(screen_center + Vector2(75, 90), screen_center + Vector2(125, 90), Color(1, 1, 1), 1)
	DebugDraw2D.arrow_vector(screen_center + Vector2(125, 110), Vector2(-50, 0), Color(1, 1, 1), 5)
