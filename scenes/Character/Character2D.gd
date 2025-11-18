extends CharacterBody2D
class_name Character2D

@export var move: float = 0;
@export var move_speed: float = 250.0
@export var bullet_scene: PackedScene     
@export var fire_cooldown := 0.15         

@onready var PickUpArea = $PickupArea2D


func _ready() -> void:
    $PickupArea.body_entered.connect(_on_pickup_area_entered)


func _process(delta: float) -> void:
    _handle_shooting(delta)
    _handle_rotation()


func _physics_process(_delta: float) -> void:
    _handle_movement()


# -----------------------------------------------------
# MOVEMENT
# -----------------------------------------------------
func _handle_movement() -> void:
    pass


# -----------------------------------------------------
# ROTATION TO MOUSE
# -----------------------------------------------------
func _handle_rotation() -> void:
    look_at(get_global_mouse_position())


# -----------------------------------------------------
# SHOOTING
# -----------------------------------------------------
func _handle_shooting(delta: float) -> void:
    pass


func _shoot() -> void:
    pass


# -----------------------------------------------------
# PICKUP HANDLING
# -----------------------------------------------------
func _on_pickup_area_entered(body: Node) -> void:
    pass