if(view_current == 1) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    scp_fade_back(image_alpha_2*0.65,c_black,1);
    var wd = 1014;
    var wh = 674;
	nine_slice_center(sprite_index, x, y, wd, wh);
	if(sprite_exists(backer)) {
	    draw_sprite_ext(backer,-1,x,y-6, image_xscale, image_yscale, 0, c_white, image_alpha);
	}
    
    //Above Back, Below Frame
    switch(display_stage) {
        case 0: {
            //Intro / Tutorial
            nine_slice_center(spr_nineslice,  x, y-20, 654, 480,0,image_alpha_3);
            nine_slice_center(spr_box_red_border,  x, y-255, 325, 72,0,image_alpha_3);
	        
			draw_text_outline_auto(x, y - 260, htp_text, b_c, f_c, 1.15*txt_htp_scale, 1.15*txt_htp_scale, image_alpha_3, 300, 4, false, txt_htp_maxscale);
            
            if(sprite_exists(tut1) && sprite_exists(tut2)) { 
                draw_sprite_ext(tut1,0,x,y-100, image_xscale, image_yscale, 0, c_white, image_alpha_3);
                draw_sprite_ext(tut2,0,x,y+120, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            
            //draw_sprite_ext(spr_sunray_radial,0,x-310,y-140, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha_3);
            //draw_sprite_ext(spr_sunray_radial,0,x-310,y+80, image_xscale*0.45, image_yscale*0.45, global.rot, c_white, image_alpha_3);
            draw_sprite_ext(spr_step1_ico,0,x-310,y-140, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            draw_sprite_ext(spr_step2_ico,0,x-310,y+80, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            break;
        }
        case 1: {
            //Game Type 1 - Select the Leter / Number / Word spoken.           
            //if(sprite_exists(shelf)) {
            //    draw_sprite_ext(shelf,0,x,y+160, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            //}
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+230, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
			//if(IS_DEBUG){
				draw_text(x, 150, target_text_to_speak);
			//}
            scp_mg0_draw_fragment();
            
            break;
        }
        case 2: {
            //Game Type 2 - Select the words in the category.
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+160, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+230, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            
            draw_text_outline_auto(x*0.36,y*0.3, string(c_counter)+"/3", b_c, c_c, image_xscale*1.15, image_yscale*1.15, image_alpha_3, 120, 3, false);
                        
            scp_mg0_draw_fragment();
            
            break;
        }
        case 3: {
            //Game Type 3 - Select the correct word to complete the sentance.
            
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+10, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+100, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+230, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            
            scp_mg0_draw_fragment();
            
            break;
        }
		case 4: {
            //Game Type 4 - For now its the same as Game 3 (27 April 2020)
            
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+10, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+100, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+230, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            
            scp_mg0_draw_fragment();
            
            break;
        }
        case 5: {
            //Game Type 5 - Build a sentance from the provided words
            
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+10, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+100, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            if(sprite_exists(shelf)) {
                draw_sprite_ext(shelf,0,x,y+230, image_xscale, image_yscale, 0, c_white, image_alpha_3);
            }
            
            scp_mg0_draw_fragment();
            
            break;
        }
		case 6:{
			//Game 6 - Match each paragraph to the correct heading in the multiple-choice format.
			break;
		}
        case 7: {
            //Level Up (Next Game type)
            break;
        }
        case 8: {
            //Game Over
            break;
        }
    }
    
    //frame = nine_slice_frame(sprite_index, x, y, wd, wh, 20, frame, image_alpha);
	//if(is_undefined(frame)) {
	//	show_debug("Frame is undefined in MG0!");
	//} else {
	//	if(!sprite_exists(frame)) {
	//		show_debug("Frame sprite does not exist in MG0!");
	//	}
	//}
    
    //Above Frame
    switch(display_stage) {
        case 0: {
            //Intro / Tutorial            
            break;
        }
        case 1: {
            //Game Type 1 - Select the Leter / Number / Word spoken.
            scp_mg0_draw_fragment_front();
            break;
        }
        case 2: {
            //Game Type 2 - Select the words in the category.
            scp_mg0_draw_fragment_front();
            break;
        }
        case 3: {
            //Game Type 3 - Select the correct word to complete the sentance.
            scp_mg0_draw_fragment_front();
            
            nine_slice_center(spr_ui_textbox,x,y+245, 588,156);
            draw_sprite_ext(spr_small_banner,0,x,y+160, image_xscale*1.0, image_yscale*1.0, 0, c_white, image_alpha_3);
            draw_text_outline_auto(x, y+160, text_solve, b_c, f_c, image_xscale, image_yscale, image_alpha_3, 200, 2, true);
            scp_set_font(fnt_normal);
            draw_text_outline_auto(x, y+245, text_blob, c_ltg, c_b, image_xscale, image_yscale, image_alpha_3, 560, 1, true);
            scp_set_font(global.font);
            break;
        }
		case 4: {
            //Game Type 4 - For now its the same as Game 3 (27 April 2020)
            scp_mg0_draw_fragment_front();
            
            nine_slice_center(spr_ui_textbox,x,y+245, 588,156);
            draw_sprite_ext(spr_small_banner,0,x,y+160, image_xscale*1.0, image_yscale*1.0, 0, c_white, image_alpha_3);
            draw_text_outline_auto(x, y+160, text_solve, b_c, f_c, image_xscale, image_yscale, image_alpha_3, 200, 2, true);
            scp_set_font(fnt_normal);
            draw_text_outline_auto(x, y+245, text_blob, c_ltg, c_b, image_xscale*0.6, image_yscale*0.6, image_alpha_3, 560, 1, true, 0.4);
            scp_set_font(global.font);
            break;
        }
        case 5: {
            //Game Type 5 - Build a sentance from the provided words
            scp_mg0_draw_fragment_front();
            break;
        }
		case 6:{
			//Game 6 - Match each paragraph to the correct heading in the multiple-choice format.
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);

			if(draw_question_game6){
				nine_slice_center(spr_question_frame, x, y-80, wd-100, wh-350);
				draw_text_drop_auto(x-445,y-235,text_game6,c_black,c_white,0.8,0.8,1,850);
			}
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			scp_mg0_draw_fragment();
			scp_mg0_draw_fragment_front();
			break;
		}
        case 7: {
            //Level Up (Next Game type)
            break;
        }
        case 8: {
            //Game Over
            break;
        }
    }
    
    //Draw Hand
   // if(draw_hand == 1){
    //    draw_sprite_ext(spr_hand_tap, image_index, hand_x, hand_y, image_xscale*0.9, image_yscale*0.9, 0, c_white, image_alpha_3);
   // }   
}

