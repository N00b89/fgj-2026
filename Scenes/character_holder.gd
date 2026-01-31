extends Node

@export var character_sprite: Sprite2D
@export var initData: NPCData

@export var npc_list: Array[NPCData] = []
var npcIndex = 0
@export var anim_player: AnimationController

class CharacterData:
	@export var faceCloth: int = 0
	@export var bodyCloth: int = 0
	@export var lowerbodyCloth : int = 0
	@export var shoeCloth : int = 0
	@export var npcData : NPCData;
	func loadNPCData(data:NPCData):
		npcData = data

var currentCharacterData : CharacterData

func _ready():
	_createCharacter(initData);

func _process(delta: float):
	if Input.is_action_just_pressed("Skip"):
		_completeDress()
			
		
func _completeDress():
	anim_player._exit()
	await get_tree().create_timer(1.2).timeout
	if(_processCharacterControl()):
		print("Guy is chill")
	else:
		print("Guy just died")
		
	_createCharacter(npc_list[npcIndex])
	npcIndex+=1
	
func _processCharacterControl() -> bool:
	return true
	
func _createCharacter(_data : NPCData):
	currentCharacterData = CharacterData.new()
	currentCharacterData.loadNPCData(_data)
	anim_player._entrance()
	update_npc(_data)
	
func update_npc(_data : NPCData):
	if _data:
		character_sprite.texture = _data.sprite
		print("Loaded Data")
		
	
