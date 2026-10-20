extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var health = 100
var player_name = "Chopper"

func _ready():
	print(player_name, " has entered the scene with ", health, " HP.")
	_take_damage(100)
	if health == 0:
		_game_over()

func _take_damage(amount):
	health -= amount
	print("Health is now: ", health)
	
func _game_over():
	
	print("Game OVERRRRRAHAHAHAHHAHAH")
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
