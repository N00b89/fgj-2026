extends Node2D

class_name GameManager

@export var maxHP: int = 3;
var PlayerHP: int = 0;

var gamePlaying = true;

func _ready():
	_startGame();

func _loseHp() -> bool:
	PlayerHP -= 1
	if(PlayerHP <= 0):
		_loseGame()
		return true
	return false
		
func _startGame():
	gamePlaying = true
	PlayerHP = maxHP
	
func _loseGame():
	gamePlaying = false
	
	await get_tree().create_timer(0.01).timeout
	get_tree().reload_current_scene()

	
	print("You Lost Game")
