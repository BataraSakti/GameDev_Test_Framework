/// @description layer_exists_create(depth)
/// @param depth
function layer_exists_create(argument0) {
	//if layer of provided depth exists return layer_id else create new layer

	var new_depth = argument0;
	var new_layer = layer_depth_exists(new_depth);

	return new_layer == -1 ? layer_create(new_depth) : new_layer;


}
