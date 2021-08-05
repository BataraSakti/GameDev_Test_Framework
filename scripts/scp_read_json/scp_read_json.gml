///@description scp_read_json(open_json, keys, [default_value])
///@function scp_read_json
///@param open_json
///@param keys
///@param [default_value]
function scp_read_json(){
	var _json_open = argument[0];
	var _keys = argument[1];
	_keys = scp_split_string(_keys, ".");
	var _ret = undefined;
	
	if (is_ds_type_map(_json_open)){
		var _prev_key = _json_open; //root of the json which is the whole json itself
		var _curr_val = undefined;
		for (var i = 0; i < array_length_1d(_keys); i++){
			if (is_ds_type_map(_prev_key)){
				_curr_val = ds_map_find_value(_prev_key, _keys[i]);
				
				if (i == array_length_1d(_keys) - 1){
					_ret = _curr_val; 
					//not sure if we don't need to destroy the holder of the inner map (_prev_key) of opened json here
					//since the opened json would be taking care later when it closed
				} else {			
					if (is_ds_type_map(_curr_val)){
						//goes deeper
						_prev_key = _curr_val;
					} else {
						show_debug_message("scp_read_json keys["+string(i)+"]: "+string(_keys[i])+" already reach end of nested json here for total nest: "+string(array_length_1d(_keys)));
						//reach end of nest before the end of keys, assingn the return value now
						_ret = _curr_val;
					}
				}
				
			}
		}
	} else {
		show_debug_message("scp_read_json ERROR invalid _json_open");
	}
	
	if (is_invalid(_ret)){
		if (argument_count > 2){
			var _def_val = argument[2];
			show_debug_message("scp_read_json invalid return for "+string(_keys)+", use default value: "+string(_def_val));
			_ret = _def_val;
		}
	}
	return _ret;
}