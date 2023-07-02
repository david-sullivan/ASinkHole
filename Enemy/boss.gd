extends RigidBody2D

@export var speed = 100
var velocity = Vector2.ZERO
@export var animation = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	#$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
	$AnimatedSprite2D.play(mob_types[animation])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	

func _physics_process(delta):
	var direction = Vector2.LEFT

	# Your enemy's movement logic goes here
	# For example, you could make the enemy move horizontally
	direction.x = 1

	velocity = direction.normalized() * speed
	#velocity = move_and_slide(velocity)


func _on_body_entered(body):
	if body.name == "PlayerRB":
		$AudioStreamPlayer2D.play()
		print("collided")
		queue_free()

