@tool
extends EditorPlugin


const DEBUG_DRAW_2D: StringName = "DebugDraw2D"


func _enter_tree() -> void:
	add_autoload_singleton(DEBUG_DRAW_2D, "res://addons/debugdraw2d/DebugDraw2D.gd")
	pass


func _exit_tree() -> void:
	remove_autoload_singleton(DEBUG_DRAW_2D)
	pass