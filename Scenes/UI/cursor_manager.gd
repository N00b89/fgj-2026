extends Node2D

@export var cursorSprite: Sprite2D

@export var cursors : Array[Texture2D]
@export var currentID: int = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	setCursor(0)
	
func setCursor(id:int):
	currentID = id
	cursorSprite.texture = cursors[currentID]
func _process(delta: float):
	cursorSprite.global_position = get_global_mouse_position()
	if Input.is_action_pressed("Mouse0"):
		setCursor(1)
	else:
		setCursor(0)
