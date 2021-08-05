/// @description destroy_instance(instance)
/// @function destroy_instance
/// @param instance
function destroy_instance(inst) {
	if(is_valid_instance(inst)) {
	    with(inst) { instance_destroy(); } 
	}
	
	return noone;
}