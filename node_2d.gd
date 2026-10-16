extends Node2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("jugador_1_derecha"):
		$Jugador_1.position.x += 1
	if Input.is_action_pressed("jugador_1_izquierda"):
		$Jugador_1.position.x -= 1
	if Input.is_action_pressed("jugador_1_arriba"):
		$Jugador_1.position.y -= 1
	if Input.is_action_pressed("jugador_1_abajo"):
		$Jugador_1.position.y += 1
		
