/// @description scp_createButtonTargeted_handle(x,y,layer,obj,target,target_user_event, text, parent, parent_callback, button_sprite, start_scale, handle_var_object, handle_var_string)
/// @function scp_createButtonTargeted_handle
/// @param x
/// @param y
/// @param layer
/// @param obj
/// @param target
/// @param target_user_event 
/// @param text
/// @param parent
/// @param parent_callback
/// @param button_sprite
/// @param start_scale
/// @param handle_var_object
/// @param handle_var_string
function scp_createButtonTargeted_handle() {

	var t_t = createButtonTargeted(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9], argument[10]);

	if(instance_exists(argument[11]) && variable_instance_exists(argument[11], argument[12])) {
		variable_instance_set(argument[11], argument[12], t_t);
		show_debug("Setting variable " + string(argument[12]) + " in object " + object_get_name(argument[11].object_index) + " to: " + string(t_t));
	} else {
		show_debug("scp_createButtonTargeted_handle Could not set button handler variable");	
	}

	return t_t;


}
