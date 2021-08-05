///@description ds_map_destroy_safe(id)
///@param id
function ds_map_destroy_safe(argument0) {

	var map = argument0;

	if(is_ds_type_map(map)){
		if(is_array(map)) {
			qs_map_destroy(map);
		} else {
			ds_map_destroy(map);
		}
	} else {
		var _t_myObj = object_get_name(id.object_index);
		var _t_otherObj = undefined; 
		if(!is_undefined(other)) { _t_otherObj = object_get_name(other.id.object_index); }
		var _t_str = "destroy map var: " + string(argument0) + " obj: " + string(_t_myObj) + " other: " + string(_t_otherObj);
		if(is_undefined(map)) {
			//We don't need to crash if undefined
			show_debug_message("WARN: " + _t_str);
		} else {
			assert(_t_str);	
		}
	}
	
	return undefined;
}