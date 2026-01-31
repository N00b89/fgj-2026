extends CanvasLayer


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		visible = !visible
		get_tree().paused = !get_tree().paused

func _on_resume_pressed() -> void:
	visible = !visible
	get_tree().paused = !get_tree().paused

func _on_quit_pressed() -> void:
	get_tree().quit()
