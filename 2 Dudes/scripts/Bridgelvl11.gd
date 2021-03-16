extends KinematicBody2D

var movement: Vector2 = Vector2(0, 0)
var move_speed: int = 100
var moving1: bool = false
var test: bool = false


var start = Vector2(594, 256)
var end = Vector2(174, 256)


func _ready():
	add_to_group("Level")

func _process(delta):
	if moving1 == true and not int(position.x) == end.x:
		movement.x = -move_speed
	elif moving1 == false and not int(position.x) == start.x:
		movement.x = move_speed
	else:
		movement.x = 0
	
	if test == true:
		get_tree().call_group("Player", "platform", movement)
	move_and_slide(movement)

func pressed2():
	moving1 = true

func unpressed2():
	moving1 =  false

func _on_Area2D_body_entered(body):
	if "Player1" in body.name or "Player2" in body.name:
		body.moving_platform = true
		test = true

func _on_Area2D_body_exited(body):
	if "Player1" in body.name or "Player2" in body.name:
		body.moving_platform = false
		test = false
