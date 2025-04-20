class_name player extends CharacterBody2D

var wheelBase = 70
var steerAngle = 25
var steerDir
var acc = Vector2.ZERO
var enginePower = 500
var fric = -0.9
var drag = -0.001
var brake = -450
@onready var nginePlayer: AudioStreamPlayer2D = get_node("engineSfx")
@onready var breakPlayer: AudioStreamPlayer2D = get_node("breakSfx")
@onready var roadHitbox: Area2D = get_node("Area2D")
var score := 1.0
var currentWorld := "debug"
var damageable := true
var currentItem: item :
	set(value):
		currentItem = value 
		get_tree().root.get_node("gameManager").add_child(currentItem)

func _physics_process(delta):
	acc = Vector2.ZERO
	var checkedRoad: road = null
	for i in roadHitbox.get_overlapping_areas():
		if i is road:
			checkedRoad = i as road
	if checkedRoad != null:
		enginePower = 500
		if velocity.y >= 2:
			score += .1
	else:
		enginePower = 50
		if score > 1:
			score -= .01
	getInput()
	applyFric()
	calculateSteering(delta)
	velocity += acc * delta
	move_and_slide()


func applyFric():
	if velocity.length() < 5:
		velocity = Vector2.ZERO
	var ff = velocity * fric
	var dragF = velocity * velocity.length() * drag
	acc += dragF + ff
	
func getInput():
	var turn = 0
	if currentItem != null and Input.is_action_just_pressed("item"):
		currentItem.sf.set_deferred("playing",  true)
		currentItem.activate()
	if Input.is_action_pressed("left"):
		turn -= 1
	if Input.is_action_pressed("right"):
		turn += 1
	if Input.is_action_pressed("drift"):
		steerAngle = 50
	else:
		steerAngle = 25
	steerDir = turn * deg_to_rad(steerAngle)
	if Input.is_action_pressed("gas"):
		acc = transform.x * enginePower
		nginePlayer.playing = true
	else:
		nginePlayer.playing = false
	if Input.is_action_pressed("brake"):
		acc = transform.x * brake
	if Input.is_action_just_pressed("brake") and velocity != Vector2.ZERO:	
		breakPlayer.play()
		pass
	
func _process(delta):
	if score < 0:
		get_tree().reload_current_scene()
		
func calculateSteering(delta):
	var rearWheel = position - transform.x * wheelBase/2
	var frontWheel = position + transform.x * wheelBase/2
	rearWheel += velocity * delta
	frontWheel += velocity.rotated(steerDir) * delta
	var newHeading = (frontWheel - rearWheel).normalized()
	velocity = newHeading * velocity.length()
	rotation = newHeading.angle()
	
