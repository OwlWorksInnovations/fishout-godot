extends Node2D

const TRASHBAG = preload("uid://brls11dogmwlp")

func _ready() -> void:
	spawn_trashbags()

func _process(_delta: float) -> void:
	if get_tree().get_node_count_in_group("Trashbag") == 0:
		spawn_trashbags()

func spawn_trashbags() -> void:
	var start_x = 153
	var current_position = Vector2(start_x, 137)
	
	for y in range(2):
		current_position.x = start_x
		for i in range(8):
			var trashbag = TRASHBAG.instantiate()
			trashbag.position = current_position
			trashbag.add_to_group("Trashbag")
			
			add_child(trashbag)
			current_position.x += 114
		current_position.y += 114
