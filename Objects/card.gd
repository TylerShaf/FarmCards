extends Control

@export var card_stats:Resource

const card_width = int(2.5 * 80)
const card_height = int(3.5 * 80)

@onready var bg = $CardBackground
@onready var card_name_box = $CardBackground/VBoxContainer/HBoxContainer/Name
@onready var water_box = $CardBackground/VBoxContainer/HBoxContainer/VBoxContainer/WaterRequirement
@onready var fert_box = $CardBackground/VBoxContainer/HBoxContainer/VBoxContainer/FertRequirement
@onready var value_box = $CardBackground/VBoxContainer/HBoxContainer2/Value


# Called when the node enters the scene tree for the first time.
func _ready():
	card_stats = load("res://Resources/Cards/Spikeapple.tres")
	bg.size = Vector2(card_width, card_height)
	card_name_box.text = card_stats.name
	water_box.text = str(card_stats.water_need)
	fert_box.text = str(card_stats.fert_need)
	value_box.text = str(card_stats.value)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
