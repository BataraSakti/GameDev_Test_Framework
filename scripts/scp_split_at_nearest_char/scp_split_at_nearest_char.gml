/// @description scp_split_at_nearest_char(string [, desired_len, max_search, character_to_split_near, hard_break_char])
/// @function scp_split_at_nearest_char
/// @param string [
/// @param  desired_len
/// @param  max_search
/// @param  character_to_split_near
/// @param  hard_break_char]
function scp_split_at_nearest_char() {
	var arg_l = argument_count;

	if(arg_l >=1) {
	    var t_str = argument[0];
	    var t_len = 48;
	    var t_max = 8;
	    var t_split_char = " ";
	    var t_break_char = "-\n";
    
	    if(arg_l >= 2) {
	        t_len = argument[1];
	    }
    
	    if(arg_l >= 3) {
	        t_max = argument[2];
	    }
    
	    if(arg_l >= 4) {
	        t_split_char = argument[3];
	    }
    
	    if(arg_l >= 5) {
	        t_break_char = argument[4];
	    }
    
	    var t_slen = string_length(t_str);
    
	    if(t_slen > t_len) {
	        var list_rep = ds_list_create();
	        var list_brek = ds_list_create();
	        var t_cur_index = 0;
	        var t_index_delta = t_slen - t_cur_index;
	        var has_force_breaks = false;
        
	        if(string_pos("&&&", t_str)) {
	            has_force_breaks = true;
	        }
    
	        while(t_index_delta > t_len) {
	            var ppp = string_pos("\n", string_copy(t_str,1+t_cur_index, t_slen-t_cur_index));
            
	            if(ppp > 0 && ppp <= t_len) {
	                //Forced Break IN THIS SEGMENT.
	                //t_str = string_replace(t_str,"&&&","\n");
	                //show_debug_message("Force Break - sub pos --- " + string(ppp));
	                t_cur_index = t_cur_index+ppp+1;
	                //show_debug_message("Force Break at - pos --- " + string(t_cur_index));
	                //t_slen = string_length(t_str);
	                t_index_delta = t_slen - t_cur_index;
	            } else {            
	                if(t_cur_index == 0) { t_cur_index = t_len; } else { t_cur_index += t_len; }
                
	                //Find nearest space to desired len
	                var c_at_len = string_char_at(t_str, t_cur_index);
	                if(c_at_len == t_split_char) {
	                    //Mark this char for replacement.
	                    ds_list_add(list_rep, t_cur_index);
	                } else {
	                    //That wasn't a match - find the nearest match to replace.
	                    var f_not_found = true;
	                    var b_not_found = true;
	                    var f_index = 1;
	                    var b_index = 1;
	                    //var f_max = t_cur_index + t_max;
	                    //var f_min = t_cur_index - t_max;
                    
	                    //Magic....
	                    for(var i = 0; i < t_max; i++) {
	                        var b_char = string_char_at(t_str, t_cur_index-b_index);
	                        var f_char = string_char_at(t_str, t_cur_index+f_index);
                        
	                        if(b_char == t_split_char) { b_not_found = false; }
	                        if(f_char == t_split_char) { f_not_found = false; }
                        
	                        if(b_not_found == true) { b_index++; }
	                        if(f_not_found == true) { f_index++; }
	                    }
                    
	                    if(f_not_found == true && b_not_found == true) {
	                        //Hard Break
	                        ds_list_add(list_brek, t_cur_index);
	                    } else {
	                        //Use the smaller and insert break... 
	                        if(f_index < b_index) {
	                            t_cur_index += f_index;
	                        } else if(f_index > b_index) {
	                            t_cur_index -= b_index;
	                        } else {
	                            //If equal use back
	                            t_cur_index -= b_index;
	                        }
    
	                        ds_list_add(list_rep, t_cur_index);
	                    }
	                }
                
	                //Update index offset
	                t_index_delta = t_slen - t_cur_index;
	            }
	        }
	        //Proccess lists of splits and breaks to make...
	        var sz = ds_list_size(list_rep);
	        for(var i = 0; i < sz; i++) {
	            var tt = ds_list_find_value(list_rep, i);
	            t_str = string_insert("\n", t_str, tt);
	            t_str = string_delete(t_str, tt+1, 1);
	        }
        
	        sz = ds_list_size(list_brek);
	        for(var i = 0; i < sz; i++) {
	            var tt = ds_list_find_value(list_brek, i);
	            t_str = string_insert(t_break_char, t_str, tt);
	            t_str = string_delete(t_str, tt+2, 1);
	        }
        
	        //Clean up
	        ds_list_destroy_safe(list_brek);
	        ds_list_destroy_safe(list_rep);
        
	        return t_str;
	    } else {
	        //Not long enough to split
	        return t_str;
	    }   
	} else {
	    return "Error - Can't Split Input - not enough Args";
	}



}
