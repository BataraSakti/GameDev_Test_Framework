// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ds_copy_safe(ds, is_list){
	var _ds_copied = undefined;
	var _nested = false;
	if(argument_count > 2) { _nested = argument[2]; }
	
	if(is_list) {
		if (is_ds_type_list(ds)) {
			_ds_copied = ds_list_create();
			for(var i = 0; i < ds_list_size(ds); i++) { 
				var t_val = ds_list_find_value(ds, i);
				//show_debug("Copy value: " + string(t_val));
				if(_nested) {
					if(is_ds_type_map(t_val)) {
						t_val = json_decode(json_encode(t_val));
						ds_list_add(_ds_copied, t_val);
						ds_list_mark_as_map(_ds_copied, ds_list_size(_ds_copied)-1);
					} else if(is_ds_type_list(t_val)) {
						t_val = ds_copy_safe(t_val, true);
						ds_list_add(_ds_copied, t_val);
						ds_list_mark_as_list(_ds_copied, ds_list_size(_ds_copied)-1);
					} else {
						ds_list_add(_ds_copied, t_val);
					}
				} else {
					ds_list_add(_ds_copied, t_val);
				}
			}
		}
	} else {
		if (is_ds_type_map(ds)) {	
			var _ds_json = json_encode(ds);
			_ds_copied = json_decode(_ds_json);
		}
	}
	
	return _ds_copied;
}