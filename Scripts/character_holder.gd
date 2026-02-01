extends Node


enum ClothingType{
		face,
		body,
		lowerbody,
		shoes
	}
	
@export var character_sprite: Sprite2D
@export var initData: NPCData
@export var debugItem1: ItemData
@export var debugItem2: ItemData
@export var debugItem3: ItemData
@export var debugItem4: ItemData
@export var headParent: Sprite2D
@export var bodyParent: Sprite2D
@export var lowerParent: Sprite2D
@export var shoeParent: Sprite2D

@export var npc_list: Array[NPCData] = []
var npcIndex = 0
@export var anim_player: AnimationController

class CharacterData:
	@export var faceCloth: ItemData = null
	@export var bodyCloth: ItemData = null
	@export var lowerbodyCloth : ItemData = null
	@export var shoeCloth : ItemData = null
	@export var npcData : NPCData;
	
	
	func loadNPCData(data : NPCData):
		npcData = data
	
	func setClothing(type:ClothingType, data:ItemData):
		match type:
			ClothingType.face:
				faceCloth = data
			ClothingType.body:
				bodyCloth = data
			ClothingType.lowerbody:
				lowerbodyCloth = data
			ClothingType.shoes:
				shoeCloth = data 
			
		print("Set Clothing")


func _setClothing(type:ClothingType, item:ItemData):
	currentCharacterData.setClothing(type,item)
	_updateClothing()
	
func _updateClothing():
	headParent.texture = nullCheck(currentCharacterData.faceCloth)
	bodyParent.texture = nullCheck(currentCharacterData.bodyCloth)
	lowerParent.texture = nullCheck(currentCharacterData.lowerbodyCloth)
	shoeParent.texture = nullCheck(currentCharacterData.shoeCloth)
		
func nullCheck(inp:ItemData) -> Texture2D:
	if(inp == null):
		return null
	else:
		return inp.sprite
var currentCharacterData : CharacterData
var gameManager : GameManager

func _ready():
	gameManager = get_tree().current_scene as GameManager
	print("Start??")
	print("Start??")
	_createCharacter(initData);
	$Countdown.start_timer()
	print("Start2")

func _process(delta: float):
	if Input.is_action_just_pressed("Skip"):
		_completeDress()
	if Input.is_action_just_pressed("Debug1"):
		_setClothing(ClothingType.face,debugItem1)
	if Input.is_action_just_pressed("Debug2"):
		_setClothing(ClothingType.body,debugItem2)
	if Input.is_action_just_pressed("Debug3"):
		_setClothing(ClothingType.lowerbody,debugItem3)
	if Input.is_action_just_pressed("Debug4"):
		_setClothing(ClothingType.shoes,debugItem4)
		
func _completeDress():
	

	anim_player._exit()
	await get_tree().create_timer(1.2).timeout
	if(_processCharacterControl()):
		print("Guy is chill")
	else:
		gameManager._loseHp()
		print("Guy just died")
	_createCharacter(npc_list[npcIndex])
	npcIndex+=1
	
func _processCharacterControl() -> bool:
	var allTags:Array[String];
	checkAddItemToList(currentCharacterData.faceCloth, allTags)
	checkAddItemToList(currentCharacterData.bodyCloth, allTags)
	checkAddItemToList(currentCharacterData.lowerbodyCloth, allTags)
	checkAddItemToList(currentCharacterData.shoeCloth, allTags)
	
	var required_tags: Array[String] = currentCharacterData.npcData.requestedTags;
	
	for tag in required_tags:
		if not allTags.has(tag):
			return false
			
	return true
	
func checkAddItemToList(inp:ItemData, ou:Array[String]):
	if(inp == null):
		return
	for tag in inp.includedTags:
		if not ou.has(tag):
			ou.append(tag) 
	
	
func _createCharacter(_data : NPCData):
	currentCharacterData = CharacterData.new()
	currentCharacterData.loadNPCData(_data)
	_updateClothing()
	update_npc(_data)
	
func update_npc(_data : NPCData):
	if _data:
		character_sprite.texture = _data.sprite
		print("Loaded Data")
		anim_player._entrance()
