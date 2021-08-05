/// @description draw_text_outline(x,y,string,back_color,front_color,xscale,yscale,alpha,stroke_px)
/// @function draw_text_outline
/// @param x
/// @param y
/// @param string
/// @param back_color
/// @param front_color
/// @param xscale
/// @param yscale
/// @param alpha
/// @param stroke_px
function draw_text_outline(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
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
	arg 8 = stroke_px
	*/

	var dtd_sc = argument8;
	var _st = string(argument2);
	if(dtd_sc) {
	    if(dtd_sc > 2) {  
	        var _ca = 0.125*argument7; //Make outermost soft cus it's BIG.
	    } else {
	        var _ca = argument7;
	    }
    
	    //Slightly faster this way
	    var arg0plus,arg0minu,arg1plus,arg1minu;
   
	    //Back layers    
	    arg0plus = argument0 + dtd_sc;
	    arg0minu = argument0 - dtd_sc;
	    arg1plus = argument1 + dtd_sc;
	    arg1minu = argument1 - dtd_sc;
	    draw_text_transformed_color(arg0plus, argument1,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	    draw_text_transformed_color(arg0plus, arg1plus,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	    draw_text_transformed_color(argument0, arg1plus,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	    draw_text_transformed_color(arg0minu, arg1plus,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	    draw_text_transformed_color(arg0minu, argument1,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	    draw_text_transformed_color(arg0minu, arg1minu,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	    draw_text_transformed_color(argument0, arg1minu,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	    draw_text_transformed_color(arg0plus, arg1minu,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
    
	    if(dtd_sc > 1) {
	        dtd_sc -= 1;
	        _ca = argument7;
	        for(var i = 1; i < dtd_sc; i++) {   
	            arg0plus = argument0 + dtd_sc;
	            arg0minu = argument0 - dtd_sc;
	            arg1plus = argument1 + dtd_sc;
	            arg1minu = argument1 - dtd_sc;
	            draw_text_transformed_color(arg0plus, argument1,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	            draw_text_transformed_color(arg0plus, arg1plus,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	            draw_text_transformed_color(argument0, arg1plus,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	            draw_text_transformed_color(arg0minu, arg1plus,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	            draw_text_transformed_color(arg0minu, argument1,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	            draw_text_transformed_color(arg0minu, arg1minu,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	            draw_text_transformed_color(argument0, arg1minu,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	            draw_text_transformed_color(arg0plus, arg1minu,(_st),argument5,argument6,image_angle,argument3,argument3,argument3,argument3,_ca);
	            dtd_sc -= 1;
	        }
	    }
    
	}  

	//Front
	draw_text_transformed_color(argument0, argument1,(_st),argument5,argument6,image_angle,argument4,argument4,argument4,argument4,argument7);





}
