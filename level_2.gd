extends Control

var alive := true
var health = 100
var coins = 0
var powers = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$health.text = "Health: " + str(health)
	$coins.text = "Coins: " + str(coins)
	$powerup.text = "Powerup: " + str(powers)

	if health <= 0 && alive:
		$Player.queue_free()
		alive = false
