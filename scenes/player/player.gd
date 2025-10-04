class_name Player
extends CharacterBody2D

@export var sprite: AnimatedSprite2D

var direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("move_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("move_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("move_down"):
		direction = Vector2.DOWN
	else:
		direction = Vector2.ZERO

func do_directional_action(action: String) -> void:
	if direction == Vector2.LEFT:
		sprite.flip_h = true
		sprite.play(action + "_left")
	elif direction == Vector2.RIGHT:
		sprite.flip_h = false
		sprite.play(action + "_right")
	elif direction == Vector2.UP:
		sprite.play(action + "_back")
	elif direction == Vector2.DOWN:
		sprite.play(action + "_front")
	else:
		sprite.play(action + "_front")
	pass
