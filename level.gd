extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("Throw"):
		throw()
		
var throwforce = 500 #force with which the box gets thrown
var boxes = Array() #holds the box object
var crate = preload("res://crate.tscn") 
func throw():
	if boxes.size()>= 5: #change to use metadata later
		boxes[0].queue_free()
		for i in range (0, boxes.size()-1): 
			boxes[i]=boxes[i+1]
	if(boxes.size()< 5): #change to use metadata later
		boxes.append(crate.instantiate())
	else:
		boxes[boxes.size()-1]=crate.instantiate() 
	boxes[boxes.size()-1].position = $Clawdia.position+Vector2(100,-100)
	#boxes[boxes[boxes.size()-1]].apply_impulse(Vector2(throwforce, -throwforce))
	add_child(boxes[boxes.size()-1])
	
