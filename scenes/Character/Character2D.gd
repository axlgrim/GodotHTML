extends CharacterBody2D
class_name Character2D

@export var move: float = 0;
@export var move_speed: float = 250.0
@export var bullet_scene: PackedScene     
@export var health: int = 100

@export var fire_cooldown := 0.15         

@onready var char_sprite: Sprite2D = $CharSprite2D
@onready var gun_pivot: Node2D = $WeaponPivot

var roation_speed = 1.0

var health_component: HealthComponent

func _ready() -> void:
	health_component = HealthComponent.create(health)
	Globals.player = self


func _process(delta: float) -> void:
	_handle_shooting(delta)
	_handle_rotation(delta)


func _physics_process(delta: float) -> void:
	_handle_movement(delta)


# -----------------------------------------------------
# MOVEMENT
# -----------------------------------------------------
func _handle_movement(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * move_speed 
	move_and_slide()


# -----------------------------------------------------
# ROTATION TO MOUSE
# -----------------------------------------------------
func _handle_rotation(delta: float) -> void:
	# Rotating gun to the mouse position
	gun_pivot.look_at(get_global_mouse_position()) 

	# Rotating character spote
	char_sprite.rotation += roation_speed * delta



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
