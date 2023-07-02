extends CanvasLayer
var lives = 0
var alive := true
var health = 100
var coins = 0
var powers = false
# Notifies `Main` node that the button has been pressed
signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	$LivesLabel.show()
	$CoinsLabel.show()
	$AudioStreamPlayer2D.play()
	start_game.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	$AudioStreamPlayer2D.play()
	$background.show()
	$LivesLabel.hide()
	$CoinsLabel.hide()
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Avoid the potholes!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	$AudioStreamPlayer2D.play()
	
func update_score(lives):
	$LivesLabel.text = "Lives " + str(lives)
	
func update_coins(coins):
	$CoinsLabel.text = "Coins: " + str(coins)
	
func _on_start_button_pressed():
	$AudioStreamPlayer2D.stop()
	$background.hide()
	$StartButton.hide()
	$LivesLabel.show()
	$CoinsLabel.show()
	start_game.emit()
	
func _on_message_timer_timeout():
	$Message.hide()
