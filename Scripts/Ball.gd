extends KinematicBody2D

# class member variables go here, for example:
onready var origin = get_node("/root/globals")
var velocity = 12
var angle = 0
var start = true
signal oneWin
signal twoWin

func _ready():
	set_process(true)
	
func _process(delta):
	if (start == true):
		get_node("Label 2").set_percent_visible(100.0)
		if (origin.getWinner() == "PLAYER_1"):
			angle = 180
		else:
			angle = 0
		self.set_pos(Vector2(-3020,-183))
		if (Input.is_key_pressed(KEY_SPACE)):
			get_node("Label 2").set_percent_visible(0.0)
			start = false
	else:
		if (is_colliding()):
			if (get_collider().get_name() == "BackWall"):
				origin.setWinner("PLAYER_2")
				start = true
				emit_signal("twoWin")
			if (get_collider().get_name() == "FrontWall"):
				origin.setWinner("PLAYER_1")
				emit_signal("oneWin")
				start = true
			if (get_collision_normal().x == -1):
				if (abs(angle%360) <= 180):
					angle += 180 - (angle*2)
				elif (abs(angle%360) > 180):
					angle -= 180 - ((360-angle)*2)
			if (get_collision_normal().x == 1): 
				if (abs(angle%360) <= 180):
					angle += 180 - (angle*2)
				elif (abs(angle%360) > 180):
					angle += (270- abs((angle%360)))*2
			if (get_collision_normal().y == -1):
				if (abs(angle%360) >= 90):
					angle += (180 - angle)*2
				elif (abs(angle%360) < 90):
					angle -= (angle*2)
			if (get_collision_normal().y == 1):
				if (abs(angle%360) >= 270):
					angle += (360 - angle%360)*2
				elif (abs(angle%360) < 270):
					angle += (360 - abs(angle%360))*2
			if (get_collider().get_name() == "Board 2 Body"):
				angle -= int(get_collision_pos().y - get_collider().get_global_pos().y - 40)
			elif (get_collider().get_name() == "Board 1 Body"):
				angle += int(get_collision_pos().y - get_collider().get_global_pos().y - 69)
			if (angle < 0):
				angle+= 360
			angle = angle%360
	self.move(Vector2(cos(deg2rad(angle))*velocity,sin(deg2rad(angle)) * velocity))