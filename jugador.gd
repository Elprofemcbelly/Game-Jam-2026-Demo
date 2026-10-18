extends CharacterBody2D

var direction_x
const SPEED = 300.0
const JUMP_VELOCITY = -800.0
var id_jugador: int
signal esperando_conexion(id_jugador)
#@onready var _animacion = $AnimationPlayer
var esperando: bool
var conectado_abajo: bool
var conectado_arriba: bool
var posicion_abajo
var jugador_abajo
var jugador_arriba



func hands_up() -> void:
	$AnimatedSprite2D.play("hands_up")
	if esperando != true:
		esperando=true

func inicializar(id: int, spawn):
	self.id_jugador=id
	self.global_position=spawn

func fijarse_si_conexion():
	#Si Posicion_pies de otra instancia de jugador de jugador esta cerca de posicion_manos Y esperando=true
	#Entonces conectado true
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
			#conectado_arriba=true
			#print(id_jugador, conectado_arriba)
		2:
			direction_x = Input.get_axis("ui_left", "ui_right")
			if Input.is_action_just_pressed("jugador_2_salto") and is_on_floor():
				velocity.y = JUMP_VELOCITY
			#print(id_jugador, conectado_arriba)

func _physics_process(delta: float) -> void:
	normalizar_anim_y_esperando()
	aplicar_gravedad(delta)
	if not conectado_arriba:
		aplicar_controles_movimiento()
	aplicar_controles_ataque()
	if conectado_arriba:
		velocity.x=0
		velocity.y=0
		position=jugador_abajo.get_node("Posicion_manos").global_position + Vector2(0,-10)
	
	fijarse_si_conexion()
	if direction_x: #movimiento
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Pies" and esperando==true:
		area.owner.conectado_arriba=true
		area.owner.jugador_abajo=self
		jugador_arriba=area.owner
		add_collision_exception_with(jugador_arriba)
		area.owner.posicion_abajo=position+Vector2(0, -200)
		print("Contacto")
		print(conectado_arriba)
		print(conectado_abajo)
		print(area.owner.conectado_arriba)
		
func ataque():
	if not $AnimatedSprite2D.animation=="ataque":
		$AnimatedSprite2D.play("ataque")
	$Colision_Ataque.set_deferred("disabled", false)
	await get_tree().create_timer(0.05).timeout
	$Colision_Ataque.set_deferred("disabled", true)
	
func aplicar_controles_ataque():
	if Input.is_action_just_pressed("jugador_1_ataque"):
				ataque()
