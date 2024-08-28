extends HSlider

#var bus_index = AudioServer.get_bus_index("Master")
#Gets the audio Bus Index for chaning volume

# Called when the node enters the scene tree for the first time.
func _ready():
	value = db_to_linear(AudioServer.get_bus_volume_db(0)) 
	AudioServer.set_bus_volume_db(0, linear_to_db(value)) 

func _on_value_changed(vvalue: float): 
	AudioServer.set_bus_volume_db(0, linear_to_db(vvalue)) 
	#converts value into decibels for audio puproses 
