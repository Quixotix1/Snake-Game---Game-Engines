extends Node

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

var init_position = Vector2i(4, 4)

@export var length: int
@export var body_object: PackedScene
var direction = Direction.RIGHT
var ate_fruit = false

var body: Array[Node2D]
var body_positions: Array[Vector2i]

func _ready() -> void:
	# draw sprite at position
	for i in range(length):
		_add_body_part(init_position)
	
	EventBus.game_tick.connect(_update_position)

func _update_position() -> void:
	if Input.is_action_pressed("up") and direction != Direction.DOWN:
		direction = Direction.UP
	if Input.is_action_pressed("down") and direction != Direction.UP:
		direction = Direction.DOWN
	if Input.is_action_pressed("left") and direction != Direction.RIGHT:
		direction = Direction.LEFT
	if Input.is_action_pressed("right") and direction != Direction.LEFT:
		direction = Direction.RIGHT
	
	var next_head_position = body_positions[0]
	if direction == Direction.UP:
		next_head_position.y = next_head_position.y - 1
	elif direction == Direction.DOWN:
		next_head_position.y = next_head_position.y + 1
	elif direction == Direction.LEFT:
		next_head_position.x = next_head_position.x - 1
	else:
		next_head_position.x = next_head_position.x + 1
	
	if Grid.get_is_out_of_bounds(next_head_position):
		EventBus.hit_self
	if body_positions.has(next_head_position):
		EventBus.hit_self
	
	if next_head_position == Grid.fruit_position:
		EventBus.eat_fruit
		_add_body_part(body_positions[length - 1])
		ate_fruit = true
	
	for i in length:
		var current_index = length - i - 1
		if current_index != 0:
			body_positions[current_index] = body_positions[current_index - 1]
		else:
			body_positions[current_index] = next_head_position
		body[current_index].position = Grid.get_grid_position_WS(body_positions[current_index])
	
	if ate_fruit:
		length += 1
		ate_fruit = false

func _add_body_part(new_position: Vector2i):
	var new_body_part = body_object.instantiate()
	new_body_part.position = Grid.get_grid_position_WS(new_position)
	body.append(new_body_part)
	body_positions.append(new_position)
	add_child(new_body_part)
	new_position.x -= 1
