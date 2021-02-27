extends CanvasLayer

onready var puntuacion_label = $Label

func actualizaPuntuacion(nuevaPuntuacion):
	puntuacion_label.text = str(nuevaPuntuacion)
