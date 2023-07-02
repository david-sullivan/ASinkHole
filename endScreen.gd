extends Control
@onready var managerNode = get_parent()
var alive := true
var health = 100
var coins = 0
var powers = false
var lives

# Called when the node enters the scene tree for the first time.
func _ready():
	#init variables
	managerNode.lives = 4
	managerNode.coins = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	managerNode.scene_holder = 1
	get_parent().start = true
	print("set start to true")
