extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_tree().get_root().get_node("Holder").find_node("RigidBody2D_2").connect("oneWin",self,"increment")

func increment():
	var x = int(self.get_text())
	x += 1
	self.set_text(String(x))