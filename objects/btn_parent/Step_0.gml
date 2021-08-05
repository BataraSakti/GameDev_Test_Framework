/// @description Workaround for sprite offset getting pushed off

if(follow_parent && _parent != noone && instance_exists(_parent) && read_offset){
	x = _parent.x + offset_x;
	y = _parent.y + offset_y;
	visible = _parent.visible;
}

if(did_explode == false) {
    var c_x = sprite_get_width(sprite_index) * 0.5;
    var c_y = sprite_get_height(sprite_index) * 0.5;
    var s_x = sprite_get_xoffset(sprite_index);
    var s_y = sprite_get_yoffset(sprite_index);
    var _ln_ = "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%";
    
    if(abs(c_x - s_x) > 10) {
        show_debug(string(c_x) + " Sprite offset for button is not centered on X " + string(s_x));
        did_explode = true;
    }
    if(abs(c_y - s_y) > 10) {
        show_debug(string(c_y) + " Sprite offset for button is not centered on Y " + string(s_y));
        did_explode = true;
    }
    
    if(did_explode == true) {
        for(var i = 0; i < 2; i++) {
            show_debug(_ln_);
        }
        
        show_debug(string(id) + " Button exploded trying to fix " + object_get_name(object_index));
    
        for(var i = 0; i < 2; i++) {
            show_debug(_ln_);
        }
        
        //BOOM
        sprite_set_offset(sprite_index, c_x, c_y);
        did_explode = false;
        var s_x = sprite_get_xoffset(sprite_index);
        var s_y = sprite_get_yoffset(sprite_index);   
        
        if(abs(c_x - s_x) > 10) {
            show_debug(string(c_x) + " Sprite offset for button is still not centered on X " + string(s_x));
            did_explode = true;
        }
        if(abs(c_y - s_y) > 10) {
            show_debug(string(c_y) + " Sprite offset for button is still not centered on Y " + string(s_y));
            did_explode = true;
        }
    }
} 

if(did_explode == true) {
    //BOOM
    show_debug(string(id) + " Button exploded " + object_get_name(object_index));
}
