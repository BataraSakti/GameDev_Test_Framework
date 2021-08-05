/// @description scp_convert_array_to_list(array,list_to_write_to)
/// @function scp_convert_array_to_list
/// @param array
/// @param list_to_write_to
function scp_convert_array_to_list(argument0, argument1) {

	var arr = argument0;
	var list = argument1;

	for(var i = 0; i < array_length(arr); i++){
	    ds_list_add(list, arr[i]);
	}
}
