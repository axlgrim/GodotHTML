extends Node
class_name HealthComponent

@export var max_health: int  = 100
@export var current_health: int

signal death()

func _ready() -> void:
	pass

# take damage and check if health is below 0
func take_damage(dmg: int) -> void:
	current_health -= dmg
	clampi(current_health, 0, max_health)

	check_is_dead()


# check if health is below 0 and emit signal 
func check_is_dead() -> void:
	if current_health == 0:
		death.emit()


static func create(health: int) -> HealthComponent:
	var health_component = HealthComponent.new()
	health_component.max_health = health
	health_component.current_health = health
	return health_component