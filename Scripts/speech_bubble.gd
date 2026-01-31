extends TextEdit

var colors : Array = ["red", "blue", "black", "yellow"]
var styles : Array = ["old", "modern", "elegant", "funny"]
var hello : Array = ["Bonjour Monsieur! ", "Hi. ", "Hello. "]
var first_middle : Array = ["I would like something ", "I like", "Give me something "]
var second_middle : Array = [" and something ", " and ", " and something"]
var end : Array = ["! Be quick!", ". Don't disappoint me.", ". Good luck!"]

func _ready() -> void:
	sentence_randomizer()

func sentence_randomizer() -> void:
	text =  (hello[randi_range(0, hello.size() - 1)] + 
			first_middle[randi_range(0, first_middle.size() - 1)] + 
			colors[randi_range(0, colors.size() - 1)] + 
			second_middle[randi_range(0, second_middle.size() - 1)] + 
			styles[randi_range(0, styles.size() - 1)] + 
			end[randi_range(0, end.size() - 1)])
