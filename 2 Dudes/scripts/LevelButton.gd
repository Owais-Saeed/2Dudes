extends StaticBody2D

var p1: bool = false
var p2: bool = false

func _ready():
	$AnimatedSprite.play("unpressed")

func _process(delta):
	if p1 == true and p2 == true:
		$AnimatedSprite.play("pressed")
		get_tree().paused = true
		get_tree().call_group("Level", "fade")

func _on_Area2D_body_entered(body):
	if "Player1" in body.name:
		p1 = true
	if "Player2" in body.name:
		p2 = true

func _on_Area2D_body_exited(body):
	if "Player1" in body.name:
		p1 = false
	if "Player2" in body.name:
		p2 = false
