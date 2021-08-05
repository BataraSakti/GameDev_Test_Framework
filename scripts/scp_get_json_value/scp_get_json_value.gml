///@description scp_get_json_value(json_string, keys)
///@function scp_get_json_value
///@param json_string
///@param keys
function scp_get_json_value(){
	var _json_string = argument[0];
	var _json_map = json_decode(_json_string);
	var _keys = argument[1];
	_keys = scp_split_string(_keys, ".");
	var _ret = undefined;
	
	if (is_ds_type_map(_json_map)){
		var _keys_val = _json_map;
		for (var i = 0; i < array_length_1d(_keys); i++){
			if(is_ds_type_map(_keys_val)){
				var _val = ds_map_find_value(_keys_val, _keys[i]);
				if (i == array_length_1d(_keys) - 1){
					_ret = _val;
					ds_map_destroy_safe(_keys_val);
				} else {
					_keys_val = ds_copy_safe(_val, false);
					ds_map_destroy_safe(_val);
				}
			}
		}
		ds_map_destroy_safe(_json_map);
	} else {
		show_debug_message("scp_get_json_value ERROR invalid json_map");
	}
	
	return _ret;
}