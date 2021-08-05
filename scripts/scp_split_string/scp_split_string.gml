/// @description scp_split_string(string, delimiter_character, [canZeroReturn, canEmptyString])
/// @function scp_split_string
/// @param string
/// @param  delimiter_character
/// @param [canZeroReturn 
/// @param canEmptyString]
function scp_split_string(str, delimiter) {
//gml_pragma("forceinline"); // in YYC, proccessing boost

	if(!is_string(str)) {
		str = string(str);
		assert("scp_split_string not string: " + str);
	}
	
	var return_array = [];
	var slot = 0;
	var current_str = "";
	var canZeroReturn = false;
	var canEmptyString = false;
	
	if(argument_count > 2) { canZeroReturn = argument[2]; }
	if(argument_count > 3) { canEmptyString = argument[3]; }

	if(string_count(delimiter,str) == 0) {
	    return_array[0] = str; //If no delimiter just return an array with a single entry
	} else {
	    for(var i = 1; i < (string_length(str) + 1); i++){
	        var current_char = string_copy(str, i, 1);
	        if(string_count(current_char, delimiter) > 0){ //support more than one char delimiter
				if(current_str != "" || canEmptyString){
					return_array[slot] = current_str;
					slot++;
					current_str = "";
				}
	        }else{
	            current_str += current_char;
	            return_array[slot] = current_str;
	        }
	    }
	}
	
	if(!canZeroReturn){
		if(array_length(return_array) < 1){
			return_array[0] = str;
		}
	}
	
	return return_array;
}
