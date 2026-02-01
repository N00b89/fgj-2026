extends Node2D

class_name GameManager

@export var maxHP: int = 3;
var PlayerHP: int = 0;

var gamePlaying = true;

func _ready():
	_startGame();

func _loseHp():
	PlayerHP -= 1
	if(PlayerHP <= 0):
		_loseGame()
		
func _startGame():
	gamePlaying = true
	PlayerHP = maxHP
	
func _loseGame():
	gamePlaying = false
	print("You Lost Game")
