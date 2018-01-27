extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var down = false
var left = false
var up = false
var right = true
var x = self.get_global_pos().x
var y = self.get_global_pos().y
var xstar = null
var ystar = null
var xPar = null
var yPar = null
var heightPar = null
var widthPar = null

func _ready():
	self.hide()
	get_parent().connect("setAnim",self,"start_anime")
	get_parent().connect("stopAnim",self,"stop_anime")
	xPar = get_parent().get_global_pos().x
	yPar = get_parent().get_global_pos().y
	heightPar = get_parent().get_rect().size.height
	widthPar = get_parent().get_rect().size.width
	ystar = yPar + heightPar
	xstar = xPar
	
func start_anime():
	self.show()
	ystar = yPar + heightPar
	xstar = xPar + widthPar
	self.set_pos(Vector2(xstar,ystar))
	set_process(true)
	
func stop_anime():
	self.hide()
	set_process(false)
	self.set_pos(Vector2(xstar,ystar))
	
func _process(delta):
	x = self.get_global_pos().x
	y = self.get_global_pos().y
	#print (yPar)
	#print (y)
	var additional = 0
	if (y < yPar):
		additional = yPar - y
		y = yPar
		#y = -25
		up = false
		left = false
		down = false
		right = true
	elif (y > yPar + heightPar):
		additional = y - (yPar + heightPar)
		y = yPar + heightPar
		#y = 150
		right = false
		down = false
		up = false
		left = true
	elif (x < xPar):
		additional = xPar - x
		x = xPar
		#x = -25
		down = true
		left = false
		up = false
		right = false
	elif (x > xPar + widthPar):
		#additional = x - (xPar + widthPar)
		x = xPar + widthPar
		up = true
		right = false
		down = false
		left = false
	additional = 0
	if (down):
		self.set_global_pos(Vector2(x,y-(10+additional)))
	if (up):
		self.set_global_pos(Vector2(x,y + (10+additional)))
	if (left):
		self.set_global_pos(Vector2(x-(10+additional),y))
	if (right):
		self.set_global_pos(Vector2(x+(10+additional),y))