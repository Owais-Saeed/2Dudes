extends KinematicBody2D

var velocity: Vector2 = Vector2(0, 0)
var speed: int = 500
var platform: bool = true
var moving_platform: bool = false
var falling_platform: int = 0
var platform_moving: bool = false
var falling: bool = false
var active: bool = false
var direction: int = 2

func _process(delta):
	direction()
	fall()
	if active == true:
		movementy()
		movementx()
	if falling == false:
		move_and_slide(velocity)
	if Input.is_action_just_pressed("ui_accept"):
		if active == true:
			active = false
			velocity = Vector2(0, 0)
		else:
			active = true

func movementx():
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		direction = 2
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		direction = 4
	elif platform_moving == false:
		velocity.x = 0

func movementy():
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		direction = 1
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
		direction = 3
	elif platform_moving == false:
		velocity.y = 0

func direction():
	if direction == 1:
		if Input.is_action_pressed("ui_up") and active == true:
			$Sprite.play("up")
		else:
			$Sprite.play("idleup")
	elif direction == 2:
		if Input.is_action_pressed("ui_right") and active == true:
			$Sprite.play("right")
		else:
			$Sprite.play("idleright")
	elif direction == 3:
		if Input.is_action_pressed("ui_down") and active == true:
			$Sprite.play("down")
		else:
			$Sprite.play("idledown")
	elif direction == 4:
		if Input.is_action_pressed("ui_left") and active == true:
			$Sprite.play("left")
		else:
			$Sprite.play("idleleft")

func platform(movement):
	if moving_platform == true:
		if not movement == Vector2(0, 0):
			platform_moving = true
			velocity = movement
		else:
			platform_moving = false
			velocity = Vector2(0, 0)
	else:
		platform_moving = false
		velocity = Vector2(0, 0)

func fall():
	if platform == false and moving_platform == false and falling_platform == 0:
		falling = true
		$AnimationPlayer.play("falling")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().reload_current_scene()
