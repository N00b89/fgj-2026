extends Label

var colors : Array = ["red", "blue", "black", "yellow"]
var styles : Array = ["old", "modern", "elegant", "funny"]
var hello : Array = ["Bonjour Monsieur! ", "Hello. ", "Hi. "]
var first_middle : Array = ["I would like something ", "Give me something ", "I like "]
var second_middle : Array = [" and something ", " and ", " and something "]
var end : Array = [". Good luck!", ". Don't disappoint me.", ". Be quick!"]

func _ready() -> void:
	sentence_randomizer()

func sentence_randomizer() -> void:
	var mood : int = randi_range(0, hello.size() - 1)
	
	text =  (hello[mood] + 
			first_middle[mood] + 
			colors[randi_range(0, colors.size() - 1)] + 
			second_middle[mood] + 
			styles[randi_range(0, styles.size() - 1)] + 
			end[mood])
