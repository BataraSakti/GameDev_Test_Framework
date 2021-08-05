/// @description string_replace_at(string, pos,val)
/// @function string_replace_at
/// @param string
/// @param  pos
/// @param val
function string_replace_at(argument0, argument1, argument2) {

	var str = argument0;
	var pos = argument1;
	var val = argument2;
	var new_str = "";
	new_str = string_insert(val, str, pos);
	var newer_str = string_delete(new_str, pos+1, 1);



	return newer_str;



}
