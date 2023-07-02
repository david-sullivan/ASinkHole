extends Area2D

var taken = false
signal coin_taken

func start():
	#$AnimationPlayer.play("taken")
	pass

func _on_body_entered(body):
	print("coins taken")
	emit_signal("coin_taken")
	if not taken:
		$AnimationPlayer.play("taken")
