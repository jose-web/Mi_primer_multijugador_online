extends KinematicBody

const SPEED = 5
var direction = Vector3()

func _ready():
	pass 

remote func _set_position(pos):
	global_transform.origin = pos

func _physics_process(delta):
	direction = Vector3()
	
	if Input.is_action_pressed("ui_left"):
		direction -= transform.basis.x
	elif Input.is_action_pressed("ui_right"):
		direction += transform.basis.x
	direction = direction.normalized()
	
	if direction != Vector3():
		if is_network_master():
			move_and_slide(direction * SPEED, Vector3.UP)
		rpc_unreliable("_set_position", global_transform.origin)
