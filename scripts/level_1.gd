extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.timeElapsedSinceClick = Global.timeElapsedSinceClick-delta
	Global.health -= Global.HEALTH_TIME_PENALTY * delta
	print(Global.health)
	pass
