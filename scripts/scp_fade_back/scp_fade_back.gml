/// @description scp_fade_back(alpha_value, color, view)
/// @function scp_fade_back
/// @param alpha_value
/// @param  color
/// @param  view
function scp_fade_back(argument0, argument1, argument2) {

	var cam = view_get_camera(argument2);
	var cw = room_width;
	var ch = room_height;
	var xx = 0;
	var yy = 0;
	if(cam != -1) { //View exists so use it - otherwise we default to application values
		cw = view_get_wport(cam);
		ch = view_get_hport(cam);
		xx = view_get_xport(cam);
		yy = view_get_yport(cam);
	}

	var _tv = draw_get_alpha();
	draw_set_alpha(clamp(argument0,0,1));
	draw_rectangle_colour(xx, yy, cw, ch, argument1, argument1, argument1, argument1, false);
	draw_set_alpha(_tv);


	/*
	var _tv = draw_get_alpha();
	draw_set_alpha(clamp(argument0,0,1));
	draw_rectangle_colour(__view_get( e__VW.XPort, argument2 ), __view_get( e__VW.YPort, argument2 ), __view_get( e__VW.WPort, argument2 ), __view_get( e__VW.HPort, argument2 ), argument1, argument1, argument1, argument1, false);
	draw_set_alpha(_tv);
	*/


}
