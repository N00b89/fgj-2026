extends Node

@export var sounds: Dictionary = {
	"step": {"stream": preload("res://sounds/fsfx-02.wav"), "volume": -8.0},
	"step2": {"stream": preload("res://sounds/fsfx-03.wav"), "volume": -5.0},
	"step3": {"stream": preload("res://sounds/fsfx-04.wav"), "volume": -8.0},
	"flip": {"stream": preload("res://sounds/fsfx-03.wav"), "volume": 12.0},
	"gunshot": {"stream": preload("res://sounds/gunshot.wav"), "volume": 0.0},
	"va2": {"stream": preload("res://sounds/flash_va-02.wav"), "volume": -10.0},
	"va3": {"stream": preload("res://sounds/flash_va-03.wav"), "volume": -10.0},
	"va1": {"stream": preload("res://sounds/flash_va-01.wav"), "volume": -10.0},
	"va4": {"stream": preload("res://sounds/flash_va-04.wav"), "volume": -10.0},
	"va5": {"stream": preload("res://sounds/flash_va-05.wav"), "volume": -10.0},
	"va6": {"stream": preload("res://sounds/flash_va-06.wav"), "volume": -10.0},
	"va7": {"stream": preload("res://sounds/flash_va-07.wav"), "volume": -10.0},
	"va8": {"stream": preload("res://sounds/flash_va-08.wav"), "volume": -10.0},
	"va9": {"stream": preload("res://sounds/flash_va-09.wav"), "volume": -10.0},
	"va10": {"stream": preload("res://sounds/flash_va-10.wav"), "volume": -10.0},
	"va11": {"stream": preload("res://sounds/flash_va-11.wav"), "volume": -10.0},
	"va12": {"stream": preload("res://sounds/flash_va-12.wav"), "volume": -10.0},
	"va13": {"stream": preload("res://sounds/flash_va-13.wav"), "volume": -10.0},
	"va14": {"stream": preload("res://sounds/flash_va-14.wav"), "volume": -10.0},
	"va15": {"stream": preload("res://sounds/flash_va-15.wav"), "volume": -10.0},
	"va16": {"stream": preload("res://sounds/flash_va-16.wav"), "volume": -10.0},
	"va17": {"stream": preload("res://sounds/flash_va-17.wav"), "volume": -10.0},
	"va18": {"stream": preload("res://sounds/flash_va-18.wav"), "volume": -10.0},
	"va19": {"stream": preload("res://sounds/flash_va-19.wav"), "volume": -10.0},
	"va20": {"stream": preload("res://sounds/flash_va-20.wav"), "volume": -10.0},
	"va21": {"stream": preload("res://sounds/flash_va-21.wav"), "volume": -10.0},
	"va22": {"stream": preload("res://sounds/flash_va-22.wav"), "volume": -10.0},


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
