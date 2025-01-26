extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var map_sprite: Sprite2D = $Node/MapSprite
@onready var quit_sprite: Sprite2D = $Node/QuitSprite
@onready var game_won_menu: Sprite2D = $Node/GameWonMenu
@onready var score_sprite: Sprite2D = $Node/ScoreSprite

@onready var color_rect: ColorRect = $ColorRect
@onready var map_button: Button = $MapButton
@onready var quit_button: Button = $QuitButton
@onready var ranks: AnimatedSprite2D = $Node/Ranks/AnimatedSprite2D

var playOnce

const RANKTRESHOLD_A = 10000
const RANKTRESHOLD_B = 7000
const RANKTRESHOLD_C = 5000
const RANKTRESHOLD_F = 2000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playOnce=true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if(Global.game_over and playOnce):
		playOnce = false
		animated_sprite_2d.play()
		
	if(animated_sprite_2d.frame==4):
		map_sprite.visible=true
		quit_sprite.visible=true
		game_won_menu.visible=true
		score_sprite.visible=true
		ranks.visible=true
		color_rect.visible=true
		map_button.visible=true
		quit_button.visible=true
		
	if(Global.score>=RANKTRESHOLD_A):
		ranks.frame=0
	elif(Global.score>=RANKTRESHOLD_B):
		ranks.frame=1
	elif(Global.score>=RANKTRESHOLD_C):
		ranks.frame=2
	else:
		ranks.frame=3
	


func _on_quit_button_mouse_entered() -> void:
	quit_sprite.scale=Vector2(0.71,0.71)


func _on_quit_button_mouse_exited() -> void:
	quit_sprite.scale=Vector2(0.69,0.69)


func _on_map_button_mouse_entered() -> void:
	map_sprite.scale=Vector2(0.77,0.77)


func _on_map_button_mouse_exited() -> void:
	map_sprite.scale=Vector2(0.75,0.75)


func _on_map_button_pressed() -> void:
	Global.score = 0
	Global.combo = -1
	Global.enemy_count = 3;
	Global.timeElapsedSinceClick = 0.01
	Global.game_over = false
	Global.health = 95.00;
	Global.HEALTH_TIME_PENALTY = 1.5
	Global.goto_scene("res://scenes/main-menu.tscn")
	
	


func _on_quit_button_pressed() -> void:
	get_tree().quit()
