extends Node2D

@onready var tape: Sprite2D = $Tape
@onready var toolbox: Sprite2D = $Toolbox
@onready var saw: Sprite2D = $Saw
@onready var water_gun: Sprite2D = $WaterGun
@onready var hose: Sprite2D = $Hose
@onready var box: Sprite2D = $Box
@onready var rocket: Sprite2D = $Rocket
@onready var back_to_map: Sprite2D = $BackToMap

@onready var button_back_to_map: Button = $ButtonBackToMap

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	tape.visible = false
	toolbox.visible = false
	saw.visible = false
	water_gun.visible = false
	hose.visible = false
	box.visible = false
	rocket.visible = false
	back_to_map.visible = false
	
	button_back_to_map.flat=true
	#button_shop.flat = true
	#factoryButton.flat = true
	#pass # Replace with function body.


func _on_button_tape_mouse_entered() -> void:
	tape.visible = true


func _on_button_tape_mouse_exited() -> void:
	tape.visible = false


func _on_button_toolbox_mouse_entered() -> void:
	toolbox.visible = true


func _on_button_toolbox_mouse_exited() -> void:
	toolbox.visible = false


func _on_button_hose_mouse_entered() -> void:
	hose.visible=true


func _on_button_hose_mouse_exited() -> void:
	hose.visible=false

func _on_button_saw_mouse_entered() -> void:
	saw.visible=true


func _on_button_saw_mouse_exited() -> void:
	saw.visible=false


func _on_button_water_gun_mouse_entered() -> void:
	water_gun.visible=true


func _on_button_water_gun_mouse_exited() -> void:
	water_gun.visible=false


func _on_button_rocket_mouse_entered() -> void:
	rocket.visible=true


func _on_button_rocket_mouse_exited() -> void:
	rocket.visible=false


func _on_button_box_mouse_entered() -> void:
	box.visible=true


func _on_button_box_mouse_exited() -> void:
	box.visible=false


func _on_button_back_to_map_mouse_entered() -> void:
	back_to_map.visible=true


func _on_button_back_to_map_mouse_exited() -> void:
	back_to_map.visible=false


func _on_button_back_to_map_pressed() -> void:
	Global.goto_scene("res://scenes/main-menu.tscn")
