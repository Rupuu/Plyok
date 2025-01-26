extends Node2D

@onready var area_2d: Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	Global.timeElapsedSinceClick = Global.timeElapsedSinceClick-delta
	#CALCULATES THE HEALTH LINEARLY AND EXPONENTIALLY
	Global.health -= Global.HEALTH_TIME_PENALTY * delta
	Global.HEALTH_TIME_PENALTY += delta*0.01
	Global.HEALTH_TIME_PENALTY += delta*0.01*1.0025
	
	var mouse_position = get_global_mouse_position()
	area_2d.position = mouse_position
	
	if(Global.game_over):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		queue_free()
	pass
