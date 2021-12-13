extends Node2D

var hit = false
var hitImmune = false
var heal = false
var transition = false
var hovered = false
var interact = false
var deathZoom = false
var respawn = false
var teleport = false
var teleport1 = false
func _ready():
	$CanvasLayer/Hit.visible = false
	$CanvasLayer/Heal.visible = false
	$CanvasLayer/CenterContainer/Label.visible = false
	$CanvasLayer/CenterContainer.visible = false
	$Label.visible = false

func _process(delta):
	if hit == true and hitImmune == false:
		hit = false
		hitImmune = true
		$PlayerHit.play("Hit")
		yield(get_tree().create_timer(.9),"timeout")
		hitImmune = false
	if heal == true:
		heal = false
		$PlayerHeal.play("Heal")
	if transition == true:
		transition = false
		$Transitions.play("Transition")
	if interact == true:
		$InteractText.play("Interact")
		$CanvasLayer/CenterContainer/Label.visible = true
	if interact == false:
		$InteractText.stop()
		$CanvasLayer/CenterContainer/Label.visible = false
		$CanvasLayer/CenterContainer.visible = false
	if respawn == true:
		$respawn.play()
		respawn = false
	if teleport1 == true:
		$teleport.play("teleport1")
	elif teleport == true:
		$teleport.play("teleport")
	elif teleport == false:
		$teleport.play("idle")
