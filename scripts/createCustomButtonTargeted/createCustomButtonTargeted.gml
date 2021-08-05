///@description createCustomButtonTargeted(x,y,layer,obj,wide,tall,target,target_user_event [, text, parent, parent_callback, button_sprite, start_scale, end_scale, max_text_scale, img_index])
/// @function createCustomButtonTargeted
/// @param x
/// @param y
/// @param layer
/// @param obj
/// @param wide
/// @param tall
/// @param target
/// @param target_user_event [
/// @param  text
/// @param  parent
/// @param  parent_callback
/// @param  button_sprite
/// @param  start_scale
/// @param  end_scale
/// @param  max_text_scale
/// @param  img_index]
function createCustomButtonTargeted() {
	var txt = "";
	var parent = "";
	var parent_target = "";
	var button_sprite = "";
	var start_scale = "";

	if(argument_count >= 9) {    
	    if(argument[8] != "") {
	        txt = argument[8];
	    }
	}
	if(argument_count >= 11){
		if(argument[9] != ""){
			parent = argument[9];
			parent_target = argument[10];
		}
	}
	if(argument_count >= 12){
		if(argument[11] != "")	{
			button_sprite = argument[11];	
		}
	}
	if(argument_count >= 13) {
		if(argument[12] != "")	{
			start_scale = argument[12];	
		}
	}

	var t__ = createButtonTargeted(argument[0], argument[1], argument[2], argument[3], argument[6], argument[7], txt, parent, parent_target, button_sprite, start_scale);
	t__.wide = argument[4];
	t__.tall = argument[5];
	if(argument_count >= 14){
		if(argument[13] != ""){
			t__.p_xscale_dest = argument[13];
			t__.p_yscale_dest = argument[13];
		}
	}
	if(argument_count >=15){
		if(argument[14] != "")	{
			t__.max_text_scale = argument[14];	
		}
	}

	if(argument_count >= 16){
		if(argument[15] != ""){
			t__.image_index = argument[15];
		}
	}

	return t__; //In case we wanted to say set the text ... 


}
