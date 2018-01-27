extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	connect("mouse_enter",self,"_on_TextureButton_mouse_enter()")


func _on_Buttonz_mouse_enter():
	print ("Enter")


func _on_TextureButton_mouse_enter():
	print ("EN")
