/// @description scp_value_in_array(value, array) 
/// @function scp_value_in_array
/// @param value
/// @param  array
function scp_value_in_array(argument0, argument1) {

	if(is_array(argument1)) {   
	    for(var t_ = 0; t_ < array_length(argument1); t_++) {
	        if(string(argument1[t_]) == string(argument0)) {
	            return true;
	        }
	    }
	}
    
	return false;
}
