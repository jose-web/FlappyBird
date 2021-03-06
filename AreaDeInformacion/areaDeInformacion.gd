extends CanvasLayer

signal empezar

onready var mensaje = $MensajeDeInicio/Instrucciones
onready var tween = $Tween
onready var puntosLabel = $MensajeFin/Puntos
onready var mejorMarcaLabel = $MensajeFin/MejorMarca
onready var mensajeFin = $MensajeFin

var juegoEmpezado = false

func _input(event):
	if event.is_action_pressed("ui_up") && !juegoEmpezado:
		emit_signal("empezar")
		tween.interpolate_property(mensaje, "modulate:a", 1, 0, 0.5)
		tween.start()
		juegoEmpezado = true

func setPuntos(nuevosPuntos, mejorMarca):
	puntosLabel.text = "PUNTOS: " + str(nuevosPuntos)
	mejorMarcaLabel.text = "MEJOR MARCA: " + str(mejorMarca)
	mensajeFin.visible = true

func _on_BotonReiniciar_pressed():
	get_tree().reload_current_scene()
