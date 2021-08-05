if(is_imploding == true) { exit; }


if(can_return == true) {
    show_debug("Trying to return wordmellow --- " + string(text));
    if(text != "") {
        with(gui_mg_0) {
            //Update the controller that inputs have been reset... 
            inputs = other.display_index;
            if(inputs == 0) {
                input_val = ""; //No inputs...
            } else {
                //Trim the input string by rebuilding it from placed indexs
                show_debug("Current Input String --- " + string(input_val));
                input_val = "";         
                       
                temp_marsh_arr[0] = "";
                
                with(o_marshman) {
                    if(can_return == true) {
                        if(text != "" && display_index < other.inputs) {
                            show_debug(string(display_index) + " Input Value --- " + string(text));
                            other.temp_marsh_arr[display_index] = string(text);
                        } 
                    }
                }
                
                var szz = array_length_1d(temp_marsh_arr);
                
                for(var ii = 0; ii < szz; ii++) {
                    if(input_val == "") {
                        input_val = string(temp_marsh_arr[ii]);
                    } else {
                        input_val = input_val+" "+string(temp_marsh_arr[ii]);
                    }
                }
                temp_marsh_arr = ""; //Cleanup the array
                
                show_debug("Updated Input String --- " + string(input_val));
            }            
        }
        
        var tl = ds_list_create();
        
        with(o_marshman) {
            //Clear any other displays after me.
            if(can_return == true) {
                if(text != "" && display_index > other.display_index) { //Is a display marsh
                    show_debug("Adding follower marshman to cleanup list --- " + string(text));
                    ds_list_add(tl, text);
                    text = "";
                    image_xscale = 0.50;
                    image_yscale = 0.50;
                    p_xscale_start = 0.50;
                    p_yscale_start = 0.50;
                    sprite_index = spr_marshman_outline;
                    y += 15;
                }
            } else {
                //Put me back
                if(text == "" && string(dvalue) == other.text && display_index == other.display_index) {
                    text = other.text;
                    display_only = false;
                    sprite_index = spr_marshman;
                    image_xscale = 1;
                    image_yscale = 1;
                    did_once = false;
                    display_index = -1;
                    do_ring = false;
                    f_c = c_maroon;
                }
            }
        }
        
        var sz = ds_list_size(tl);
        
        for(var i = 0; i < sz; i++) {
            zvalue = ds_list_find_value(tl, i);
            if(!is_undefined(zvalue)) {
                with(o_marshman) {  
                    //Put it back
                    if(can_return == false) {
                        if(text == "" && string(dvalue) == string(other.zvalue)) {
                            show_debug("Trying to return follower wordmellow --- " + string(other.zvalue));
                            text = string(other.zvalue);
                            display_only = false;
                            sprite_index = spr_marshman;
                            image_xscale = 1;
                            image_yscale = 1;
                            p_xscale_start = 1;
                            p_yscale_start = 1;
                            did_once = false;
                            display_index = -1;
                            do_ring = false;
                            f_c = c_maroon;
                        }
                    }
                }
            }
            zvalue = noone; //Make sure this is reset... 
        }
        
        ds_list_destroy_safe(tl);
        
        //Clean me up
        text = "";
        image_xscale = 0.50;
        image_yscale = 0.50;
        p_xscale_start = 0.50;
        p_yscale_start = 0.50;
        sprite_index = spr_marshman_outline;
        y += 15;
    }
} else {
    if(only_once == true) {
        if(did_once == false) {
            did_once = true;
        } else {
            exit;
        }
    }
    
    if(show_ring_on_press == true) {
        do_ring = true;
        f_c = answer_color;
		if(answer_color == good_c){
			//marshman fade out
			TweenFire(id, image_alpha_0__, true, EaseOutQuad, image_alpha_0, 0, 1);
		}
    }
    
    //if(doSpeak == true && global.button_speak == true || forceSpeak == true && doSpeak == true) {
    //    forceVoice(text, global.lang_en_country);
    //} else {
    //    fxPlay(sfx_hit_1, 0, 0); //Error Chime
    //}
    
    if(_parent != noone) {
        with(_parent) {
            event_user(other._parent_event);
        }
    }
    
    if(_target != noone) {
        with(_target) {
            ret_man = other.id;
            ret_value = other.dvalue;
            event_user(other._target_event);
        }
    }
}

