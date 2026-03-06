extends CharacterBody2D

@export var speed: int = 400
@export var gravity: int = 1200
@export var jump_speed: int = -400
@export var max_jumps: int = 2   # jumlah lompatan

var jump_count = 0


func get_input():
	velocity.x = 0

	# JUMP
	if Input.is_action_just_pressed("jump") and jump_count < max_jumps:
		velocity.y = jump_speed
		jump_count += 1

	if Input.is_action_pressed("right"):
		velocity.x += speed

	if Input.is_action_pressed("left"):
		velocity.x -= speed


func _physics_process(delta):

	# GRAVITY
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jump_count = 0   # reset jump saat menyentuh tanah

	get_input()
	move_and_slide()
	
	check_enemy_stomp()


func check_enemy_stomp():

	for i in get_slide_collision_count():

		var collision = get_slide_collision(i)
		var body = collision.get_collider()

		# cek apakah object punya fungsi die()
		if body.has_method("die"):

			# player jatuh dari atas
			if velocity.y > 0:
				body.die()
				velocity.y = -450

func _process(_delta):

	if not is_on_floor():
		$Animator.play("Jump")
	elif velocity.x != 0:
		$Animator.play("Walk")
	else:
		$Animator.play("Idle")

	if velocity.x != 0:
		if velocity.x > 0:
			$Sprite2D.flip_h = false
		else:
			$Sprite2D.flip_h = true
