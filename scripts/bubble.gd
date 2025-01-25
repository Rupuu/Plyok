extends CharacterBody2D

class_name BubbleEnemy

const SPEED = 100

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animation_player = $AnimatedSprite2D

func _ready():
	velocity = Vector2(choose([-20,20,-40,40]),choose([-20,20,-40,40])).normalized() * SPEED

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		#!!!!😱!!!! add change in srpite direction here.
		velocity = velocity.bounce(collision.get_normal())
		if ray_cast_right.is_colliding():
			animation_player.flip_h = true
		if ray_cast_left.is_colliding():
			animation_player.flip_h = false

# Handle input events (e.g., mouse clicks)
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		trigger_death()

# Play the death animation and queue the node for removal
func trigger_death():
	animation_player.play("pop")
	await animation_player.animation_finished # Wait for the animation to finish
	queue_free() # Remove the bubble after the animation

func choose(array):
	array.shuffle()
	return array.front()
