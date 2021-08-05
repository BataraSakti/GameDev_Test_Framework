///@description scp_set_json_value(json_string, keys, new_val)
///@function scp_set_json_value
///@param json_string
///@param keys
///@param new_val
function scp_set_json_value(){
	var _json_string = argument[0];
	var _keys = argument[1];
	var _new_val = argument[2];
	
	var _json_map = json_decode(_json_string);
	if (is_ds_type_map(_json_map)){
		_keys = scp_split_string(_keys, ".");
		var _inner_json = ds_map_create();
		var _i_map = _json_map;
		for (var i = 0; i < array_length(_keys); i++){
			if (is_ds_type_map(_i_map)){
				var _val = ds_map_find_value(_i_map, _keys[i]);
				if (i == array_length(_keys) - 1){
					ds_map_replace(_i_map, _keys[i], _new_val);
					if(ds_map_empty(_inner_json)){
						_inner_json = ds_copy_safe(_i_map, false);
					} else {
						ds_map_replace(_inner_json, _keys[i-1], ds_copy_safe(_i_map, false));
					}
					ds_map_destroy_safe(_i_map);
				} else {
					_i_map = ds_copy_safe(_val, false);
					ds_map_destroy_safe(_val);
					if(ds_map_empty(_inner_json)){
						_inner_json = ds_copy_safe(_i_map, false);
					} else {
						ds_map_add_map(_inner_json, _keys[i], ds_copy_safe(_i_map, false));
					}
				}
			}
		}
		_json_string = json_encode(_inner_json);
		ds_map_destroy_safe(_inner_json);
	} else {
		show_debug_message("scp_set_json_value ERROR invalid _json_map");
	}
	
	return _json_string;
}
