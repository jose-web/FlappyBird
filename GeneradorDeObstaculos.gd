extends Node2D

signal obstaculoCreado(obs)

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
	emit_signal("obstaculoCreado", obstaculo)
