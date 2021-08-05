/// @description draw_text_outline_auto(x,y,string,back_color,front_color,xscale,yscale,alpha,max_width,stroke_px,use_glow[, min_scale])
/// @function draw_text_outline_auto
/// @param x
/// @param y
/// @param string
/// @param back_color
/// @param front_color
/// @param xscale
/// @param yscale
/// @param alpha
/// @param max_width
/// @param stroke_px
/// @param use_glow
/// @param [min_scale]
function draw_text_outline_auto() {
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
	arg 8 = max width
	arg 9 = stroke_px
	arg 10 = use_glow
	arg 11 = min scale
	*/

	//Colors
	//EX - "&amp;fc;&amp;c_lime;&amp;bc;&amp;c_orange;Blah Blah Blah this is Lime text with orange dropshadow." 

	var t_fc = argument[4];
	var t_bc = argument[3];
	var t_txt = string(argument[2]);

	/*
	//Colors
	var c_sz = global.g_colors_count;
	var c_fkey = "&amp;fc;"
	var c_bkey = "&amp;bc;"

	if(string_pos(c_fkey, t_txt)) {
	    //Has Front Color
	    for(var i = 0; i < c_sz; i++) {
	        if(string_pos(c_fkey+global.g_color_keys[i], t_txt)) {
	            t_txt = string_replace(t_txt, c_fkey+global.g_color_keys[i], "");
	            t_fc = global.g_colors[i];
	            //show_debug(string(i) + " Front Color Set - " + string(t_fc));
	            i = c_sz; //Force Break
	        }
	    }
	}

	if(string_pos(c_bkey, t_txt)) {
	    //Has Back Color    
	    for(var i = 0; i < c_sz; i++) {
	        if(string_pos(c_bkey+global.g_color_keys[i], t_txt)) {
	            t_txt = string_replace(t_txt, c_bkey+global.g_color_keys[i], "");
	            t_bc = global.g_colors[i];
	            //show_debug(string(i) + " Back Color Set - " + string(t_bc));
	            i = c_sz; //Force Break
	        }
	    }
	}
	*/

	//Scale it
	var dtd_xscale = argument[5];
	var dtd_yscale = argument[6];
	var min_scale = 0.35;
	if(argument_count > 11) {
		min_scale = argument[11];	
	}
	var dtd_width = 0;
	//Check for substrings and find the longest to use for width measureing
	var t_cc = string_count("\n",t_txt);
	if(t_cc > 0) {
	    //show_debug("Found String Sections --- " + string(t_cc));
	    var t_sp = scp_split_string(t_txt, "\n");
	    var t_ll = array_length_1d(t_sp);
	    var t_cur = 0;
    
	    for(var i = 0; i < t_ll; i++) {
	        t_cur = string_width((t_sp[i]));
	        //show_debug("Check String Section --- " + string(t_cur));
	        if(dtd_width < t_cur) {
	            dtd_width = t_cur;
	        }
	    }
    
	    //show_debug("Found Longest String Section --- " + string(dtd_width));
	} else {
	    dtd_width = string_width((t_txt));
	}

	if(dtd_width * dtd_xscale > argument[8]) {
	    var dtd_var = argument[8] / dtd_width;
	    dtd_xscale = dtd_var;
	    dtd_yscale = dtd_var;
	}

	if(argument[10] == true) {
	    draw_text_outline_glow(argument[0], argument[1], t_txt, t_bc, t_fc, max(dtd_xscale, min_scale), max(dtd_yscale, min_scale), argument[7], argument[9]);
	} else {
	    draw_text_outline(argument[0], argument[1], t_txt, t_bc, t_fc, max(dtd_xscale, min_scale), max(dtd_yscale, min_scale), argument[7], argument[9]);
	}

	return clamp(dtd_width, 1, argument[8]);




}
