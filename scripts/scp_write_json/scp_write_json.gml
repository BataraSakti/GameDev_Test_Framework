///@description scp_write_json(opened_json, keys, new_value, [data_type])
///@function scp_write_json
///@param opened_json 
///@param keys
///@param new_value
///@param data_type
function scp_write_json(){

	var _opened_json = argument[0];
	var _keys = argument[1];
	var _new_val = argument[2];
	var _data_type = 0; //0. non-ds
	if (argument_count > 3){
		_data_type = argument[3];
	}
	if (is_ds_type_map(_opened_json)){
		
		_keys = scp_split_string(_keys, ".");
		var _prev_key = _opened_json; //root of the json which is the whole json itself
		var _curr_val = undefined;
		for (var i = 0; i < array_length_1d(_keys); i++){
			if (is_ds_type_map(_prev_key)){
				_curr_val = ds_map_find_value(_prev_key, _keys[i]);
				
				if (i == array_length_1d(_keys) - 1){
					if (!is_invalid(_curr_val)){
						if (_data_type == 0){
							ds_map_replace(_prev_key, _keys[i], _new_val);
						} else if (_data_type == ds_type_map){
							ds_map_replace_map(_prev_key, _keys[i], _new_val);
						} else if (_data_type == ds_type_list){
							ds_map_replace_list(_prev_key, _keys[i], _new_val);
						}
							
					} else {
						if (_data_type == 0){
							ds_map_add(_prev_key, _keys[i], _new_val);
						} else if (_data_type == ds_type_map) {
							ds_map_add_map(_prev_key, _keys[i], _new_val);
						} else if (_data_type == ds_type_list) {
							ds_map_add_list(_prev_key, _keys[i], _new_val);
						}
					}
					//changes on here would also changes the main json
					//it would closed later one file json close
					
				} else {			
					if (is_ds_type_map(_curr_val)){
						//goes deeper
						_prev_key = _curr_val;
					} else if (!is_invalid(_curr_val)){
						//key is exitst but it's has non-map value, replace it with map now
						show_debug_message("scp_write_json replacing key "+string(_keys[i])+" from "+string(_curr_val)+" with a map");
						ds_map_replace_map(_prev_key, _keys[i], ds_map_create());
						_curr_val = ds_map_find_value(_prev_key, _keys[i]);
						_prev_key = _curr_val; //move the pointer further
					} else {
						//no such key, add it now
						show_debug_message("scp_write_json adding empty map with key "+string(_keys[i]));
						ds_map_add_map(_prev_key, _keys[i], ds_map_create());
						
						_curr_val = ds_map_find_value(_prev_key, _keys[i]);
						_prev_key = _curr_val; //move the pointer further
					}
				}
				
			}
		}
		
	} else {
		show_debug_message("scp_write_json ERROR  invalid opened json to write");
	}
	
	return _opened_json;

}
