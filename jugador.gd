extends CharacterBody2D

var direction_x
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var id_jugador: int
#signal health_changed(new_health: int)
#signal spawn(new_health: int)

func _ready() -> void:
	pass


func inicializar(id: int, spawn):
	self.id_jugador=id
	self.global_position=spawn

func _physics_process(delta: float) -> void:
	# Gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	match id_jugador:
		1:
			direction_x = Input.get_axis("jugador_1_izquierda", "jugador_1_derecha")
			if Input.is_action_just_pressed("jugador_1_arriba") and is_on_floor():
				velocity.y = JUMP_VELOCITY
		2:
			direction_x = Input.get_axis("ui_left", "ui_right")
			if Input.is_action_just_pressed("jugador_2_saltar") and is_on_floor():
				velocity.y = JUMP_VELOCITY
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
 # Primero se ejecuta el movimiento
	
	# si hubo contacto:
	if is_on_floor():
		print("El CollisionShape está tocando el suelo")
		
	if is_on_wall():
		print("El CollisionShape está chocando contra una pared")
	
	move_and_slide()
