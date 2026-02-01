extends CanvasLayer

@export var hats : Array[ItemData]
@export var tops : Array[ItemData]
@export var bottoms : Array[ItemData]
@export var shoes : Array[ItemData]

@export var hat_animation : AnimationPlayer
@export var top_animation : AnimationPlayer
@export var bottom_animation : AnimationPlayer
@export var shoes_animation : AnimationPlayer

var current_hat : int = 0
var current_top : int = 0
var current_bottom : int = 0
var current_shoes : int = 0

func _ready() -> void:
	%Hat.texture = hats[current_hat].sprite
	%Top.texture = tops[current_top].sprite
	%Bottom.texture = bottoms[current_bottom].sprite
	%Shoes.texture = shoes[current_shoes].sprite


# ---------------- HATS ----------------

func _on_previous_hat_pressed() -> void:
	current_hat = (current_hat - 1 + hats.size()) % hats.size()

	hat_animation.play("fade_in_left")
	await hat_animation.animation_finished
	%Hat.texture = hats[current_hat].sprite
	hat_animation.play("fade_out_left")

func _on_next_hat_pressed() -> void:
	current_hat = (current_hat + 1) % hats.size()

	hat_animation.play("fade_in_right")
	await hat_animation.animation_finished
	%Hat.texture = hats[current_hat].sprite
	hat_animation.play("fade_out_right")


# ---------------- TOPS ----------------

func _on_previous_top_pressed() -> void:
	current_top = (current_top - 1 + tops.size()) % tops.size()

	top_animation.play("fade_in_left")
	await top_animation.animation_finished
	%Top.texture = tops[current_top].sprite
	top_animation.play("fade_out_left")

func _on_next_top_pressed() -> void:
	current_top = (current_top + 1) % tops.size()

	top_animation.play("fade_in_right")
	await top_animation.animation_finished
	%Top.texture = tops[current_top].sprite
	top_animation.play("fade_out_right")


# ---------------- BOTTOMS ----------------

func _on_previous_bottom_pressed() -> void:
	current_bottom = (current_bottom - 1 + bottoms.size()) % bottoms.size()

	bottom_animation.play("fade_in_left")
	await bottom_animation.animation_finished
	%Bottom.texture = bottoms[current_bottom].sprite
	bottom_animation.play("fade_out_left")

func _on_next_bottom_pressed() -> void:
	current_bottom = (current_bottom + 1) % bottoms.size()

	bottom_animation.play("fade_in_right")
	await bottom_animation.animation_finished
	%Bottom.texture = bottoms[current_bottom].sprite
	bottom_animation.play("fade_out_right")


# ---------------- SHOES ----------------

func _on_previous_shoes_pressed() -> void:
	current_shoes = (current_shoes - 1 + shoes.size()) % shoes.size()

	shoes_animation.play("fade_in_left")
	await shoes_animation.animation_finished
	%Shoes.texture = shoes[current_shoes].sprite
	shoes_animation.play("fade_out_left")

func _on_next_shoes_pressed() -> void:
	current_shoes = (current_shoes + 1) % shoes.size()

	shoes_animation.play("fade_in_right")
	await shoes_animation.animation_finished
	%Shoes.texture = shoes[current_shoes].sprite
	shoes_animation.play("fade_out_right")
