extends Node2D

func _process(delta: float) -> void:
	
	Global.timeElapsedSinceClick = Global.timeElapsedSinceClick-delta
	#CALCULATES THE HEALTH LINEARLY AND EXPONENTIALLY
	Global.health -= Global.HEALTH_TIME_PENALTY * delta
	Global.HEALTH_TIME_PENALTY += delta*0.10
	Global.HEALTH_TIME_PENALTY += delta*0.10*1.025
	pass
