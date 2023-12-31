extends Area2D

@export var speed = 200
var direction

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#need to have -/+ based on direction instead of only minus x
	position.x -= speed * delta
	#position += transform.x * speed * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.health -= 1
		#body.queue_free()
	queue_free()
