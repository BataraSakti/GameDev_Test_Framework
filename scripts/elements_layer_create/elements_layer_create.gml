/// @description elements_layer_create()
function elements_layer_create() {
	elements_layer = layer_exists_create(layer_get_depth(layer) - 1);
	return elements_layer;
}