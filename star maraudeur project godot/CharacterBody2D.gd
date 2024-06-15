extends CharacterBody2D

@export var MAXSpeed = 300
@export var ACCELERATION = 1500
@export var FRICTION = 1200

var axis = Vector2.ZERO

func _physics_process(delta):
	move(delta)

func get_input_axis():
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()

func move(delta):
	axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		apply_friction(FRICTION * delta)
	else:
		apply_movement(axis * ACCELERATION * delta)
	
	move_and_slide()

func apply_friction(amount):
	var friction_direction = -velocity.normalized()
	var friction_force = friction_direction * min(amount, velocity.length())
	velocity += friction_force

func apply_movement(force):
	velocity += force
	velocity = velocity.normalized() * MAXSpeed





