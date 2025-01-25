extends Marker2D

@onready var enemy_scene = preload("res://scenes/bubble.tscn")

#will use to implement how much enemies and when to stop spawning them
#may be more appropriate in the level script
var starting_nodes: int
var current_nodes: int


func _on_timer_timeout():
	if get_child_count() < 9:
		print(get_child_count())
		var enemy = enemy_scene.instantiate()
		enemy.position = position
		add_child(enemy)
