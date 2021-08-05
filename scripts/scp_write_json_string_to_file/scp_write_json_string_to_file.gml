///@description scp_write_json_string_to_file(json_file_name, json_string)
///@function scp_write_json_string_to_file
///@param json_file_name
///@param json_string
function scp_write_json_string_to_file() {



	var _file_name = argument[0];
	var _json_string = argument[1];
	var _file = file_text_open_write(_file_name);
	var _isSuccess = true;

	if(_file != -1){
	
		file_text_write_string(_file, _json_string);
		file_text_close(_file);
	} else {
		_isSuccess = false;
		show_debug_message("scp_write_json_string_to_file ERROR file "+string(_file_name)+" can't be created or opened");
	}

	return _isSuccess;


}
