extends Node2D
const JUGADOR= preload("res://jugador.tscn")
@onready var spawn_jugador_1: Node2D = $SpawnPlayer1
@onready var spawn_jugador_2: Node2D = $SpawnPlayer2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnear_jugador(1)
	spawnear_jugador(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if Input.is_action_pressed("jugador_1_derecha"):
	#	$Jugador_1.position.x += 1
	#if Input.is_action_pressed("jugador_1_izquierda"):
	#	$Jugador_1.position.x -= 1
	#if Input.is_action_pressed("jugador_1_arriba"):
	#	$Jugador_1.position.y -= 1
	#if Input.is_action_pressed("jugador_1_abajo"):
	#	$Jugador_1.position.y += 1
		
		
func spawnear_jugador(n_jugador: int):
	var spawn
	var instancia_jugador = JUGADOR.instantiate()
	match n_jugador:
		1:
			spawn=spawn_jugador_1.global_position
		2:
			spawn=spawn_jugador_2.global_position
	instancia_jugador.inicializar(n_jugador, spawn)
	
	add_child(instancia_jugador)
