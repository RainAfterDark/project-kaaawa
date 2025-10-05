extends Node

@export var till_hoe: Button
@export var watering_can: Button
@export var harvest_sack: Button

func change_tool(tool: Globals.Tool) -> void:
	Game.current_tool = tool

func _on_ready() -> void:
	till_hoe.grab_focus()
	till_hoe.pressed.connect(change_tool.bind(Globals.Tool.TillHoe))
	watering_can.pressed.connect(change_tool.bind(Globals.Tool.WateringCan))
	harvest_sack.pressed.connect(change_tool.bind(Globals.Tool.HarvestSack))
