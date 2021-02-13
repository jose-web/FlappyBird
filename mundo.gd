extends Node2D

onready var Puntuacion = $Puntuacion
onready var GeneradorDeObstaculos = $GeneradorDeObstaculos

var puntuacion = 0 setget set_puntuacion

func _ready():
	GeneradorDeObstaculos.connect("obstaculoCreado",self,"cuandoObstaculoCreado")

func puntuacionJugador():
	self.puntuacion +=1

func set_puntuacion(nuevaPuntuacion):
	puntuacion = nuevaPuntuacion
	Puntuacion.actualizaPuntuacion(puntuacion)

func cuandoObstaculoCreado(obs):
	obs.connect("puntuacion",self,"puntuacionJugador")
