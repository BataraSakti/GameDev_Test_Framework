/// @description nine_slice_frame(sprite, x, y, width, height, border_dist, sprite_var, alpha)
/// @function nine_slice_frame
/// @param sprite
/// @param  x
/// @param  y
/// @param  width
/// @param  height
/// @param  border_dist
/// @param  sprite_var
/// @param  alpha
function nine_slice_frame(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	//ToDo: Seperate into generation and easy draw insert scripts.  
	var sprite_var = argument6;

	//Make a frame with nineslice! 
	if(!is_undefined(sprite_var) && sprite_exists(sprite_var)) {
	    draw_sprite_ext(sprite_var, 0, argument1, argument2, 1, 1, 0, image_blend, argument7);
		//show_debug("nine_slice_frame - drawing sprite from arugment");
	    return sprite_var; 
	} else {
		show_debug("nine_slice_frame - creating surface");
	    var surf = surface_create(argument3,argument4);
	    surface_set_target(surf);
	    draw_clear_alpha(0, 0);
	    nine_slice_center(argument0, argument3*0.5, argument4*0.5, argument3, argument4, 0, argument7);
	    draw_set_blend_mode(bm_subtract); //Cut a hole in this... 
	    draw_set_colour(c_black);
	    draw_rectangle(argument5,argument5,argument3-argument5,argument4-argument5,false);
	    draw_set_blend_mode(bm_normal);
	    surface_reset_target();
		var tt_frame = spr_tran;
		if(!is_undefined(surf) && surface_exists(surf)) {
			show_debug("nine_slice_frame - creating sprite");
			tt_frame = sprite_create_from_surface(surf,0,0,argument3,argument4,false,false,argument3*0.5,argument4*0.5);
			//scp_free_surface(surf);
			surface_free(surf);
		}
	
	    //Recursive so it draws this step too
		var ttt_f = nine_slice_frame(argument0, argument1, argument2, argument3, argument4, argument5, tt_frame, argument7);
		if(is_undefined(ttt_f)) {
			show_debug("ttt_f is undefined in nine_slice_frame!");
		} else {
			if(!sprite_exists(ttt_f)) {
				show_debug("ttt_f sprite does not exist in nine_slice_frame!");
			}
		}
	
		if(is_undefined(tt_frame)) {
			show_debug("tt_frame is undefined in nine_slice_frame!");
		} else {
			if(!sprite_exists(tt_frame)) {
				show_debug("tt_frame sprite does not exist in nine_slice_frame!");
			}
		}
	
		return tt_frame;
	}



}
