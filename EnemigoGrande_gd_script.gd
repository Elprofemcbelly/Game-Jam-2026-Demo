extends CharacterBody2D

@export var speed: float

var jugador

func _ready():
	jugador = get_tree().get_first_node_in_group("jugador")
	
func _physics_process(_delta):
	var direction = (jugador.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
