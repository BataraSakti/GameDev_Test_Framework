///@description ds_list_destroy_safe(id)
///@param id
function ds_list_destroy_safe(lst) {
	if(is_ds_type_list(lst)) {
		if(is_array(lst)) {
			qs_list_destroy(lst);
		} else {
			ds_list_destroy(lst);
		}
	} else {
		var _t_myObj = object_get_name(id.object_index);
		var _t_otherObj = undefined; 
		if(!is_undefined(other)) { _t_otherObj = object_get_name(other.id.object_index); }
		var _t_str = "destroy list var: " + string(lst) + " obj: " + string(_t_myObj) + " other: " + string(_t_otherObj);
		if(is_undefined(lst)) {
			//We don't need to crash if undefined
			show_debug_message("WARN: " + _t_str);
		} else {
			assert(_t_str);	
		}
	}
	
	return undefined;
}
