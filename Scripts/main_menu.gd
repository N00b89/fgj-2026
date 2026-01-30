extends CanvasLayer


func _on_start_pressed() -> void:
	pass # Replace with function body.

func _on_credits_pressed() -> void:
	$Buttons.visible = !$Buttons.visible
	$Credits.visible = !$Credits.visible

func _on_quit_pressed() -> void:
	get_tree().quit()
