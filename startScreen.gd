extends Control
@onready var managerNode = get_parent()
var alive := true
var health = 100
var coins = 0
var powers = false
var lives
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	#set the start var in scene manager to true
	managerNode.scene_holder = 1
	get_parent().start = true
	print("set start to true")
