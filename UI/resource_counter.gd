extends Node

@onready var plus = $PlusButton
@onready var minus = $MinusButton
@onready var counter = $CounterTextContainer/CounterText
@onready var title = $TitleTextContainer/TitleText

@onready var value = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	update_counter_text()


func update_counter_text():
	counter.text = str(value)

func update_title(name):
	title.text = name


func _on_plus_button_pressed():
	value += 1
	update_counter_text()


func _on_minus_button_pressed():
	if value > 0:
		value -= 1
	update_counter_text()
