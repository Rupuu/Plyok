extends Marker2D

@onready var enemy_scene = preload("res://scenes/exploding_bubble.tscn")

#will use to implement how much enemies and when to stop spawning them
#may be more appropriate in the level script
var starting_nodes: int
var current_nodes: int


func _on_timer_timeout():

	if Global.enemy_count < 12:
		var enemy = enemy_scene.instantiate()
		enemy.position = position
		get_parent().add_child(enemy)
