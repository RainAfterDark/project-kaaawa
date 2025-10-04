extends NodeState

@export var player: Player
@export var sprite: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void:
	if !sprite.is_playing():
		transition.emit("Idle")
		sprite.translate(Vector2(0, 2))

func _on_enter() -> void:
	sprite.translate(Vector2(0, -2))
	player.do_directional_action("till")

func _on_exit() -> void:
	pass
