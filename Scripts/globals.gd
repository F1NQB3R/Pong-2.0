extends Node

var currentScene = null
var winner = null

func _ready():
	winner = "PLAYER_1"
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1)
	
func setScene(scene):
	currentScene.queue_free()
	var newScene = ResourceLoader.load(scene)
	currentScene = newScene.instance()
	get_tree().get_root().get_child(currentScene)
	
func getWinner():
	return winner

func setWinner(name):
	winner = name