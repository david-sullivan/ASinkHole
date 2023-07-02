extends Node

var paused := false
var scene_holder := 0
var start = false
@export var scenes = [preload("res://level_1.tscn"), preload("res://level_2.tscn"), preload("res://level_2.tscn")]
#@export var scenes = [preload("res://startScreen.tscn"), preload("res://main.tscn"), preload("res://endScreen.tscn")]
@export var health = 100
@export var coins = 0
@export var lives = 4
@export var powers = false

signal sceneManagerSend
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#Open and close the Pause menu - the pause menu should have a higher z depth under sort
	"""if Input.is_action_just_pressed("pause") and paused == false:
		$TransitionPlayer.play("Pause Screen")
		paused = true
		get_tree().paused = true
	elif Input.is_action_just_pressed("pause") and paused == true:
		$TransitionPlayer.play("Pause Screen Close")
		paused = false
		get_tree().paused = false
		pass"""
	
	if Input.is_action_just_pressed("ui_accept"):
		#this used to flip scenes (if getting array 0)
		#_scene_change(scenes[0])
		#scenes.reverse()
		pass
		
		
	if start:
		#if scene is start go to main
		if scene_holder == 1:
			_scene_change(scenes[1])
		if scene_holder == 2:
			_scene_change(scenes[2])
		#reset the sart variable
		start = false
		print("start is false")
		

# scenes pass number into scene_holder, which is passed into here
func _scene_change(new_scene):
	#get_tree().paused = true
	#$TransitionPlayer.play("Scene Transition")
	get_child(0).queue_free()
	print(scenes[0])
	var temp_scene = new_scene.instantiate()
	add_child(temp_scene)
	move_child(temp_scene, 0)
	print(lives)
####################################################
	#these values are not being sent
	temp_scene.lives = lives
	temp_scene.health = health
	temp_scene.coins = coins
	temp_scene.powers = powers
###################################################
	print("in scene changer")



"""func _on_transition_player_animation_finished(anim_name):
	print(anim_name)
	if anim_name == "Scene Transition":
		print("scene transition animation finished")
		get_child(0).queue_free()
		add_child(scene_holder)
		move_child(scene_holder, 0)
		
	pass # Replace with function body.

func _scene_loaded():
	$TransitionPlayer.play("Scene Transition Close")
	get_tree().paused = false
	print("loaded")
"""
