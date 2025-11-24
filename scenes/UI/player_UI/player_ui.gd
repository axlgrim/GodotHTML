extends Control
class_name Player_UI

@onready var health_bar: ProgressBar = $MarginContainer/VBoxContainer/HealthBar
@onready var exp_bar: ProgressBar = $MarginContainer/VBoxContainer/ExpBar
#@onready var level_label: Label = $PlayerPanel/LevelPanel/LevelLabel



func _on_player_health_changed(health):
	health_bar.value = health

func _on_player_exp_changed(experience):
	exp_bar.value = experience

