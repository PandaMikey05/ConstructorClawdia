extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var key = get_node("key")
	if key != null: #if there is a key in the level
		key.key_obtained.connect(self._update_door) #get ready to get key signal

func _process(delta):
	if Input.is_action_just_pressed("Throw"):
		throw()
		
var throwforce = 300 #force with which the box gets thrown
var boxes = Array() #holds the box object
var crate = preload("res://Scenes/crate.tscn") 

func throw():
	var facing = $Clawdia.FacingRight
	var modifier = 1
	if !facing:
		modifier = -1
	if boxes.size()>= 5: #change to use metadata later
		boxes[0].queue_free()
		for i in range (0, boxes.size()-1): 
			boxes[i]=boxes[i+1]
	if(boxes.size()< 5): #change to use metadata later
		boxes.append(crate.instantiate())
	else:
		boxes[boxes.size()-1]=crate.instantiate() 
	boxes[boxes.size()-1].position = $Clawdia.position+Vector2(modifier*100,-100)
	boxes[boxes.size()-1].apply_impulse(Vector2(modifier*throwforce, -throwforce*1.5))
	add_child(boxes[boxes.size()-1])
	for i in boxes.size():
		boxes[i].num = str(i+1)
	
#if body.name == "player":
		#get_tree().reload_current_scene()


func _on_lava_body_entered(body):
	if body==$Clawdia:
		get_tree().reload_current_scene()

var WinDoor = preload("res://Scenes/WinDoor.tscn")
var door
var LockedDoor = preload("res://Scenes/locked_door.tscn")
		
#function that "unlocks" the door
func _update_door(): 
	door = WinDoor.instantiate()
	door.position = $LockedDoor.position
	$LockedDoor.queue_free()
	add_child(door)
		
