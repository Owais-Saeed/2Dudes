extends KinematicBody2D

var movement: Vector2 = Vector2(0, 0)
var move_speed: int = 100
var moving1: bool = false
var test1: bool = false


var start = Vector2(194, 256)
var end = Vector2(319, 256)


func _ready():
	add_to_group("Level")

func _process(delta):
	if moving1 == true and not int(position.x) == end.x:
		movement.x = move_speed
	elif moving1 == false and not int(position.x) == start.x:
		movement.x = -move_speed
	else:
		movement.x = 0
	
	#Without this the player doesn't move with the platform (only works for the forst platform you step on)
	if test1 == true:
		get_tree().call_group("Player", "platform", movement)
	move_and_slide(movement)

func pressed1():
	moving1 = true

func unpressed1():
	moving1 =  false

func _on_Area2D_body_entered(body):
	if "Player2" in body.name:
		body.moving_platform = true
		test1 = true

func _on_Area2D_body_exited(body):
	if "Player2" in body.name:
		body.moving_platform = false
		test1 = false
		print_debug("test")
