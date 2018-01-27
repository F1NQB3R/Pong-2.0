extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
var x = 80
var y = -50

func _ready():
	set_process(true)
	
func _process(delta):
	if (Input.is_key_pressed(KEY_W)):
		move(Vector2(0,-525*delta))
	if (Input.is_key_pressed(KEY_S)):
		move(Vector2(0,525*delta))
	