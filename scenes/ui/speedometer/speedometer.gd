extends Control

@export var progress_bar : TextureProgressBar
@export var max_displayable_velocity : float
@export var vehicle_to_track : VehicleController

func _process(delta):
	progress_bar.value = remap(abs(vehicle_to_track.forward_velocity),0,max_displayable_velocity,0,100)
