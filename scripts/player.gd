extends CharacterBody2D

var direction : Vector2 = Vector2()
var playerSpeed = 200
var health = 100


func read_input():
	velocity = Vector2()
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		direction = Vector2(0, -1)
	if Input.is_action_pressed("down"):
		velocity.y += 1
		direction = Vector2(0, 1)
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		direction = Vector2(-1, 0)
	if Input.is_action_pressed("right"):
		velocity.x += 1
		direction = Vector2(1, 0)
	if Input.is_action_pressed("action"):
		Global.action = true
	velocity = velocity.normalized()
	velocity = velocity * playerSpeed
	move_and_slide()
	

func _physics_process(delta):
	read_input()



func _on_area_2d_body_entered(body: Node2D) -> void:
	health -= 10
	print(health)
	if health <= 0:
		var game = preload("res://scenes/lost.tscn").instantiate()
		get_tree (). get_root (). add_child (game)
		hide ()
