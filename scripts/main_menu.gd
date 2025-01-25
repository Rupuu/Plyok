extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_button_pressed() -> void:
	Global.goto_scene("res://scenes/level1.tscn")



func _process(delta: float) -> void:
	pass
