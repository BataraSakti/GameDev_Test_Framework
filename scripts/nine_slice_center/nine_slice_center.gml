/// @description nine_slice_center(sprite, x, y, w, h, [img_index, alpha, img_blend])
/// @function nine_slice_center
/// @param sprite
/// @param  x
/// @param  y
/// @param  w
/// @param  h
/// @param  [img_index
/// @param  alpha
/// @param	img_blend]
function nine_slice_center() {

	var _thw = argument[3]*0.5;
	var _thh = argument[4]*0.5;
	if(argument_count > 7) {
		nine_slice(argument[0], argument[1]-_thw, argument[2]-_thh, argument[1]+_thw, argument[2]+_thh, argument[5], argument[6], argument[7]);
	} else if(argument_count > 6){
	    nine_slice(argument[0], argument[1]-_thw, argument[2]-_thh, argument[1]+_thw, argument[2]+_thh, argument[5], argument[6]);
	} else if(argument_count > 5 ){
	    nine_slice(argument[0], argument[1]-_thw, argument[2]-_thh, argument[1]+_thw, argument[2]+_thh, argument[5]);
	} else {
	    nine_slice(argument[0], argument[1]-_thw, argument[2]-_thh, argument[1]+_thw, argument[2]+_thh);
	}





}
