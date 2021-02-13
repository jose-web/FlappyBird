extends Node2D

onready var timer = $Timer

var Obstaculo = preload("res://Obstaculo.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	generarObstaculo()

func generarObstaculo():
	var obstaculo = Obstaculo.instance()
	add_child(obstaculo)
	# numero aleatorio entre 150 y 549
	obstaculo.position.y = randi()%400 + 150
	
func empezar():
	timer.start()

func parar():
	timer.stop()
