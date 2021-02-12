extends Node2D
const VELOCIDAD = 200

func _physics_process(delta):
	position.x += -VELOCIDAD * delta
	if global_position.x <= -200:
		global_position.x = 500



func _on_Tubo_body_entered(body):
	if body is Jugador:
		print("choca con el tubo")


func _on_AreaSumaPunto_body_entered(body):
	if body is Jugador:
		print("Suma puntos")
