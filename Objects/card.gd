extends Control

@export var card_stats:Resource

const card_width = int(2.5 * 80)
const card_height = int(3.5 * 80)

@onready var bg = $CardBackground
@onready var card_name_box = $CardBackground/VBoxContainer/HBoxContainer/Name
@onready var water_box = $CardBackground/VBoxContainer/HBoxContainer/VBoxContainer/WaterRequirement
@onready var fert_box = $CardBackground/VBoxContainer/HBoxContainer/VBoxContainer/FertRequirement
@onready var value_box = $CardBackground/VBoxContainer/HBoxContainer2/Value
@onready var hover_shader = $HoverShader
var selected_test = false

signal card_selected
signal card_hovered

# Called when the node enters the scene tree for the first time.
func _ready():
	card_stats = load("res://Resources/Cards/Spikeapple.tres")
	bg.size = Vector2(card_width, card_height)
	card_name_box.text = card_stats.name
	water_box.text = str(card_stats.water_need)
	fert_box.text = str(card_stats.fert_need)
	value_box.text = str(card_stats.value)

# FOR TESTING ONLY
# Movement will be handled by Board
func _process(delta):
	if selected_test:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func _on_card_hitbox_input_event(viewportNode, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("left_click"):
		selected_test = true
		#print('clicked')
		emit_signal("card_selected", self)

func _on_card_hitbox_mouse_entered():
	#print('hovered')
	hover_shader.visible = true
	emit_signal("card_hovered")


func _on_card_hitbox_mouse_exited():
	hover_shader.visible = false
