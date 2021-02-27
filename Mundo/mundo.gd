extends Node2D

onready var Puntuacion = $Puntuacion
onready var GeneradorDeObstaculos = $GeneradorDeObstaculos
onready var Suelo = $Suelo
onready var areaDeInformacion = $areaDeInformacion

const ARCHIVO_DATOS = "user://archivoDeDatos"

var puntuacion = 0 setget set_puntuacion
var mejorMarca = 0

func _ready():
	GeneradorDeObstaculos.connect("obstaculoCreado",self,"cuandoObstaculoCreado")
	cargarMejorPuntuacion()

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
	print("fin")
	GeneradorDeObstaculos.parar()
	Suelo.get_node("AnimationPlayer").stop()
	get_tree().call_group("obstaculos","set_physics_process",false)
	if puntuacion > mejorMarca:
		mejorMarca = puntuacion
		guardarMejorPuntuacion()
	areaDeInformacion.setPuntos(puntuacion, mejorMarca)

func _on_CanvasLayer_empezar():
	nuevoJuego()

func guardarMejorPuntuacion():
	var archivo = File.new()
	archivo.open(ARCHIVO_DATOS, File.WRITE)
	archivo.store_var(mejorMarca)
	archivo.close()

func cargarMejorPuntuacion():
	var archivo = File.new()
	if archivo.file_exists(ARCHIVO_DATOS):
		archivo.open(ARCHIVO_DATOS, File.READ)
		mejorMarca = archivo.get_var()
		archivo.close()
		
