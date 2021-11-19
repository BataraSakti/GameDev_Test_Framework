draw_set_halign(fa_center);
draw_set_valign(fa_middle);
    
scp_fade_back(0.65,c_black,1);
var wd = 1014;
var wh = 674;
nine_slice_center(sprite_index, x, y, wd, wh);
if(sprite_exists(backer)) {
	draw_sprite_ext(backer,-1,x,y-6, image_xscale, image_yscale, 0, c_white, image_alpha);
}

if (ui_state != 0){
	nine_slice_center(spr_mgs_score_box, x-405, y-300, 140, 52, 0, image_alpha);
	nine_slice_center(spr_mgs_score_box, x+405, y-300, 140, 52, 0, image_alpha);

	draw_text_outline_auto(x-398, y-300, string(timer)+"s", c_black, c_white, image_xscale, image_yscale, image_alpha, 120, 2, true);
	draw_text_outline_auto(x+408, y-300, string(clamp(round_number, 1, total_round))+"/"+string(total_round), c_black, c_white, image_xscale, image_yscale, image_alpha, 120, 2, true);
}


if (ui_state == 0){
	//Intro / Tutorial
    nine_slice_center(spr_nineslice,  x, y-20, 654, 480,0,1);
    nine_slice_center(spr_box_red_border,  x, y-255, 325, 72,0,1);
	        
	draw_text_outline_auto(x, y - 260, htp_text, c_black, c_white, 1.15, 1.15, 1, 300, 4, false);
            
    if(sprite_exists(tut1) && sprite_exists(tut2)) { 
        draw_sprite_ext(tut1,0,x,y-100, image_xscale, image_yscale, 0, c_white, 1);
        draw_sprite_ext(tut2,0,x,y+120, image_xscale, image_yscale, 0, c_white, 1);
    }
            
    draw_sprite_ext(spr_step1_ico,0,x-310,y-140, image_xscale, image_yscale, 0, c_white, 1);
    draw_sprite_ext(spr_step2_ico,0,x-310,y+80, image_xscale, image_yscale, 0, c_white, 1);
} else if (ui_state == 1){
	//Round instruction
	 if(sprite_exists(shelf)) {
	     draw_sprite_ext(shelf,0,x,y+230, image_xscale, image_yscale, 0, c_white, image_alpha);
	}
	draw_text(x, 150, instruction_text);
		
} else if (ui_state == 2){
	if (current_game_type == 2){
		draw_text(x, 150, instruction_text);
	}
	if (current_game_type == 2){
		 if(sprite_exists(shelf)) {
            draw_sprite_ext(shelf,0,x,y+160, image_xscale, image_yscale, 0, c_white, image_alpha);
        }
	}
	
	if (current_game_type == 3 || current_game_type == 4 || current_game_type == 5){
		
		if(sprite_exists(shelf)) {
            draw_sprite_ext(shelf,0,x,y+10, image_xscale, image_yscale, 0, c_white, image_alpha);
        }
        if(sprite_exists(shelf)) {
            draw_sprite_ext(shelf,0,x,y+100, image_xscale, image_yscale, 0, c_white, image_alpha);
        }
		if(sprite_exists(shelf)) {
			draw_sprite_ext(shelf,0,x,y+230, image_xscale, image_yscale, 0, c_white, image_alpha);
		}
		
		nine_slice_center(spr_ui_textbox,x,y-290, 591,81);
		draw_sprite_ext(spr_ui_emoteface,0,x-303,y-320, image_xscale, image_yscale, 0, c_white, image_alpha);
		draw_text_outline_auto(x, y-290, instruction_text, c_ltgray, c_black, image_xscale*1.2, image_yscale*1.2, image_alpha, 490, 1, true);
		draw_sprite_ext(spr_mgs_clock,0,x-485,y-305, image_xscale*1.0, image_yscale*1.0, 0, c_white, image_alpha);
	
		if (current_game_type != 5){
			nine_slice_center(spr_ui_textbox,x,y+245, 588,156);
		    draw_sprite_ext(spr_small_banner,0,x,y+160, image_xscale*1.0, image_yscale*1.0, 0, c_white, image_alpha);
		    draw_text_outline_auto(x, y+160, text_solve, c_black, c_white, image_xscale, image_yscale, image_alpha, 200, 2, true);
		    scp_set_font(fnt_normal);
		    draw_text_outline_auto(x, y+245, text_blob, c_ltgray, c_black, image_xscale, image_yscale, image_alpha, 560, 1, true);
		    scp_set_font(global.font);
		}
	
	} else if (current_game_type == 6){
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);

		nine_slice_center(spr_question_frame, x, y-80, wd-100, wh-350);
		draw_text_drop_auto(x-445,y-235,text_game6,c_black,c_white,0.8,0.8,1,850);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
			
		nine_slice_center(spr_ui_textbox,x,y-290, 591,81);
		draw_sprite_ext(spr_ui_emoteface,0,x-303,y-320, image_xscale, image_yscale, 0, c_white, image_alpha);
		draw_text_outline_auto(x, y-290, instruction_text, c_ltgray, c_black, image_xscale*1.2, image_yscale*1.2, image_alpha, 490, 1, true);
		draw_sprite_ext(spr_mgs_clock,0,x-485,y-305, image_xscale*1.0, image_yscale*1.0, 0, c_white, image_alpha);
	
	}
	
	if(sprite_exists(shelf) && current_game_type != 3 && current_game_type != 4 && current_game_type != 5) {
	    draw_sprite_ext(shelf,0,x,y+230, image_xscale, image_yscale, 0, c_white, image_alpha);
	}
}