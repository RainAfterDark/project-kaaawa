extends Node2D

@export var player: Player

@export var grass_tilemap: TileMapLayer
@export var tilled_tilemap: TileMapLayer
@export var crop_tilemap: TileMapLayer

@export var till_sfx: AudioStreamPlayer2D
@export var harvest_sfx: AudioStreamPlayer2D
@export var watering_sfx: AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("use_tool"):
		if Game.current_tool == Globals.Tool.TillHoe:
			till_on_player()
		elif Game.current_tool == Globals.Tool.WateringCan:
			water_on_player()
		elif Game.current_tool == Globals.Tool.HarvestSack:
			harvest_on_player()

func till_on_player() -> bool:
	if player.is_moving(): return false
	var cell_pos = grass_tilemap.local_to_map(player.position)
	var grass_cell = grass_tilemap.get_cell_source_id(cell_pos)
	var till_cell = tilled_tilemap.get_cell_source_id(cell_pos)
	if grass_cell != -1:
		var new_tile = Globals.Tile.COARSE_DIRT if till_cell == -1 else -1
		tilled_tilemap.set_cells_terrain_connect([cell_pos], 0, new_tile, true)
		player.state_machine.transition_to("Till")
		till_sfx.play()
		return true
	return false

func water_on_player() -> bool:
	if player.is_moving(): return false
	var cell_pos = grass_tilemap.local_to_map(player.position)
	var crop_cell = crop_tilemap.get_cell_source_id(cell_pos)
	if crop_cell != -1:
		player.state_machine.transition_to("Water")
		watering_sfx.play()
		return true
	return false
	
func harvest_on_player() -> bool:
	if player.is_moving(): return false
	var cell_pos = grass_tilemap.local_to_map(player.position)
	var crop_cell = crop_tilemap.get_cell_source_id(cell_pos)
	if crop_cell != -1:
		crop_tilemap.erase_cell(cell_pos)
		player.state_machine.transition_to("Harvest")
		harvest_sfx.play()
		return true
	return false
