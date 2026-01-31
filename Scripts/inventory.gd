extends CanvasLayer

@export var hats : Resource
@export var tops : Resource
@export var bottoms : Resource
@export var shoes : Resource

@export var hat_animation : AnimationPlayer
@export var top_animation : AnimationPlayer
@export var bottom_animation : AnimationPlayer
@export var shoes_animation : AnimationPlayer

var current_hat : int = 0
var current_top : int = 0
var current_bottom : int = 0
var current_shoes : int = 0

func _ready() -> void:
	%Hat.texture = hats.items[current_hat]
	%Top.texture = tops.items[current_top]
	%Bottom.texture = bottoms.items[current_bottom]
	%Shoes.texture = shoes.items[current_shoes]


func _on_previous_hat_pressed() -> void:
	if current_hat - 1 < 0:
		current_hat = hats.items.size() - 1
	else:
		current_hat -= 1

	hat_animation.play("fade_in_left")
	await hat_animation.animation_finished
	%Hat.texture = hats.items[current_hat]
	hat_animation.play("fade_out_left")

func _on_next_hat_pressed() -> void:
	if current_hat + 1 > hats.items.size() - 1:
		current_hat = 0
	else:
		current_hat += 1

	hat_animation.play("fade_in_right")
	await hat_animation.animation_finished
	%Hat.texture = hats.items[current_hat]
	hat_animation.play("fade_out_right")



func _on_previous_top_pressed() -> void:
	if current_top - 1 < 0:
		current_top = tops.items.size() - 1
	else:
		current_top -= 1

	top_animation.play("fade_in_left")
	await top_animation.animation_finished
	%Top.texture = tops.items[current_top]
	top_animation.play("fade_out_left")

func _on_next_top_pressed() -> void:
	if current_top - 1 > tops.items.size() - 1:
		current_top = tops.items.size() - 1
	else:
		current_top -= 1

	top_animation.play("fade_in_left")
	await top_animation.animation_finished
	%Top.texture = tops.items[current_top]
	top_animation.play("fade_out_left")



func _on_previous_bottom_pressed() -> void:
	if current_bottom - 1 < 0:
		current_bottom = bottoms.items.size() - 1
	else:
		current_bottom -= 1

	bottom_animation.play("fade_in_left")
	await bottom_animation.animation_finished
	%Bottom.texture = bottoms.items[current_bottom]
	bottom_animation.play("fade_out_left")

func _on_next_bottom_pressed() -> void:
	if current_bottom - 1 > bottoms.items.size() - 1:
		current_bottom = bottoms.items.size() - 1
	else:
		current_bottom -= 1

	bottom_animation.play("fade_in_left")
	await bottom_animation.animation_finished
	%Bottom.texture = bottoms.items[current_bottom]
	bottom_animation.play("fade_out_left")



func _on_previous_shoes_pressed() -> void:
	if current_shoes - 1 < 0:
		current_shoes = shoes.items.size() - 1
	else:
		current_shoes -= 1

	shoes_animation.play("fade_in_left")
	await shoes_animation.animation_finished
	%Shoes.texture = shoes.items[current_shoes]
	shoes_animation.play("fade_out_left")

func _on_next_shoes_pressed() -> void:
	if current_shoes - 1 > shoes.items.size() - 1:
		current_shoes = shoes.items.size() - 1
	else:
		current_shoes -= 1

	shoes_animation.play("fade_in_left")
	await shoes_animation.animation_finished
	%Shoes.texture = shoes.items[current_shoes]
	shoes_animation.play("fade_out_left")
