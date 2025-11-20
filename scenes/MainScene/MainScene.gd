extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

@onready var camera: Camera2D = $Character2D/Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	camera.make_current()
