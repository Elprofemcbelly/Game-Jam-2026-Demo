extends CharacterBody2D

var direction_x
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var id_jugador: int
#@onready var _animacion = $AnimationPlayer
var esperando: bool


func hands_up() -> void:
	$AnimatedSprite2D.play("hands_up")
	if esperando != true:
		esperando=true

func inicializar(id: int, spawn):
	self.id_jugador=id
	self.global_position=spawn

func fijarse_si_conexion():
	pass

func normalizar_anim_y_esperando():
	if not $AnimatedSprite2D.animation=="Idle":
		$AnimatedSprite2D.play("Idle")
	esperando=false

func aplicar_gravedad(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

func aplicar_controles_movimiento():
	if Input.is_action_pressed("jugador_1_manosarriba"):
		hands_up()
	match id_jugador:
		1:
			direction_x = Input.get_axis("jugador_1_izquierda", "jugador_1_derecha")
			if Input.is_action_just_pressed("jugador_1_salto") and is_on_floor():
				velocity.y = JUMP_VELOCITY
		2:
			direction_x = Input.get_axis("ui_left", "ui_right")
			if Input.is_action_just_pressed("jugador_2_salto") and is_on_floor():
				velocity.y = JUMP_VELOCITY

func _physics_process(delta: float) -> void:
	normalizar_anim_y_esperando()
	aplicar_gravedad(delta)
	aplicar_controles_movimiento()

	if direction_x: #movimiento
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
