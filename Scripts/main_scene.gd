extends CanvasLayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		get_tree().paused = !get_tree().paused
		$"Game Menu".visible = !$"Game Menu".visible
