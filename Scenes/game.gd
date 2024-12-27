extends Node2D

@export var gem_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _gem_spawn() -> void:
	var new_gem = gem_scene.instantiate()
	var xPos: float = randf_range(70, 1100)
	new_gem.position = Vector2(xPos, -50)
	add_child(new_gem)
	

func _on_timer_timeout() -> void:
	_gem_spawn()
