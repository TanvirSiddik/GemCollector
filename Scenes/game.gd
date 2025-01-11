extends Node2D

@export var gem_scene: PackedScene
@onready var timer: Timer = $Timer

#Lables
@onready var socre_label: Label = $Label
@onready var label_2: Label = $Label2

#TouchControls
@onready var touch_screen_button: TouchScreenButton = $TouchScreenButton
@onready var touch_screen_button_2: TouchScreenButton = $TouchScreenButton2
@onready var paddle: Area2D = $paddle

#AudioPlayers
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var audio_stream_player_2: AudioStreamPlayer = $AudioStreamPlayer2
@onready var audio_stream_player_3: AudioStreamPlayer = $AudioStreamPlayer3

var counter_score: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player.play()
	label_2.visible_characters = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if touch_screen_button.is_pressed():
		paddle.position.x -= 310 * delta
	elif touch_screen_button_2.is_pressed():
		paddle.position.x += 310 * delta
	pass
	
func game_over() -> void:
	timer.stop()
	audio_stream_player.stop()
	audio_stream_player_3.play()
	for child in get_children():
		child.set_process(false)
	label_2.visible_characters = -1
	
func _gem_spawn() -> void:
	var new_gem: Gem = gem_scene.instantiate()
	var xPos: float = randf_range(70, 1200)
	new_gem._on_gem_off_screen.connect(game_over)
	new_gem.position = Vector2(xPos, 0)
	add_child(new_gem)

func _on_timer_timeout() -> void:
	_gem_spawn()


func _on_paddle_area_entered(area: Area2D) -> void:
	
	counter_score += 1
	audio_stream_player_2.play()
	socre_label.text = str(counter_score)
	area.queue_free()
