extends CharacterBody2D

var wolfHealth = 100
var speed = 70
var movementVal = 1
var _timer = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var player = get_node("/root/Node2D/Player")
	velocity = position.direction_to(player.position) * speed
	move_and_slide()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	var action = Global.action
	if action == true:
		wolfHealth -= 10
		if wolfHealth <= 0:
			var game = preload("res://scenes/lost.tscn").instantiate()
			get_tree (). get_root (). add_child (game)
			hide ()
 
