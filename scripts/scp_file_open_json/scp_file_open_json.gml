///@description scp_file_open_json(file_path)
///@function scp_file_open_json
///@param file_path
function scp_file_open_json(){
	var _file_path = argument[0];
	var _json_map = undefined;
	if (file_exists(_file_path)){
		var _json_string = scp_read_json_file_to_string(_file_path);
		if (!is_invalid(_json_string)){
			_json_map = json_decode(_json_string);
		}
	} else {
		show_debug_message("scp_file_open_json ERROR file "+string(_file_path)+" doesn't exists");
	}
	
	if (is_invalid(_json_map)){
		show_debug_message("scp_file_open_json invalid opened json");
		_json_map = undefined;
	}
	
	return _json_map;
}