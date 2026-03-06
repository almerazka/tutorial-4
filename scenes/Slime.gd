extends CharacterBody2D

@export var speed = 60
@export var gravity = 1000

var direction = -1
var is_dead = false


func _physics_process(delta):

	if is_dead:
		return

	velocity.x = direction * speed
	velocity.y += gravity * delta

	move_and_slide()

	check_player_stomp()

	# nabrak tembok
	if is_on_wall():
		turn()

	# ujung platform
	if not $RayCast2D.is_colliding():
		turn()

	update_flip()

func turn():
	direction *= -1
	$RayCast2D.position.x *= -1

func update_flip():
	$AnimatedSprite2D.flip_h = direction > 0

func check_player_stomp():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var body = collision.get_collider()
		if body.name == "Player":
			# player jatuh dari atas
			if body.velocity.y > 0:
				die()
				body.velocity.y = -300
			else:
				print("player kena slime")

func die():
	is_dead = true
	velocity = Vector2.ZERO
	$AnimatedSprite2D.play("Dead")
	await $AnimatedSprite2D.animation_finished
	queue_free()
