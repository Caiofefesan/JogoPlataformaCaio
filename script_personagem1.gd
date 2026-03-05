extends CharacterBody2D

var velocidade = 600
var forca_pulo = 800
var rasteira = 100
var animation = false
var gravidade = 50

func _process(delta: float) -> void:
	velocity.x = 0
	velocity.y += gravidade
	
	if(Input.is_action_pressed("ui_left")):
		velocity.x = -velocidade
		$Sprite2D.flip_h = true
		$AnimationPlayer.play("correndo")
		if(Input.is_action_pressed("ui_up") and is_on_floor()):
			velocity.y = -forca_pulo
			$AnimationPlayer.play("pulando")
		elif(Input.is_action_pressed("ui_down")):
			velocity.y += rasteira
			$AnimationPlayer.play("deslizando")
		elif (Input.is_action_pressed("disparo")):
			animation = true
			$AnimationPlayer.play("atirando")
		elif (Input.is_action_pressed("atacar")):
			$AnimationPlayer.play("atirando")
			
	elif(Input.is_action_pressed("ui_right")):
		velocity.x = velocidade
		$Sprite2D.flip_h = false
		$AnimationPlayer.play("correndo")
		if(Input.is_action_pressed("ui_up") and is_on_floor()):
			velocity.y = -forca_pulo
			$AnimationPlayer.play("pulando")
		elif(Input.is_action_pressed("ui_down")):
			velocity.y += rasteira
			$AnimationPlayer.play("deslizando")
	elif(Input.is_action_just_pressed("ui_up") and is_on_floor()):
		velocity.y = -forca_pulo
	elif(Input.is_action_pressed("ui_down")):
		velocity.y += rasteira
		$AnimationPlayer.play("deslizando")
	elif (is_on_floor()):
		if (velocity.x == 0 ):
			$AnimationPlayer.play("parado")
	
	move_and_slide()

func disparo_faca():
	var cena_faca = preload("res://cena_faca.tscn")
	var objeto_faca = cena_faca.instantiate()
	add_child(objeto_faca)
	objeto_faca.gobal.possition
	
	
