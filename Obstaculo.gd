extends Node2D
const VELOCIDAD = 200

func _physics_process(delta):
	position.x += -VELOCIDAD * delta
	if global_position.x <= -200:
		global_position.x = 500
