extends CharacterBody2D
class_name Enemy2D

@export var speed = 50
@export var health: int = 100

var health_component: HealthComponent
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	health_component = HealthComponent.create(health)

func _physics_process(_delta: float) -> void:
	if Globals.player:
		direction = (Globals.player.global_position - position).normalized()

	velocity = direction * speed
	move_and_slide()

	
