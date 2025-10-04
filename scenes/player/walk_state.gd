extends NodeState

@export var player: Player
@export var sprite: AnimatedSprite2D
@export var speed: int = 50

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	player.do_directional_action("walk")
	player.velocity = player.direction  * speed
	player.move_and_slide()

func _on_next_transitions() -> void:
	if !player.is_moving():
		transition.emit("Idle")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	pass
