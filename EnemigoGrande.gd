extends CharacterBody2D

# 1. Precargamos la escena del enemigo usando su ruta en el proyecto
const ENEMIGO_SCENE = preload("res://enemigo.tscn")
@onready var target =  $"."
var direction_x
const SPEED = 300.0
const JUMP_VELOCITY = -550.0 #antes -400
var enemigo: int
var esperando: bool

func _physics_process(_delta: float) -> void:
	var direction = (target.position-position).normalized()
	velocity = direction * SPEED
	look_at(target.position)
	normalizar_anim_y_esperando()


func normalizar_anim_y_esperando():
	if not $AnimatedSprite2D.animation=="Idle":
		$AnimatedSprite2D.play("Idle")
	esperando=false
