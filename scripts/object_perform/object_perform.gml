/// @description object_perform(target, user_event)
/// @function object_perform
/// @param target
/// @param  user_event
function object_perform(argument0, argument1) {
	var t_obj = argument0;
	if(t_obj) { } else { show_debug("Fail test ID basic " + string(t_obj)); }
	if(object_exists(t_obj)) { } else { show_debug("Fail object_exists " + string(t_obj)); }

	if(t_obj && object_exists(t_obj)) {
	    with(t_obj){
	        event_user(argument1);
	    }
	} else {
	    show_debug("object_perform_var can not find object " + string(t_obj));
	}




}
