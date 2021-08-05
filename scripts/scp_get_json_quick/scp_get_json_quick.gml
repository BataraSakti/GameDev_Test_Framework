///@desciption scp_get_json_quick(json_string, keys, [default_value, json_file, write_to_disk]);
///@function scp_get_json_quick
///@param json_string
///@param keys
///@param [default_value
///@param json_file
///@param write_to_disk]
function scp_get_json_quick(){
	var _json_string = argument[0];
	var _keys = argument[1];
	var _ret = undefined;
	var _file_path = "";
	var _write_to_disk = false;
	var _def_value = undefined;
	
	if (argument_count > 2){
		_def_value = argument[2];
	}
	
	if (argument_count > 3){
		_file_path = argument[3];
	}
	
	if (argument_count > 4){
		_write_to_disk = argument[4];
	}
	var _json_open = undefined;
	if (!is_invalid(_json_string, "")){
		_json_open = json_decode(_json_string);
	} else {
		_json_open = scp_file_open_json(_file_path);
	}
	
	
	
	if (is_ds_type_map(_json_open)){
		_ret = scp_read_json(_json_open, _keys);
	} else {
		show_debug_message("scp_get_json_quick ERROR getting value with keys "+string(_keys)+", invalid json_open");
	}
	
	
	if (is_invalid(_ret)){
		if (argument_count > 2){
			_ret = _def_value;
			show_debug_message("scp_get_json_quick invalid result for "+string(_file_path)+" with keys:"+string(_keys)+", use the given default value");
		}
	}
	
	scp_file_close_json(_json_open, _write_to_disk, _file_path);
	
	return _ret;
}