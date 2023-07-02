extends Node2D
###############################################
#godot is not finding managernode but does from get_[arent() directly
@onready var managerNode = get_parent()
var lives = 1
var alive := true
var health = 0
var coins = 0
var powers = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print(managerNode)
	#managerNode = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func new_game():
	#score = 0
	$AudioStreamPlayer2D.play()
	lives = get_parent().lives
	coins = get_parent().coins
	#coins = managerNode.coins
	#print("manager node name: " + managerNode.name)
	#$Player.start($StartPosition.position)
	$PlayerRB.lives = lives
	
	$PlayerRB.start()
	#$StartTimer.start()
	$HUD.update_score(lives)
	$HUD.update_coins(coins)
	$HUD.show_message("Avoid the potholes!")
	
func game_over():
	$AudioStreamPlayer2D.stop()
	$HUD.show_game_over()


func _on_player_rb_lives_depleted():
	
	lives -= 1
	$HUD.update_score(lives)
	managerNode.lives = lives
	get_parent().lives = lives
	print("lives depleted = " + str(lives))
	

#need this to work for all coins
func _on_coin_2_coin_taken():

	coins += 1
	$HUD.update_coins(coins)
	managerNode.coins = coins
	get_parent().coins = coins
	print("coins taken = " + str(coins))


func _on_boss_area_2d_body_entered(body):
	
	#make the boss start moving and shooting when the player enters the area
	if body.name == "PlayerRB" && $CB2d_Boss:
		$CB2d_Boss.area_entered = true
		print("player entered boss area")
		$Boss_Area2D.queue_free()
