extends AnimationPlayer

class_name AnimationController
var camera : Camera2D;
func _ready():
	camera = get_viewport().get_camera_2d()
var randomVA :Array[String] = [
		"va1","va2","va3","va8","va9","va10",
		"va12","va13","va14","va15","va16","va17","va18","va19","va20",
		"va21","va22"
	]
var leaveVA :Array[String] = [
		"va4","va5", "va6","va7","va8", "va11"
	]
func _entrance(): 
	play("entrance")
	await get_tree().create_timer(.6).timeout
	SoundManager.play_random_sfx(randomVA)
func _exit():
	play("exit")
	await get_tree().create_timer(.3).timeout
	SoundManager.play_random_sfx(leaveVA)
	
func _playStep():
	camera.apply_shake(1.5)
	SoundManager.play_random_sfx(["step","step2","step3"])
	
func _playSound(inp:String):
	SoundManager.play_sfx("flip")
