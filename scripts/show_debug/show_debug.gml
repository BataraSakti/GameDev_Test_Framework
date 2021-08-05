/// @description show_debug(string[, debug_level]);
/// @function show_debug
/// @param string[
/// @param  debug_level]
function show_debug() {
	
	var _debug_enable = true;
		
	
	if(_debug_enable && argument_count >= 1 ) {
	    show_debug_message(string(argument[0]));
	}
	
}
