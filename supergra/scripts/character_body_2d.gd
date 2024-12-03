extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var speed = 300.0
const TIME_PERIOD = 0.1
var isIdle = true
var time = 0

func _physics_process(delta: float) -> void:


	# zbiera input od przyciskow wsad i strzałek
	var direction_x := Input.get_axis("left", "right")
	var direction_y := Input.get_axis("up", "down")
	# sprawdza wciesniete przyciski i nadaje predkosc w danym kierunku
	# x-lewo/prawo, y-gora/dol
	# sprawdza shift i zmienia predkosc
	if Input.is_action_pressed("shift"):
		time += delta
		if time > TIME_PERIOD:
			speed += 25
			# Reset timer
			time = 0
	else:
		speed = 300.0
	
	if direction_x:
		velocity.x = direction_x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	if direction_y:
		velocity.y = direction_y * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()

	#handle animations
	#sprawdza czy postac jest w stanie spoczynku
	if direction_x == 0 && direction_y == 0:
		isIdle = true
		anim.play("idle")
	else:
		isIdle = false
		
	#sprawdza czy jest w spoczynku i czy porusza sie w osi Y
	if direction_y < 0 && !isIdle :
		anim.play("runningUp")
	else: if direction_y > 0:
		anim.play("runningDown")	
	#sprawdza czy jest w spoczynku i czy porusza sie w osi X i czy NIE porusza sie w Y
	if !direction_x == 0 && !isIdle && direction_y == 0:
		anim.play("runningX")
		if direction_x < 0:
			anim.flip_h = true
		else:
			anim.flip_h = false
			

	


	
