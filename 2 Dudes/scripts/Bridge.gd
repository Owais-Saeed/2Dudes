extends KinematicBody2D

var movement: Vector2 = Vector2(0, 0)
var move_speed: int = 100
var moving: bool = false

var start = Vector2(194, 256)
var end = Vector2(704, 256)

func _ready():
	add_to_group("Level")

func _process(delta):
	if moving == true and not int(position.x) == end.x:
		movement.x = move_speed
	elif moving == false and not int(position.x) == start.x:
		movement.x = -move_speed
	else:
		movement.x = 0
	get_tree().call_group("Player", "platform", movement)
	move_and_slide(movement)

func pressed1():
	moving = true

func unpressed1():
	moving =  false

func _on_Area2D_body_entered(body):
	if "Player1" in body.name or "Player2" in body.name:
		body.moving_platform = true

func _on_Area2D_body_exited(body):
	if "Player1" in body.name or "Player2" in body.name:
		body.moving_platform = false
