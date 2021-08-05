/// @description object_perform_var_forced(target, user_event, var_scp, val)
/// @function object_perform_var_forced
/// @param target
/// @param  user_event
/// @param  var_scp
/// @param  val
function object_perform_var_forced(argument0, argument1, argument2, argument3) {
	var t_obj = argument0;
	if(t_obj) { } else { show_debug("Fail test ID basic " + string(t_obj)); }
	if(object_exists(t_obj)) { } else { show_debug("Fail object_exists - Force Running - May Crash if not an instance ID " + string(t_obj)); }

	if(t_obj) {
	    with(t_obj){
	        script_execute(argument2,argument3);
	        event_user(argument1);
        
	        show_debug(string(t_obj) + " performs event " + string(argument1) + " with var " + string(argument3));
	    }
	} else {
	    show_debug("object_perform_var can not find object " + string(t_obj));
	}



}
