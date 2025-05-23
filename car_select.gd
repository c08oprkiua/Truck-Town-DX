extends Control

var town = null #Node3D
var instance_pos = null #Position3D

func _ready():
	get_node("mini_van").grab_focus()
	
	town = get_node("town_scene")
	instance_pos = town.get_node("instance_pos")
	
	town.get_node("back").connect("pressed", self, "_back")

func _back():
	var car_node = instance_pos.get_node("car")
	#you know, you'd think it would be cleaner to remove the child then free it, but actually,
	#when I did it like that, it subtly leaked memory! So it's done like this.
	car_node.queue_free()
	instance_pos.remove_child(car_node)
	
	show()
	town.hide()

func _load_scene(car):
	var tt = load(car).instance()
	tt.set_name("car")
	instance_pos.add_child(tt)
	
	hide()
	town.show()

func _on_van_1_pressed():
	_load_scene("res://car_base.xscn")

func _on_van_2_pressed():
	_load_scene("res://trailer_truck.xscn")

func _on_van_3_pressed():
	_load_scene("res://crane.xscn")
