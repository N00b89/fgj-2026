extends CanvasLayer

func _on_back_pressed() -> void:
	self.visible = !self.visible
	get_parent().get_node("Buttons").visible = !get_parent().get_node("Buttons").visible
