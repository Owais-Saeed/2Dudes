extends Node2D

func _ready():
	get_tree().paused = false

func _process(delta):
	if Input.is_action_just_pressed("ui_restart"):
		get_tree().reload_current_scene()

func _on_WalkingArea_body_exited(body):
	if "Player1" in body.name or "Player2" in body.name:
		body.platform = false

func _on_WalkingArea_body_entered(body):
	if "Player1" in body.name or "Player2" in body.name:
		body.platform = true

func fade():
	$AnimationPlayer.play("fade")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().quit()
