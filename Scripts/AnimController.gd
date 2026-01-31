extends AnimationPlayer

class_name AnimationController
var camera : Camera2D;
func _ready():
	camera = get_viewport().get_camera_2d()

func _entrance():
	play("entrance")
func _exit():
	play("exit")
	
func _playStep():
	camera.apply_shake(1.5)
	SoundManager.play_random_sfx(["step","step2","step3"])
func _playSound(inp:String):
	SoundManager.play_sfx("flip")
