class_name CardStatBlock
extends Resource

enum Type {CROP, MONSTER, TOOL}

@export var name: String
@export var value: int
@export var water_need: int
@export var fert_need: int
@export var texture: Texture2D
