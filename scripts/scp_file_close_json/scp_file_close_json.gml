///@description scp_file_close_json(opened_json, [save_to_file, file_path])
///@function scp_file_close_json
///@param opened_json
///@param [save_to_file,
///@param file_path]
function scp_file_close_json(){
	var _opened_json = argument[0];
	var _save_to_file = false;
	var _file_path = "";
	var _json_string = "";
	if (argument_count > 1){
		_save_to_file = argument[1];
		if (_save_to_file){
			if (argument_count > 2){
				_file_path = argument[2];
			}
			if (argument_count <= 2 || _file_path == "")
			{
				show_debug_message("scp_file_close_json can't saving file, file_path is not provided");
				_save_to_file = false;
			}
		}
	}
	
	
	if (is_ds_type_map(_opened_json)){
		if (_save_to_file){
			_json_string = json_encode(_opened_json);
			scp_write_json_string_to_file(_file_path, _json_string);
		}
		ds_map_destroy_safe(_opened_json);
	} else {
		show_debug_message("scp_file_close_json invalid opened Json To close");
	}
	
	return _json_string;
}