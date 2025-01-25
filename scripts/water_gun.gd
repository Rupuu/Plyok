extends Node2D

const MAX_ROTATION = 20
const MAX_VERTICAL_DIST = 250
const MIN_VERTICAL_DIST = -200

const MAX_HORIZONTAL_DIST = 150
const MIN_HORIZONTAL_DIST = 50

var previous_mouse_position = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Get the global position of the mouse
	var mouse_position = get_global_mouse_position()
	var mouse_delta = mouse_position - previous_mouse_position

#RIGHT MOVEMENT
	if(mouse_position[0]>0):
		position.x = min(mouse_position[0],MAX_VERTICAL_DIST)
		if(mouse_position[0]>=MAX_VERTICAL_DIST):
			rotation += mouse_delta[0]*0.0025
		else:
			rotation = 0
#LEFT MOVEMENT
	else:
		position.x = max(mouse_position[0],MIN_VERTICAL_DIST)
		if(mouse_position[0]<=MIN_VERTICAL_DIST):
			rotation += mouse_delta[0]*0.0025
		else:
			rotation = 0
#HORIZONTAL MOVEMENT
	if(mouse_position[1]>MIN_HORIZONTAL_DIST):
		position.y = min(mouse_position[1],MAX_HORIZONTAL_DIST)
	
	previous_mouse_position = mouse_position
