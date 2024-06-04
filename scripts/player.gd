extends CharacterBody2D

@export var speed : float = 200
@export var acceleration : float = 7

@onready var navigation_agent : NavigationAgent2D = $NavigationAgent

func _make_path(target):
	navigation_agent.target_position = target

func _physics_process(delta):
	var direction = to_local(navigation_agent.get_next_path_position()).normalized()
	velocity = velocity.lerp(direction * speed, acceleration * delta)
	move_and_slide()

func _input(event):
	if (event is InputEventMouseButton and 
		event.button_index == MOUSE_BUTTON_LEFT and 
		event.pressed):
		_make_path(event.position)
