extends HSlider

var bus_index = AudioServer.get_bus_index("SFX") 
#Gets the audio Bus Index for chaning volume

# Called when the node enters the scene tree for the first time.
func _ready():
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index)) 
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value)) 

func _on_value_changed(value: float): 
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value)) 
	#converts value into decibels for audio puproses 
