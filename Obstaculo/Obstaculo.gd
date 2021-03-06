extends Node2D

signal puntuacion

onready var punto = $point

const VELOCIDAD = 200

func _physics_process(delta):
	position.x += -VELOCIDAD * delta
	if global_position.x <= -200:
		queue_free()



func _on_Tubo_body_entered(body):
	if body is Jugador:
		body.morir()


func _on_AreaSumaPunto_body_entered(body):
	if body is Jugador:
		punto.play()
		emit_signal("puntuacion")
