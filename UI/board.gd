extends Control

@onready var water_counter = $WaterCounter
@onready var fert_counter = $FertilizerCounter
@onready var gold_counter = $GoldCounter
@onready var board_bg = $BoardBG
var selected_card = null


func _ready():
	board_bg.size = get_viewport().size
	water_counter.update_title("Water")
	fert_counter.update_title("Fertilizer")
	gold_counter.update_title("Gold")

# Whether or not an object is allowed to be dropped here
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

# What to do with dragged and dropped items
# Set the item's new position to where the drop happened
# Includes an offset to make drop match drag preview (mouse in center of object)
func _drop_data(at_position: Vector2, data: Variant) -> void:
	data.position = at_position - data.click_offset
