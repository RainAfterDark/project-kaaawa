extends NodeState

@export var player: Player
@export var sprite: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	player.do_directional_action("idle")

func _on_next_transitions() -> void:
	if player.is_moving():
		transition.emit("Walk")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	pass
