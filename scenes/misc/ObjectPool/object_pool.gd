class_name ObjectPool
extends Node

var scene: PackedScene
var pool: Array[Node] = []

func _init(_scene: PackedScene, initial_size := 100):
	scene = _scene
	for i in range(initial_size):
		var inst = scene.instantiate()
		inst.visible = false
		inst.process_mode = Node.PROCESS_MODE_DISABLED
		pool.append(inst)
		add_child(inst)

func get_instance() -> Node:
	var inst: Node
	if pool.is_empty():
		inst = scene.instantiate()
		add_child(inst)
	else:
		inst = pool.pop_back()
		inst.process_mode = Node.PROCESS_MODE_PAUSABLE

	return inst

func release_instance(node: Node):
	node.visible = false
	node.process_mode = Node.PROCESS_MODE_DISABLED
	pool.append(node)