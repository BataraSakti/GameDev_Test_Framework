/// @description draw_text_drop(x,y,string,back_color,front_color,xscale,yscale,alpha)
/// @function draw_text_drop
/// @param x
/// @param y
/// @param string
/// @param back_color
/// @param front_color
/// @param xscale
/// @param yscale
/// @param alpha
function draw_text_drop(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	/*
	This is drop in compatible with GMS draw_text_color
	It is missing the blend features as they aren't important to me in this instance

	arg 0 = x
	arg 1 = y
	arg 2 = string
	arg 3 = color (back)
	arg 4 = color (front)
	arg 5 = xscale
	arg 6 = yscale
	arg 7 = alpha
	*/
	var dtd_sc = 1;

	dtd_sc *= (argument5 + argument6)/2; //Average of the scale factor times the shadow offset
	dtd_sc = max(1,dtd_sc);

	draw_text_transformed_color(argument0 + dtd_sc, argument1 + dtd_sc,(string(argument2)),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,argument7);
	draw_text_transformed_color(argument0, argument1,(string(argument2)),argument5,argument6,image_angle,argument4,argument4,argument4,argument4,argument7);


}
