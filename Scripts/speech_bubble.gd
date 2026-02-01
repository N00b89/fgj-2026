extends Label

class_name SpeechBubble

var colors : Array = ["cool", "blue", "sport", "business"]
var styles : Array = ["shiny", "old", "hat", "funny"]
var hello : Array = ["Bonjour Monsieur! ", "Hello. ", "You! "]
var first_middle : Array = ["I would like something ", "Give me something ", "I like "]
var second_middle : Array = [" and something ", " and ", " and something "]
var end : Array = [".", ". Don't disappoint me.", " now."]
var selectedTags : Array[String]
func _ready() -> void:
	hide()
	

func _setRequest():
	visible = true
	sentence_randomizer()
	
func _hide():
	visible = false
func sentence_randomizer() -> void:
	var mood : int = randi_range(0, hello.size() - 1)
	selectedTags.clear()
	var t1 = colors[randi_range(0, colors.size() - 1)]
	var t2 = styles[randi_range(0, styles.size() - 1)]
	
	selectedTags.append(t1)
	selectedTags.append(t2)
	text =  (hello[mood] + 
			first_middle[mood] + 
			t1+ 
			second_middle[mood] + 
			t2 + 
			end[mood])
