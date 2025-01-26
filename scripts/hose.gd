extends Node2D

@onready var clean_animation: AnimatedSprite2D = $"../CleanAnimation"
@onready var hose_animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var hose_button: Button = $Button

func _physics_process(delta):
	hose_animation.frame=round((Global.bubbles_popped/3))
	if hose_animation.frame == 4:
		hose_button.disabled = false;
	else:
		hose_button.disabled = true;

func _on_button_pressed():
	clean_animation.play("default")
	get_tree().call_group("BubbleEnemy","trigger_death")
	Global.bubbles_popped = 0;
	
