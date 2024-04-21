extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

signal key_obtained

func _on_body_entered(body):
	if body.name == "Clawdia":
		queue_free()
		key_obtained.emit()

 # Replace with function body.
