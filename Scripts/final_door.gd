extends Area2D



func _on_body_entered(body):
	if body.name == "Clawdia":
		get_parent().get_tree().change_scene_to_file("res://Scenes/Ending.tscn")
