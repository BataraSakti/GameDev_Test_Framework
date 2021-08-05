/// @description layer_depth_exists(depth)
/// @param depth
function layer_depth_exists(argument0) {
	// returns layer_id if there is layer with provided depth otherwise returns -1

	var t_depth = argument0;
	var t_layers = layer_get_all();

	for (var i = 0; i < array_length_1d(t_layers); i++)
	{
		if(layer_get_depth(t_layers[i]) == t_depth){
			return t_layers[i];
		}
	}

	return -1;


}
