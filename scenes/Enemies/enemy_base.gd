extends CharacterBody2D
class_name Enemy2D

@export var speed = 50
@export var health: int = 100

@onready var enemy_sprite = $EnemySprite2D
@onready var enemy_collision_shape = $CollisionShape2D

var health_component: HealthComponent
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	health_component = HealthComponent.create(health)

func _physics_process(_delta: float) -> void:
	if Globals.player:
		direction = (Globals.player.global_position - position).normalized()
		check_player_position_and_flip()

	velocity = direction * speed
	move_and_slide()

	
func check_player_position_and_flip():
	if Globals.player.global_position.x < global_position.x:
		enemy_sprite.flip_h = true
		enemy_collision_shape.rotation = -enemy_collision_shape.rotation
	else:
		enemy_sprite.flip_h = false
		enemy_collision_shape.rotation = enemy_collision_shape.rotation