/// @description scp_mg0_draw_fragment_front()
/// @function scp_mg0_draw_fragment_front
function scp_mg0_draw_fragment_front() {
	nine_slice_center(spr_ui_textbox,x,y-290, 591,81);
	draw_sprite_ext(spr_ui_emoteface,0,x-303,y-320, image_xscale, image_yscale, 0, c_white, image_alpha_3);
	draw_text_outline_auto(x, y-290, top_text, c_ltg, c_b, image_xscale*1.2, image_yscale*1.2, image_alpha_3, 490, 1, true);
	draw_sprite_ext(spr_mgs_clock,0,x-485,y-305, image_xscale*1.0, image_yscale*1.0, 0, c_white, image_alpha_3);



}
