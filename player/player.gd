extends CharacterBody2D

@export var speed: int = 35
@onready var animation = $AnimationPlayer

func handle_input():
	var moveDirection = Input.get_vector("ui_left", "ui_right",  "ui_up", "ui_down")
	velocity = moveDirection * speed
	
func update_animation():
	if velocity.length() == 0:
		animation.stop()
		return
		
	var direction = "Down"
	if velocity.x < 0: direction = "Left"
	elif velocity.x > 0: direction = "Right"
	elif velocity.y < 0: direction = "Up"
	
	animation.play("walk" + direction)
	
	
func _physics_process(_delta):
	handle_input()
	move_and_slide()
	update_animation()
