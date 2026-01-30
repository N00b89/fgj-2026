extends CanvasLayer

func _on_resume_pressed() -> void:
	self.visible = !self.visible
	get_tree().paused = !get_tree().paused

func _on_quit_pressed() -> void:
	get_tree().quit()
