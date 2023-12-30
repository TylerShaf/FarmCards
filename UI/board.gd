extends Control

@onready var water_counter = $WaterCounter
@onready var fert_counter = $FertilizerCounter
@onready var gold_counter = $GoldCounter
@onready var board_bg = $BoardBG
var selected_card = null

# Called when the node enters the scene tree for the first time.
func _ready():
	board_bg.size = get_viewport().size
	water_counter.update_title("Water")
	fert_counter.update_title("Fertilizer")
	gold_counter.update_title("Gold")


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	data.position = at_position - data.click_offset
