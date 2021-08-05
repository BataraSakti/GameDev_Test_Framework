/// @description createButtonLink(x, y, layer, text, link, draw_back [, parent, parent_callback, button_sprite, object])
/// @function createButtonLink
/// @param x
/// @param  y
/// @param layer
/// @param  text
/// @param  link
/// @param  draw_back [
/// @param  parent
/// @param  parent_callback
/// @param  button_sprite
/// @param  object ]
function createButtonLink() {
	var obj = p_link_button;
	if(argument_count > 9) { obj = argument[9]; }
	var t__ = instance_create_layer(argument[0], argument[1], argument[2], obj);
	t__.text = argument[3];

	t__.link = argument[4];
	t__.draw_back = argument[5];

	if(argument_count >= 8) {    
	    if(!is_string(argument[6]) && argument[6] != "") {
	        t__._parent = argument[6];
	        t__._parent_event = argument[7];
	    } else {
			t__._parent = noone;
	        t__._parent_event = 0;	
		}
	}

	if(argument_count >= 9) {
	    if(argument[8] != "") {
	        t__.press = argument[8];
	        t__.sprite = argument[8];
	        t__.sprite_index = argument[8];
	        t__.image_index = 0;
	        t__.mask_index = argument[8];
	    }
	}

	return t__; //In case we wanted to say set the text ... 




}
