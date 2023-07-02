extends CharacterBody2D

@export var animation = 0
const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	#$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
	$AnimatedSprite2D.play(mob_types[animation])
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body):
	pass # Replace with function body.	if body.name == "PlayerRB":
	$AudioStreamPlayer2D.play()
	print("collided with the toad")
	queue_free()

func emit_smoke():
	$ParticleDeathExplosion.emitting = true
	$ParticleDeathExplosion/TimerExplosion.start()
	$ParticleDeathExplosion.reparent(get_parent())

func _on_timer_explosion_timeout():
	pass
