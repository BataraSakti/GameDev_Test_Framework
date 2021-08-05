/// @description perform_event_safe(object, user_event)
/// @function perform_event_safe
/// @param object
/// @param user_event
function perform_event_safe(argument0, argument1) {

	if(argument0 != noone && is_real(argument0) && instance_exists(argument0) && argument1 != noone && argument1 >= 0) {
	    with(argument0) { event_user(argument1); }
	}



}
