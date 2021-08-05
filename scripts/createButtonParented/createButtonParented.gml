/// @description createButtonParented(x,y,layer,obj,parent,parent_event, [text, button_sprite])
/// @function createButtonParented
/// @param x
/// @param y
/// @param layer
/// @param obj
/// @param parent
/// @param parent_event [
/// @param  text
/// @param  button_sprite]
function createButtonParented() {

	var t__ = instance_create_layer(argument[0], argument[1], argument[2], argument[3]);
	t__._parent = argument[4];
	t__._parent_event = argument[5];

	if(argument_count >= 7) {
    
	    if(argument[6] != "") {
	        t__.text = argument[6];
	    }
	}

	if(argument_count >= 8) {
	    if(argument[7] != "") {
	        t__.press = argument[7];
	        t__.sprite = argument[7];
	        t__.sprite_index = argument[7];
	        t__.image_index = 0;
	        t__.mask_index = argument[7];
	    }
	}

	return t__; //In case we wanted to say set the text ... 



}
