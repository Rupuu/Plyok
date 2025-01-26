extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var factorySprite: Sprite2D = $Factory
@onready var factoryButton: Button = $ButtonFactory

@onready var soap: Sprite2D = $Soap
@onready var button_soap: Button = $ButtonSoap

@onready var shop: Sprite2D = $Shop
@onready var button_shop: Button = $ButtonShop
@onready var to_house_animation: AnimatedSprite2D = $ToHouseAnimation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	to_house_animation.visible=false
	animated_sprite_2d.play()
	factorySprite.visible = false
	soap.visible = false
	shop.visible = false
	
	button_soap.flat = true
	button_shop.flat = true
	factoryButton.flat = true
	pass # Replace with function body.

func _on_button_pressed() -> void:
	to_house_animation.visible = true

	to_house_animation.play()

func _on_button_2_pressed() -> void:
	pass
	
func _on_button_2_mouse_entered() -> void:
	factorySprite.visible = true

func _on_button_2_mouse_exited() -> void:
	factorySprite.visible=false


func _on_button_soap_pressed() -> void:
	Global.goto_scene("res://scenes/level1.tscn")


func _on_button_soap_mouse_entered() -> void:
	soap.visible = true

func _on_button_soap_mouse_exited() -> void:
	soap.visible = false

func _on_button_shop_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_button_shop_mouse_entered() -> void:
	shop.visible = true

func _on_button_shop_mouse_exited() -> void:
	shop.visible = false

func _on_button_shop_pressed() -> void:
	Global.goto_scene("res://scenes/shop.tscn")

#func _on_to_house_animation_animation_finished() -> void:
	#Global.goto_scene("res://scenes/level1.tscn")
