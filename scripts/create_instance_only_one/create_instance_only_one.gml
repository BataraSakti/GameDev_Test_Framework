/// @description create_instance_only_one(x, y, layer, obj)
/// @function create_instance_only_one
/// @param x
/// @param  y
/// @param layer
/// @param  obj
function create_instance_only_one(argument0, argument1, argument2, argument3) {
	//Will create the instance if no instance exist of it.
	//Returns found instance otherwise.

	if(instance_number(argument3) == 0) {
	    return instance_create_layer(argument0, argument1, argument2, argument3);
	} else {
	    return instance_find(argument3,0);
	}



}
