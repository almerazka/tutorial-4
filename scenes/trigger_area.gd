extends Area2D

@export var sceneName: String = "Level1"

func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		get_tree().change_scene_to_file("res://scenes/" + sceneName + ".tscn")
