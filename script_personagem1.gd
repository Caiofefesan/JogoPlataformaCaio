extends CharacterBody2D

var velocidade = 600
var forca_pulo = 800
var gravidade = 50

func _process(delta: float) -> void:
	velocity.x = 0
	velocity.y += gravidade
	
	if(Input.is_action_pressed("ui_left")):
		velocity.x = -velocidade
		$Sprite2D.flip_h = true
	if(Input.is_action_pressed("ui_right")):
		velocity.x = velocidade
		$Sprite2D.flip_h = false
	if(Input.is_action_just_pressed("ui_up") and is_on_floor()):
		velocity.y = -forca_pulo
	if (is_on_floor()):
		if (velocity.x == 0):
			$AnimationPlayer.play("parado")
		else:
			$AnimationPlayer.play("correndo")
	else:
		$AnimationPlayer.play("pulando")
	
	move_and_slide()
