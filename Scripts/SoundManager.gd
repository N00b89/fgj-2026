extends Node

@export var sounds: Dictionary = {
	"step": {"stream": preload("res://sounds/fsfx-02.wav"), "volume": -15.0},
	"step2": {"stream": preload("res://sounds/fsfx-03.wav"), "volume": -12.0},
	"step3": {"stream": preload("res://sounds/fsfx-04.wav"), "volume": -15.0},
	"flip": {"stream": preload("res://sounds/fsfx-03.wav"), "volume": 15.0},
	"classical1": {"stream": preload("res://sounds/classical_flash.wav"), "volume": -7.0}
}
func _ready():
	play_sfx("classical1")
	
func play_sfx(sound_name: String):
	if sounds.has(sound_name):
		_create_and_play(sound_name)
	else:
		print("Hata: Ses bulunamadı -> ", sound_name)

func play_random_sfx(sound_names: Array[String]):
	if sound_names.is_empty(): return
	
	var random_name = sound_names.pick_random()
	if sounds.has(random_name):
		_create_and_play(random_name)
	else:
		print("Hata: Ses bulunamadı -> ", random_name)

func _create_and_play(sound_key: String):
	var data = sounds[sound_key]
	var asp = AudioStreamPlayer.new()
	
	asp.stream = data["stream"]
	asp.volume_db = data["volume"]
	
	asp.pitch_scale = randf_range(0.95, 1.05)
	
	add_child(asp)
	asp.play()
	
	await asp.finished
	asp.queue_free()
