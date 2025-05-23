extends VehicleBody3D

const STEER_SPEED = 1.0 #float

const STEER_LIMIT = 0.4 #float

export var engine_force = 40.0 #float

var steer_angle = 0.0 #float
var steer_target = 0.0 #float

func _ready():
	#if you want your node to be processed during the physics frame, you need to enable this!
	set_fixed_process(true)

func _fixed_process(delta):
	#return to menu
	if Input.is_action_pressed("pause"):
		get_tree().get_root().get_node("base")._back()
	
	#acceleration/deceleration and braking
	if (Input.is_action_pressed("ui_up")):
		set_engine_force(engine_force)
		set_brake(-1.0)
	elif (Input.is_action_pressed("ui_down")):
		set_engine_force(-engine_force)
		set_brake(1.0)
	else:
		set_brake(0.0)
		set_engine_force(0.0)
	
	#steering
	if (Input.is_action_pressed("ui_left")):
		steer_target = -STEER_LIMIT
	elif (Input.is_action_pressed("ui_right")):
		steer_target = STEER_LIMIT
	else:
		steer_target = 0.0
	
	if (steer_target < steer_angle):
		steer_angle -= STEER_SPEED * delta
		if (steer_target > steer_angle):
			steer_angle = steer_target
	
	elif (steer_target > steer_angle):
		steer_angle += STEER_SPEED * delta
		if (steer_target < steer_angle):
			steer_angle = steer_target
	
	set_steering(steer_angle)