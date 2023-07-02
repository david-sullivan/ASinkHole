extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var area_entered = false
var direction = -1
var canLunge = true
@export var projectile := preload("res://Projectile/projectile.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if is_on_floor() and randi_range(0, 100) > 99:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	
	if direction && area_entered:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	#launch projectile
	if area_entered && randf_range(0, 100) > 97:
		var projectile_to_fire = projectile.instantiate()
		#top_level seperates instance from the scene that calls it (the boss)
		projectile_to_fire.top_level = true
		projectile_to_fire.transform = $Marker2D.global_transform
		#projectile_to_fire.position = $Marker2D.get_global_transform_with_canvas().origin
		add_child(projectile_to_fire)
		#how to control projectile with direction, can we pass direction as an argument
		
		
func emit_smoke():
	$ParticleDeathExplosion.emitting = true
	$ParticleDeathExplosion/TimerExplosion.start()
	$ParticleDeathExplosion.reparent(get_parent())
	

func _on_timer_explosion_timeout():
	pass


func _on_timer_lunge_timeout():
	canLunge = true
