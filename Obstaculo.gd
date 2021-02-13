extends Node2D

signal puntuacion

const VELOCIDAD = 200

func _physics_process(delta):
	position.x += -VELOCIDAD * delta
	if global_position.x <= -200:
		queue_free()



func _on_Tubo_body_entered(body):
	if body is Jugador:
		print("choca con el tubo")


func _on_AreaSumaPunto_body_entered(body):
	if body is Jugador:
		emit_signal("puntuacion")
