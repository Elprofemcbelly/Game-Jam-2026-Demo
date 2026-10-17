extends Node2D
const JUGADOR= preload("res://jugador.tscn")
var jugador1
var jugador2
@onready var Posicion_manos: Area2D = $Posicion_manos 
@onready var spawn_jugador_1: Node2D = $SpawnPlayer1
@onready var spawn_jugador_2: Node2D = $SpawnPlayer2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnear_jugador(1)
	spawnear_jugador(2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		
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
	match n_jugador:
		1:
			jugador1 = instancia_jugador
			jugador1.esperando_conexion.connect(_on_esperando_conexion)
		2:
			jugador2 = instancia_jugador

func _on_esperando_conexion(id):
	poder_subirse(id)

func poder_subirse(id):
	if jugador1.Posicion_Pies_Area2D.Colision_Pies:
		pass
