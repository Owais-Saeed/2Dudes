extends StaticBody2D

func _on_Area2D_body_entered(body):
	if "Player2" in body.name:
		body.falling_platform = body.falling_platform + 1
		$AnimationPlayer.play("fall")
		yield(get_tree().create_timer(1),"timeout")
		$Area2D.set_deferred("disabled",true)
	elif "Player1" in body.name:
		body.falling_platform = body.falling_platform + 1
		$AnimationPlayer.play("fall")
		yield(get_tree().create_timer(1),"timeout")
		$Area2D.set_deferred("disabled",true)

func _on_Area2D_body_exited(body):
	if "Player1" in body.name or "Player2" in body.name:
		body.falling_platform = body.falling_platform - 1

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
