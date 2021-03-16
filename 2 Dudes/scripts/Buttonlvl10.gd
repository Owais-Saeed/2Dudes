extends StaticBody2D

func _ready():
	$AnimatedSprite.play("unpressed")

func _on_Area2D_body_entered(body):
	if "Player2" in body.name:
		$AnimatedSprite.play("pressed")
		get_tree().call_group("Level", "pressed1")

func _on_Area2D_body_exited(body):
	if "Player2" in body.name:
		$AnimatedSprite.play("unpressed")
		get_tree().call_group("Level", "unpressed1")
