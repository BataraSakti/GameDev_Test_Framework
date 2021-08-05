/// @description nine_slice(sprite, x1, y1, x2, y2, [img_index, alpha, img_blend])
/// @function nine_slice
/// @param sprite
/// @param  x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  [img_index
/// @param  alpha
/// @param	img_blend]
function nine_slice() {

	///@param sprite
	///@param x1
	///@param y1
	///@param x2
	///@param y2
	///@param img_index

	var sprite = argument[0];
	var x1 = argument[1];
	var y1 = argument[2];
	var x2 = argument[3];
	var y2 = argument[4];
	var index = 0;
	var alpha = image_alpha;
	var img_blend = c_white;
	if(argument_count > 5){index = argument[5];}
	if(argument_count > 6){alpha = argument[6];}
	if(argument_count > 7){img_blend = argument[7];}

	var slice_width = sprite_get_width(sprite)/3;
	var slice_height = sprite_get_height(sprite)/3;

	/*
	if( sprite_get_width(sprite)%3 != 0 && sprite_get_height(sprite)%3 != 0 ) {
		var t_xx_name = string(sprite_get_name(sprite));
		var t_xx_object = string(object_get_name(object_index));
	    show_debug("WARNING: " + t_xx_object + " rendering sprite " + t_xx_name + " not a multiple of 3. w: " + string(sprite_get_width(sprite)) + " h: " + string(sprite_get_height(sprite)));
	}
	*/

	var width = abs(x2-x1);
	var height = abs(y2-y1);

	// Top
	draw_sprite_part_ext(sprite, index, 0, 0, slice_width, slice_height, x1, y1, 1, 1, img_blend, alpha); // Left
	draw_sprite_part_ext(sprite, index, slice_width, 0, slice_width, slice_height, x1+slice_width, y1, (width-slice_width*2)/slice_width, 1, img_blend, alpha); // Middle
	draw_sprite_part_ext(sprite, index, slice_width*2, 0, slice_width, slice_height, x2-slice_width, y1, 1, 1, img_blend, alpha); // Right

	// Middle
	draw_sprite_part_ext(sprite, index, 0, slice_height, slice_width, slice_height, x1, y1+slice_height, 1, (height-slice_height*2)/slice_height, img_blend, alpha); // Left
	draw_sprite_part_ext(sprite, index, slice_width, slice_height, slice_width, slice_height, x1+slice_width, y1+slice_height, (width-slice_width*2)/slice_width, (height-slice_height*2)/slice_height, img_blend, alpha); // Middle
	draw_sprite_part_ext(sprite, index, slice_width*2, slice_height, slice_width, slice_height, x2-slice_width, y1+slice_height, 1, (height-slice_height*2)/slice_height, img_blend, alpha); // Right

	// Bottom
	draw_sprite_part_ext(sprite, index, 0, slice_height*2, slice_width, slice_height*2, x1, y2-slice_height, 1, 1, img_blend, alpha); // Left
	draw_sprite_part_ext(sprite, index, slice_width, slice_height*2, slice_width, slice_height, x1+slice_width, y2-slice_height, (width-slice_width*2)/slice_width, 1, img_blend, alpha); // Middle
	draw_sprite_part_ext(sprite, index, slice_width*2, slice_height*2, slice_width, slice_height, x2-slice_width, y2-slice_height, 1, 1, img_blend, alpha); // Right




}
