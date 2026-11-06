extends Timer

func _ready() -> void:
	EventBus.hit_self.connect(_end_game)

func _on_timeout() -> void:
	EventBus.game_tick.emit()

func _end_game() -> void:
	autostart = false
	stop()
