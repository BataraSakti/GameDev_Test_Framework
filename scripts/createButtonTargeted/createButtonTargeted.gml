/// @description createButtonTargeted(x,y,layer,obj,target,target_user_event [, text, parent, parent_callback, button_sprite, start_scale])
/// @function createButtonTargeted
/// @param x
/// @param y
/// @param layer
/// @param obj
/// @param target
/// @param target_user_event 
/// @param  [text
/// @param  parent
/// @param  parent_callback
/// @param  button_sprite
/// @param  start_scale]
function createButtonTargeted() {

	var t__ = instance_create_layer(argument[0], argument[1], argument[2], argument[3]);
	t__._target = argument[4];
	t__._target_event = argument[5];

	if(argument_count >= 7) {
    
	    if(argument[6] != "") {
	        t__.text = argument[6];
	    }
	}

	if(argument_count >= 9) {    
	    if(argument[7] != "") {
	        t__._parent = argument[7];
	        t__._parent_event = argument[8];
	    }
	}

	if(argument_count >= 10) {
	    if(argument[9] != "") {
	        t__.press = argument[9];
	        t__.sprite = argument[9];
	        t__.sprite_index = argument[9];
	        t__.image_index = 0;
	        t__.mask_index = argument[9];
	    }
	}
	if (argument_count >= 11){
	    if (argument[10] != ""){
	        t__.p_xscale_start = argument[10];
	        t__.p_yscale_start = argument[10];
	    }
	}

	return t__; //In case we wanted to say set the text ... 





}
