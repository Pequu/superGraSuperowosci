extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:


	# zbiera input od przyciskow wsad i strzałek
	var direction_x := Input.get_axis("left", "right")
	var direction_y := Input.get_axis("up", "down")
	# sprawdza wciesniete przyciski i nadaje predkosc w danym kierunku
	# x-lewo/prawo, y-gora/dol
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
