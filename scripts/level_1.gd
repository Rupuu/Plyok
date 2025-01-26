extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta: float) -> void:
	
	Global.timeElapsedSinceClick = Global.timeElapsedSinceClick-delta
	#CALCULATES THE HEALTH LINEARLY AND EXPONENTIALLY
	Global.health -= Global.HEALTH_TIME_PENALTY * delta
	Global.HEALTH_TIME_PENALTY += delta*0.10
	Global.HEALTH_TIME_PENALTY += delta*0.10*1.025
	
	
	print(Global.HEALTH_TIME_PENALTY)
	pass
