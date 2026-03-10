extends CharacterBody2D

var velocidade = 500
var forca_pulo = 900
var gravidade  = 40
var animando   = 0
var rasteira = 100

func _process(delta: float) -> void:
	velocity.x = 0
	velocity.y += gravidade
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -velocidade
		$Sprite2D.flip_h = true
		animando = 0
		
	if (Input.is_action_pressed("ui_right")):
		velocity.x = velocidade
		$Sprite2D.flip_h = false
		animando = 0
		
	if(Input.is_action_pressed("ui_down")):
		velocity.y += rasteira
		animando = 0
		
	if (Input.is_action_just_pressed("ui_up") and is_on_floor()):
		velocity.y = -forca_pulo
		animando = 0
		
	if (Input.is_action_just_pressed("disparar") and is_on_floor()):
		animando = 1
		$AnimationPlayer.play("atirando")
			
	if (Input.is_action_just_pressed("atacar")):
		animando = 2
		$AnimationPlayer.play("atacando")
	
	
	if (animando == 0):
		if (is_on_floor()):
			if (velocity.x == 0):
				$AnimationPlayer.play("parado")
			elif (velocity.y >= rasteira):
				$AnimationPlayer.play("deslizando")
			else:
				$AnimationPlayer.play("correndo")
		else:
			$AnimationPlayer.play("pulando")	
		
	move_and_slide()

		
func disparar_faca():
	var cena_faca   = preload("res://cena_faca.tscn")
	var objeto_faca = cena_faca.instantiate()
	add_child(objeto_faca)
	objeto_faca.global_position = $Marker2D.global_position
	animando = 0
