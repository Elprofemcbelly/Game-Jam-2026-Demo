extends Node2D
const JUGADOR = preload("res://jugador.tscn")
const EnemigoGrande = preload("res://enemigo.tscn")
var jugador1
var jugador2 
@onready var spawn_jugador_1: Node2D = $SpawnPlayer1
@onready var spawn_jugador_2: Node2D = $SpawnPlayer2
@onready var spawn_enemigo: Node2D = $"."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnear_jugador(1)
	spawnear_jugador(2)
	aparecer_enemigo()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
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
		2:
			jugador2 = instancia_jugador

func aparecer_enemigo() -> void:
	# 2. Creamos una copia/instancia real del enemigo en la memoria
	var nuevo_enemigo = EnemigoGrande.instantiate()
	
	# 3. Le decimos en qué coordenadas X e Y del mapa queremos que aparezca
	nuevo_enemigo.global_position = Vector2(400, 300) # Cambiá estos números por la posición que quieras
	
	# 4. Lo metemos dentro del Nivel 1 para que se empiece a ver y a mover
	add_child(nuevo_enemigo)
