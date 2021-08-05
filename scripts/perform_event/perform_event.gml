/// @description perform_event(object, user_event)
/// @function perform_event
/// @param object
/// @param  user_event
function perform_event(argument0, argument1) {
	if(is_valid_instance(argument0)) { 
	    with(argument0) { event_user(argument1); }
	}
}
