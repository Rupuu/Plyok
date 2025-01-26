extends Node2D

@onready var health_bar: AnimatedSprite2D = $HealthBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	health_bar.frame = round(Global.health/5)
	if(Global.game_over):
		queue_free()
