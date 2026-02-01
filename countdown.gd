extends CanvasLayer

@onready var timer : Timer = $Timer
@onready var label : Label = $Label

func start_timer() -> void:
	timer.start()

func time_left_to_live():
	var time_left = timer.time_left
	var minutes = floor(time_left / 60)
	var seconds = int(time_left) % 60
	return [minutes, seconds]

func _process(_delta: float) -> void:
	label.text = "%02d:%02d" % time_left_to_live()
