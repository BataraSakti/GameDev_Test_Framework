/// @description instance_destroy_safe(id)
/// @param id
function instance_destroy_safe(inst) {
	if (inst != noone && !is_undefined(inst)) {
		if (is_array(inst)) {
			assert("Tried to destroy an array: " + string(object_get_name(object_index)));
		} else if(instance_exists(inst)) {
			instance_destroy(inst);
		}
	}
	
	return noone;
}
