///@description scp_read_json_file_to_string(json_file_name)
///@function scp_read_json_file_to_string
///@param json_file_name
/*
	This function would return a JSON string from json file
	Note that a very large json file may lead to out of memory exception
*/
function scp_read_json_file_to_string(_file_name) {
	var _json_string = "";
	if(file_exists(_file_name)) { 
		var _file = file_text_open_read(_file_name);
	
		//Kinda curios why we needed a special function to strip characters...
		function fun_string_del(_src, _t) {
			var _p = string_pos(_t, _src);
			if(_p > 0) { _src = string_delete(_src, _p, string_length(_t)); }
			return _src;
		}

		if(_file != -1) {
			while(!file_text_eof(_file)){
				var _val = file_text_readln(_file);			
				var _s = "\r\n"; //remove new lines character(s)
				_val = fun_string_del(_val, _s);
				_s = "\n";
				_val = fun_string_del(_val, _s);
				_json_string += _val;
			}
			file_text_close(_file);
		} else {
			_json_string = undefined;
			show_debug_message("read_json_to_string FILE_ERROR "+string(_file_name));
		}
	} else {
		_json_string = undefined;
		show_debug_message("read_json_to_string FILE_NOT_FOUND "+string(_file_name));
	}
	
	return _json_string;
}
