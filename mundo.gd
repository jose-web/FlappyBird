extends Node2D

onready var Puntuacion = $Puntuacion
onready var GeneradorDeObstaculos = $GeneradorDeObstaculos
onready var Suelo = $Suelo
onready var areaDeInformacion = $areaDeInformacion

var puntuacion = 0 setget set_puntuacion

func _ready():
	GeneradorDeObstaculos.connect("obstaculoCreado",self,"cuandoObstaculoCreado")

func nuevoJuego():
	self.puntuacion = 0
	GeneradorDeObstaculos.empezar()

func puntuacionJugador():
	self.puntuacion +=1

func set_puntuacion(nuevaPuntuacion):
	puntuacion = nuevaPuntuacion
	Puntuacion.actualizaPuntuacion(puntuacion)

func cuandoObstaculoCreado(obs):
	obs.connect("puntuacion",self,"puntuacionJugador")

func _on_Suelo_body_entered(body):
	if body is Jugador:
		body.morir()

func _on_Jugador_morir():
	finalDelJuego()

func finalDelJuego():
	GeneradorDeObstaculos.parar()
	Suelo.get_node("AnimationPlayer").stop()
	get_tree().call_group("obstaculos","set_physics_process",false)
	areaDeInformacion.setPuntos(puntuacion)
	
func _on_CanvasLayer_empezar():
	nuevoJuego()
