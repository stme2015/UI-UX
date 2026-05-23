extends CharacterBody3D

@export var speed := 5.0

func _physics_process(delta):

	var input_dir = Vector3.ZERO

	input_dir.x = Input.get_axis("ui_left", "ui_right")
	input_dir.z = Input.get_axis("ui_up", "ui_down")

	input_dir = input_dir.normalized()

	var direction = input_dir * speed

	velocity.x = direction.x
	velocity.z = direction.z

	move_and_slide()
