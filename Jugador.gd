extends RigidBody2D
class_name Jugador

export var FLAP_FORCE = -200

const MAX_ROTATION_DEGREES = -30

onready var animator = $AnimationPlayer

var started = false

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_up"):
		if !started:
			start()
		flap()
	if rotation_degrees <= MAX_ROTATION_DEGREES:
		angular_velocity = 0
		rotation_degrees = MAX_ROTATION_DEGREES
	
	if linear_velocity.y > 0:
		angular_velocity = 3 if rotation_degrees <= 90 else 0

func start():
	if started: return
	started = true
	gravity_scale = 5
	animator.play("Alas")

func flap():
	linear_velocity.y = FLAP_FORCE
	angular_velocity = -8
