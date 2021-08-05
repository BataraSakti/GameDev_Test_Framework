if(view_current == 1) { 
    //Backs
	
	scp_fade_back(image_alpha*0.65,c_black,1);
	nine_slice_center(spr_back_blue_graduate_small, x, y, 905, 545, 0, image_alpha);
	draw_sprite_ext(spr_sunray_radial,0,x,y, image_xscale*3, image_yscale*3, global.rot, c_white, image_alpha*0.25);
	
	
    draw_sprite_ext(spr_pinata, 0, x, 205.5, image_xscale, image_yscale, 0, c_white, image_alpha);
	draw_sprite_ext(spr_label_congratulation_gold, 0, x, 141.5, image_xscale, image_yscale, 0, c_white, image_alpha);
	if(good_job){
		draw_sprite_ext(spr_label_good_job, 0, x, 410, image_xscale*0.7, image_yscale*0.7, 0, c_white, image_alpha);
	}
    //Level bar stuff
    draw_sprite_ext(spr_meter_fill,0,x-329,y-52, image_xscale*3, image_yscale*0.5, 0, c_white, image_alpha * 0.75);
    draw_sprite_part_ext(spr_meter_fill,2,0,0, bar_width,55,x-324,y-60, image_xscale*image_scale_1, image_yscale*0.4, c_white, image_alpha);

    //draw_set_halign(fa_center);
    //draw_set_valign(fa_middle);
    //draw_set_font(fnt_fat);    
    
    //draw_sprite_ext(spr_sunray_radial,0,x-329,y-20, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha);
    draw_sprite_ext(spr_circle_behind_crown,0,x-329,y-y_crown_set, image_xscale*circle_behind_scale,image_yscale*circle_behind_scale, 0, c_white, image_alpha);
	draw_sprite_ext(spr_crown_level,0,x-329,y-y_crown_set, image_xscale*crown_divider_scale, image_yscale*crown_divider_scale, 0, c_white, image_alpha);
    //draw_text_drop_auto(x-329,y-40, "1", b_c, f_c, image_xscale*0.25, image_xscale*0.25, image_alpha, 64);
    
    if(lvalue >=1 && bar_width >= bar_dest_2) {
        //draw_sprite_ext(spr_sunray_radial,0,x-165,y-20, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha);
    }
    draw_sprite_ext(spr_circle_behind_crown,0,x-199.4,y-y_crown_set, image_xscale*circle_behind_scale,image_yscale*circle_behind_scale, 0, c_white, image_alpha);
	draw_sprite_ext(spr_crown_level,1,x-199.4,y-y_crown_set, image_xscale*crown_divider_scale, image_yscale*crown_divider_scale, 0, c_white, image_alpha);
    if(lvalue >=1 && bar_width >= bar_dest_2) {
        //draw_text_drop_auto(x-165,y-40, "2", b_c, f_c, image_xscale*0.25, image_xscale*0.25, image_alpha, 64);
        if(lsub == 0) { //Don't ding on partial level ups...
            if(did_ding == false && bar_width >= bar_width_end) {
                //Done here because it should only ding when it's done AND it should only ding for 2 - 5.
                did_ding = true;
               
            }
        }
    }
    
    if(lvalue >=2 && bar_width >= bar_dest_3) {
        //draw_sprite_ext(spr_sunray_radial,0,x-0,y-20, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha);
    }
	draw_sprite_ext(spr_circle_behind_crown,1,x-69.8,y-y_crown_set, image_xscale*circle_behind_scale,image_yscale*circle_behind_scale, 0, c_white, image_alpha);
    draw_sprite_ext(spr_crown_level,2,x-69.8,y-y_crown_set, image_xscale*crown_divider_scale, image_yscale*crown_divider_scale, 0, c_white, image_alpha);
    //if(lvalue >=2 && bar_width >= bar_dest_3) {
        //draw_text_drop_auto(x-0,y-40, "3", b_c, f_c, image_xscale*0.25, image_xscale*0.25, image_alpha, 64);
    //}
    
    if(lvalue >=3 && bar_width >= bar_dest_4) {
        //draw_sprite_ext(spr_sunray_radial,0,x+165,y-20, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha);
    }
	draw_sprite_ext(spr_circle_behind_crown,1,x+59.8,y-y_crown_set, image_xscale*circle_behind_scale,image_yscale*circle_behind_scale, 0, c_white, image_alpha);
    draw_sprite_ext(spr_crown_level,3,x+59.8,y-y_crown_set, image_xscale*crown_divider_scale, image_yscale*crown_divider_scale, 0, c_white, image_alpha);
    //if(lvalue >=3 && bar_width >= bar_dest_4) {
        //draw_text_drop_auto(x+165,y-40, "4", b_c, f_c, image_xscale*0.25, image_xscale*0.25, image_alpha, 64);
    //}
    
    if(lvalue >=4 && bar_width >= bar_dest_5) {
        //draw_sprite_ext(spr_sunray_radial,0,x+329,y-20, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha);
    }
    draw_sprite_ext(spr_circle_behind_crown,2,x+189.4,y-y_crown_set, image_xscale*circle_behind_scale,image_yscale*circle_behind_scale, 0, c_white, image_alpha);
	draw_sprite_ext(spr_crown_level,4,x+189.4,y-y_crown_set, image_xscale*crown_divider_scale, image_yscale*crown_divider_scale, 0, c_white, image_alpha);
    //if(lvalue >=4 && bar_width >= bar_dest_5) {
        //draw_text_drop_auto(x+329,y-40, "5", b_c, f_c, image_xscale*0.25, image_xscale*0.25, image_alpha, 64);
    //}
    
	if(lvalue >=5 && bar_width >= bar_dest_6) {
        //draw_sprite_ext(spr_sunray_radial,0,x+329,y-20, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha);
    }
    draw_sprite_ext(spr_circle_behind_crown,2,x+329,y-y_crown_set, image_xscale*circle_behind_scale,image_yscale*circle_behind_scale, 0, c_white, image_alpha);
	draw_sprite_ext(spr_crown_level,5,x+329,y-y_crown_set, image_xscale*crown_divider_scale, image_yscale*crown_divider_scale, 0, c_white, image_alpha);
	
    //draw_set_font(global.font);
    //Top bar
    //draw_sprite_ext(spr_ui_bigRibbon,0,x,y-160, image_xscale, image_yscale, 0, c_white, image_alpha);
    //draw_sprite_ext(spr_ui_starcluster,0,x,y-120, image_xscale, image_yscale, 0, c_white, image_alpha);
    //draw_sprite_ext(text_sprite,0,x,y-200, image_xscale, image_yscale, 0, c_white, image_alpha);
    
	
	
   
	draw_sprite_ext(ui_character_professor, 3, x+player_x, y+115, image_xscale*0.75,image_yscale*0.75,0,c_white,image_alpha);   
	
}

