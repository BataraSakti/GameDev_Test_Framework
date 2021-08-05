if(view_current == 1) {   
    scp_fade_back(image_alpha*0.65,c_black,1);
    draw_sprite_ext(spr_sunray_radial,0,x,y-160, image_xscale*2, image_yscale*2, global.rot, c_white, image_alpha*0.75);
        
    draw_sprite_ext(spr_ui_bar_back,0,x-329,y-42, image_xscale, image_yscale*0.27, 0, c_white, image_alpha);
    draw_sprite_part_ext(spr_ui_bar_front,0,0,0, bar_width,55,x-324,y-40, image_xscale, image_yscale*0.25, c_white, image_alpha);

    draw_sprite_ext(spr_sunray_radial,0,x-329,y-40, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha);
    draw_sprite_ext(spr_ui_reward_stars,0,x-329,y-40, image_xscale*0.4, image_yscale*0.4, 0, c_white, image_alpha);
    
    if(dvalue >=1) {
        draw_sprite_ext(spr_sunray_radial,0,x-165,y-40, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha);
    }
    draw_sprite_ext(spr_ui_reward_stars,0,x-165,y-40, image_xscale*0.4, image_yscale*0.4, 0, c_white, image_alpha);
    
    if(dvalue >=2) {
        draw_sprite_ext(spr_sunray_radial,0,x-0,y-40, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha);
    }
    draw_sprite_ext(spr_ui_reward_stars,0,x-0,y-40, image_xscale*0.4, image_yscale*0.4, 0, c_white, image_alpha);
    
    if(dvalue >=3) {
        draw_sprite_ext(spr_sunray_radial,0,x+165,y-40, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha);
    }
    draw_sprite_ext(spr_ui_reward_stars,0,x+165,y-40, image_xscale*0.4, image_yscale*0.4, 0, c_white, image_alpha);
    
    if(dvalue >=4) {
        draw_sprite_ext(spr_sunray_radial,0,x+329,y-40, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha);
    }
    draw_sprite_ext(spr_ui_reward_stars,0,x+329,y-40, image_xscale*0.4, image_yscale*0.4, 0, c_white, image_alpha); 
    
    draw_sprite_ext(spr_ui_bigRibbon,0,x,y-160, image_xscale, image_yscale, 0, c_white, image_alpha);
    draw_sprite_ext(spr_txt_LVProgress,0,x,y-175, image_xscale, image_yscale, 0, c_white, image_alpha);
    
    draw_sprite_ext(ui_otherCharacter, image_index, x+player_x, y+30, image_xscale,image_yscale,0,c_white,image_alpha);   
}

