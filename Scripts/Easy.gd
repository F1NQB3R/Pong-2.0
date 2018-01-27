extends TextureButton

# class member variables go here, for example:
# var a = 2
signal setAnim
signal stopAnim
signal difficulty

func _ready():
	hide()
	get_tree().get_root().get_node("Nodee").find_node("TextureButtonz").connect("difficulty", self, "on_settings")

func on_settings():
	show()

func _on_TextureButtonz2_mouse_enter():
	emit_signal("setAnim")


func _on_TextureButtonz2_mouse_exit():
	emit_signal("stopAnim")


func _on_TextureButtonz1_mouse_enter():
	emit_signal("setAnim")


func _on_TextureButtonz1_mouse_exit():
	emit_signal("stopAnim")


func _on_TextureButtonz1_pressed():
	get_tree().change_scene("res://Main Game.tscn")


func _on_TextureButtonz2_pressed():
	get_tree().change_scene("res://Main Game.tscn")
