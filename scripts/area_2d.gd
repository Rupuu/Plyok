extends Area2D

# Called when the node enters the scene tree for the first time.
var is_colliding = false

func _ready() -> void:
	#self.body_entered.connect(_on_body_entered)
	#self.body_exited.connect(_on_body_exited)
	pass
#
#
#func _on_body_entered(body):
	## Set the collision flag to true when a body enters
	#is_colliding = true
#
#func _on_body_exited(body):
	## Set the collision flag to false when the body exits
	#is_colliding = false
#
#func _input(event):
	## Check if the left mouse button is pressed and another body is colliding
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		#if event.pressed and is_colliding:
			#print("Left mouse button clicked, and another object is colliding!")
