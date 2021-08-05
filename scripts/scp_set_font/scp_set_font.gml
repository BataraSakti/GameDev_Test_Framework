///@description scp_set_font(desired_font)
///@function scp_set_font
///@param desired_font
function scp_set_font(argument0) {

	if(draw_get_font() != argument0) {
		//We need to set the font
		draw_set_font(argument0);
	}


}
