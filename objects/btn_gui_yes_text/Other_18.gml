/// @description create surface with text
image_xscale=1;
image_yscale=1;
if(text!=""){
	if(global.fontset == 1){
		scp_set_font(global.font);
	}
	draw_set_halign(fn_halign);
    draw_set_valign(fn_valign);
	if(button_right_side){
		var spr_btn_red_width=sprite_get_width(spr_btn_bar_red)*0.75;
		var spr_btn_red_height=sprite_get_height(spr_btn_bar_red)*0.8;
		var surface_width=spr_btn_red_width+sprite_get_width(btn_large_YES)*0.45;
		var button_surface=surface_create(surface_width,spr_btn_red_height);
	
		surface_set_target(button_surface);
	
		draw_clear_alpha(c_white,0);
		draw_sprite_ext(spr_btn_bar_red,0,surface_width/2,spr_btn_red_height/2,0.75,0.45,0,c_white,1);
		draw_text_outline_auto(spr_btn_red_width/2,spr_btn_red_height/2,text, c_black, c_white, 0.75*text_scale_x, 0.75*text_scale_y,1,spr_btn_red_width-10,2,false);
		draw_sprite_ext(btn_large_YES,0,surface_width/2+90,spr_btn_red_height/2,0.9,0.9,0,c_white,1);
	
		button_sprite_=sprite_create_from_surface(button_surface,0,0,surface_width,surface_get_height(button_surface),false,false,0,0);
		var x_off_set=75+(sprite_get_width(btn_large_YES)/2)*0.9;
		x-=x_off_set;
		sprite_index=button_sprite_;
	
		surface_reset_target();
		scp_free_surface(button_surface);
		
	}else{
		draw_set_valign(fa_middle);
		var spr_btn_red_width=sprite_get_width(spr_btn_bar_red)*0.75;
		var spr_btn_red_height=sprite_get_height(spr_btn_bar_red)*0.8;
		var surface_width=spr_btn_red_width+sprite_get_width(btn_large_YES)*0.45;
		var button_surface=surface_create(surface_width,spr_btn_red_height);
	
		surface_set_target(button_surface);
	
		draw_clear_alpha(c_white,0);
		draw_sprite_ext(spr_btn_bar_red,0,10+surface_width/2,spr_btn_red_height/2,0.75,0.45,0,c_white,1);
		draw_text_outline_auto(the_x+spr_btn_red_width/2,the_y+spr_btn_red_height/2,text, c_black, c_white, 0.75*text_scale_x, 0.75*text_scale_y,1,spr_btn_red_width-10,2,false);
		draw_sprite_ext(btn_large_YES,0,surface_width/2-90,spr_btn_red_height/2,0.9,0.9,0,c_white,1);
	
		button_sprite_=sprite_create_from_surface(button_surface,0,0,surface_width,surface_get_height(button_surface),false,false,0,0);
		var x_off_set=90+(sprite_get_width(btn_large_YES)/2);
		x+=x_off_set;
		sprite_index=button_sprite_;
		x+=x_off_set;
		surface_reset_target();
		scp_free_surface(button_surface);
			
	}
}