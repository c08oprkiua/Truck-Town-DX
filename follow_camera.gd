extends Camera3D

const UP = Vector3(0,1,0)

export var min_distance = 0.5
export var max_distance = 4.0
export var angle_v_adjust = 0.0
export var autoturn_ray_aperture = 25
export var autoturn_speed = 50

var collision_exception = [] #Array[RID]
var max_height = 2.0
var min_height = 0

func _ready():
	#find collision exceptions for ray
	var node = self
	while(node):
		if (node extends RigidBody3D):
			collision_exception.append(node.get_rid())
			break
		else:
			node=node.get_parent()
	
	# Initalization here
	set_fixed_process(true)
	#this detaches the camera transform from the parent spatial node
	set_as_toplevel(true)

func _fixed_process(dt):
	var target  = get_parent().get_global_transform().origin
	var pos = get_global_transform().origin
	
	var delta = pos - target
	
	#regular delta follow
	
	#check ranges

	if (delta.length() < min_distance):
		delta = delta.normalized() * min_distance
	elif (delta.length() > max_distance):
		delta = delta.normalized() * max_distance
	
	#check upper and lower height
	delta.y = clamp(delta.y, min_height, max_height)
	
	pos = target + delta
	
	look_at_from_pos(pos, target, UP)
	
	#turn a little up or down
	var t = get_transform()
	t.basis = Basis(t.basis[0], deg2rad(angle_v_adjust)) * t.basis
	set_transform(t)
