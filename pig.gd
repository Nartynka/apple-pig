extends Area2D

export(int) var SPEED = 50

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

var moving = false

func _process(delta):
	moving = false
	if Input.is_action_pressed("ui_down"):
		move(0, SPEED, delta)
	if Input.is_action_pressed("ui_up"):
		move(0, -SPEED, delta)
	if Input.is_action_pressed("ui_left"):
		move(-SPEED, 0, delta)
		sprite.flip_h = true
	if Input.is_action_pressed("ui_right"):
		move(SPEED, 0, delta)
		sprite.flip_h = false
	if moving:
		animationPlayer.play("Run")
	else:
		animationPlayer.play("Idle")

func move(speed_x, speed_y, delta):
	position.y+=speed_y * delta
	position.x+=speed_x * delta
	moving = true

func _on_Area2D_area_entered(area):
	area.queue_free()
	scale *= 1.1
