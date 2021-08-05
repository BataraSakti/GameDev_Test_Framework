/// @description nine_slice_opt(sprite, w, h, [img_index])
/// @function nine_slice_opt
/// @param sprite
/// @param  w
/// @param  h
/// @param  img_index
function nine_slice_opt() {

	var surface = noone;
	var w = argument[1];
	var h = argument[2];
	surface = surface_create(w,h);
	surface_set_target(surface);
	draw_clear_alpha(c_white, 0);
	var img_in = 0;
	if(argument_count > 3){
		img_in = argument[3];
	}
	nine_slice_center(argument[0], w/2, h/2, w, h, img_in, 1);
	var new_spr = sprite_create_from_surface(surface,0, 0, w, h, false,true, w/2, h/2);
	surface_reset_target();
	surface_free(surface);
	//scp_free_surface(surface);

	return new_spr;



}
