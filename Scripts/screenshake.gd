extends Camera2D

@export var shake_fade: float = 5.0 # Sarsıntının ne kadar hızlı söneceği

var shake_strength: float = 0.0
var rng = RandomNumberGenerator.new()

func _process(delta):
	if shake_strength > 0:
		shake_strength = lerp(shake_strength, 0.0, shake_fade * delta)
		
		offset = _get_random_offset()
	else:
		offset = Vector2.ZERO

func apply_shake(strength: float):
	shake_strength = strength

func _get_random_offset() -> Vector2:
	return Vector2(
		rng.randf_range(-shake_strength, shake_strength),
		rng.randf_range(-shake_strength, shake_strength)
	)
