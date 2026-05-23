extends Node3D

@export var cube_count := 10

func _ready():
	randomize()

	for i in range(cube_count):
		create_cube()

func create_cube():

	var body = StaticBody3D.new()

	var mesh_instance = MeshInstance3D.new()
	var box_mesh = BoxMesh.new()
	mesh_instance.mesh = box_mesh
	
	var material = StandardMaterial3D.new()
	material.albedo_color = Color(0.7, 0.6, 1.0)
	mesh_instance.material_override = material

	var collision = CollisionShape3D.new()
	var shape = BoxShape3D.new()

	shape.size = Vector3(1, 1, 1)

	collision.shape = shape
	body.add_child(mesh_instance)
	body.add_child(collision)

	add_child(body)
	
	body.set_script(load("res://scripts/Rotate.gd"))

	body.position = Vector3(
		randf_range(-8, 8),
		0.5,
		randf_range(-8, 8)
	)
