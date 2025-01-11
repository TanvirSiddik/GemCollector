extends Area2D
class_name Gem
#Global Variables
signal _on_gem_off_screen

@export var yAxis: float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += yAxis * delta
	if position.y > get_viewport_rect().size.y:
		_on_gem_off_screen.emit()
		queue_free()
 
