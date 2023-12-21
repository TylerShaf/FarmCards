extends Node

@onready var water_counter = $WaterCounter
@onready var fert_counter = $FertilizerCounter
@onready var gold_counter = $GoldCounter

# Called when the node enters the scene tree for the first time.
func _ready():
	water_counter.update_title("Water")
	fert_counter.update_title("Fertilizer")
	gold_counter.update_title("Gold")


func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			# Check if the mouse click is within the object's area
			if get_child(0).rect_position.x <= event.position.x < get_child(0).rect_end.x and get_child(0).rect_position.y <= event.position.y < get_child(0).rect_end.y:
				# Calculate the offset of the mouse click relative to the object's position
				drag_offset = event.position - get_child(0).rect_position
				is_dragging = true

		elif event.released and event.button_index == BUTTON_LEFT:
			is_dragging = false

	elif event is InputEventMouseMotion and is_dragging:
		# Update the object's position based on the mouse movement
		get_child(0).rect_position = event.position - drag_offset

	# Check if the object is dropped inside the container
	if is_dragging and event is InputEventMouseButton and event.released and event.button_index == BUTTON_LEFT:
		var container_rect = get_child(1).rect_global_position
		if container_rect.x <= event.position.x < container_rect.x + get_child(1).rect_size.x and container_rect.y <= event.position.y < container_rect.y + get_child(1).rect_size.y:
			print("Object dropped in the container!")
