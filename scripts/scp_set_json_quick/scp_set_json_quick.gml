///@description scp_set_json_quick(json_tring, keys, new_value, [file_path, write_to_disk])
///@function scp_set_json_quick
///@param json_file
///@param keys
///@param new_value
///@param file_path
///@param write_to_disk
function scp_set_json_quick(){
	var _json_string = argument[0];
	var _keys = argument[1];
	var _new_val = argument[2];
	var _ret = "";
	var _save_to_file = false;
	var _file_path = "";
	if (argument_count > 3){
		_file_path = argument[3];
		if (argument_count > 4){
			_save_to_file = argument[4];
		}
	}
	
	var _json_open = undefined;
	
	if (!is_invalid(_json_string, "")){
		_json_open = json_decode(_json_string);
	} else {
		_json_open = scp_file_open_json(_file_path);
	}
	
	
	
	if (is_ds_type_map(_json_open)){
		scp_write_json(_json_open, _keys, _new_val);
	} else {
		show_debug_message("scp_set_json_quick ERROR trying set val: "+string(_new_val)+", with keys: "+string(_keys)+", invalid _json_open");
	}
	
	_ret = scp_file_close_json(_json_open, _save_to_file, _file_path);
	
	return _ret;
}