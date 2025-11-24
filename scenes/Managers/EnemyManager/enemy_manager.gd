extends Node
class_name EnemyManager

@export var enemy_scene_list: Array[String]

var enemy_pools: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemy_idx: int = 0
	for enemy_scene in enemy_scene_list:
		register_enemy_type(str(enemy_idx), load(enemy_scene), 100)
		enemy_idx += 1

	print(enemy_scene_list)
	print(enemy_pools)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_base_enemy_timer_timeout() -> void:
	pass # Replace with function body.

func register_enemy_type(id: String, scene: PackedScene, initial_size := 10):
	var pool = ObjectPool.new(scene, initial_size)
	enemy_pools[id] = pool
	add_child(pool)
