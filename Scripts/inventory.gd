extends CanvasLayer

@export var hats : Resource
@export var tops : Resource
@export var bottoms : Resource
@export var shoes : Resource

var current_hat : int = 0
var current_top : int = 0
var current_bottom : int = 0
var current_shoes : int = 0


func _process(_delta: float) -> void:
	%Hat.texture = hats.items[current_hat]
	%Top.texture = tops.items[current_top]
	%Bottom.texture = bottoms.items[current_bottom]
	%Shoes.texture = shoes.items[current_shoes]


func _on_previous_hat_pressed() -> void:
	if current_hat - 1 < 0:
		current_hat = hats.items.size() - 1
	else:
		current_hat -= 1


func _on_next_hat_pressed() -> void:
	if current_hat + 1 > 2:
		current_hat = 0
	else:
		current_hat += 1


func _on_previous_top_pressed() -> void:
	pass # Replace with function body.


func _on_next_top_pressed() -> void:
	pass # Replace with function body.


func _on_previous_bottom_pressed() -> void:
	pass # Replace with function body.


func _on_next_bottom_pressed() -> void:
	pass # Replace with function body.


func _on_previous_shoes_pressed() -> void:
	pass # Replace with function body.


func _on_next_shoes_pressed() -> void:
	pass # Replace with function body.
