extends Node

const SQUARE_SIZE = 64

var grid: Vector2i
var fruit_position: Vector2i

const TOP_LEFT = Vector2(100, 100)
const BOTTOM_RIGHT = Vector2(1800, 1000)

func _ready() -> void:
	grid.x = floor((BOTTOM_RIGHT.x - TOP_LEFT.x) / SQUARE_SIZE)
	grid.y = floor((BOTTOM_RIGHT.x - TOP_LEFT.x) / SQUARE_SIZE)

func get_grid_position_WS(position: Vector2i) -> Vector2:
	var solution = Vector2(100 + SQUARE_SIZE * position.x, 100 + SQUARE_SIZE * position.y)
	return solution

func get_is_out_of_bounds(position: Vector2i) -> bool:
	if position.x >= grid.x or position.y >= grid.y:
		return true
	if position.x < 0 or position.y < 0:
		return true
	else:
		return false
