extends Node

@onready var water_counter = $WaterCounter
@onready var fert_counter = $FertilizerCounter
@onready var gold_counter = $GoldCounter

var selected_card = null

# Called when the node enters the scene tree for the first time.
func _ready():
	water_counter.update_title("Water")
	fert_counter.update_title("Fertilizer")
	gold_counter.update_title("Gold")


func _input(event):
	pass
