extends TextureButton

# class member variables go here, for example:
# var a = 2
signal setAnim
signal stopAnim
signal difficulty

func _ready():
	connect("mouse_enter",self,"on_TextureButton_mouse_enter()")
	connect("pressed", self,"_on_TextureButtonz_pressed()")

func _on_TextureButton_mouse_enter():
	emit_signal("setAnim")


func _on_TextureButtonz_mouse_exit():
	emit_signal("stopAnim")


func _on_TextureButtonz_pressed():
	hide()
	emit_signal("difficulty")
	self.queue_free()