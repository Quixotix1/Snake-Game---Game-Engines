extends Node2D

@export var spawner: Spawner
@export var fruit: PackedScene
@export var parent: Node

func _ready() -> void:
	_spawn_fruit()
	EventBus.eat_fruit.connect(_spawn_fruit)

func _spawn_fruit() -> void:
	var new_fruit_position = Vector2i(randi_range(1, Grid.grid.x), randi_range(1, Grid.grid.y))
	Grid.fruit_position = new_fruit_position
	spawner.spawn_scene(Grid.get_grid_position_WS(new_fruit_position), 0, fruit)
