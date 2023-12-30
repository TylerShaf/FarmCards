class_name Card
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
var click_offset = Vector2(card_width/2, card_height/2)

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

func _get_drag_data(at_position):
	#click_offset = at_position
	set_drag_preview(make_drag_preview(at_position))
	return self

func make_drag_preview(at_position: Vector2) -> Control:
	var t := TextureRect.new()
	var ct = CanvasTexture.new()
	t.texture = ct
	t.modulate.a = .5
	t.custom_minimum_size = Vector2(card_width, card_height)

	t.position = Vector2(-click_offset)

	var c := Control.new()
	c.add_child(t)

	return c
