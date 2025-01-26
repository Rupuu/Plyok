extends CharacterBody2D

class_name BubbleEnemy

const SPEED = 100
var comboAddition

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animation_player = $AnimatedSprite2D
@onready var collision_player = $CollisionShape2D

func _ready():
	Global.enemy_count += 1
	# Set random velocity for the bubble
	velocity = Vector2(choose([-20, 20, -40, 40]), choose([-20, 20, -40, 40])).normalized() * SPEED
	
	# Rotate the bubble randomly
	animation_player.rotate(choose([-0.3, -0.3, 0, 0.3, 0.4]))
	
	# Set random size for the bubble
	var random_scale = choose([0.75, 1.0, 1.25])  # Choose a random scale factor
	scale = Vector2(random_scale, random_scale)  # Apply uniform scaling

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		# Change direction based on collision
		velocity = velocity.bounce(collision.get_normal())
		if ray_cast_right.is_colliding():
			animation_player.flip_h = true
		if ray_cast_left.is_colliding():
			animation_player.flip_h = false

# Handle input events (e.g., mouse clicks)
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if(event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT):
		if(event.pressed):
			Global.combo += 1
			gain_health()
			trigger_death()
			
		elif(Global.timeElapsedSinceClick<=0):
			Global.combo = 0
			Global.health -= Global.HEALTH_MISS_PENALTY

func gain_health():
	Global.health += Global.HEALTH_HIT_REWARD
	if(Global.health>110):
		Global.health = 110

func trigger_death():
	trigger_death_animation()
	comboAddition = 25*Global.combo
	Global.score += 50+comboAddition

	Global.timeElapsedSinceClick = 1
	Global.enemy_count-=1

	Global.enemy_count -= 1


	print(Global.combo)

# Play the death animation and queue the node for removal
func trigger_death_animation():
	animation_player.play("pop")
	# Wait for the animation to finish using a signal
	animation_player.animation_finished.connect(_on_death_animation_finished)

func _on_death_animation_finished():
	queue_free()  # Remove the bubble after the animation

func choose(array):
	array.shuffle()
	return array.front()
