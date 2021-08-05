/// @description scp_array_to_string(array, separator)
/// @function scp_array_to_string
/// @param array
/// @param  separator
function scp_array_to_string(array, separator) {
	if(is_string(array)) { return array; }

	var output = "";	
	for(var i = 0; i < array_length(array); i++) {
	    output += string(array[i]) + string(separator);
	}

	return string_delete(output, string_length(output) - string_length(separator) + 1, string_length(separator));
}
