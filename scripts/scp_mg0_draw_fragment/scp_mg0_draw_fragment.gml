/// @description scp_mg0_draw_fragment()
/// @function scp_mg0_draw_fragment
function scp_mg0_draw_fragment() {

	nine_slice_center(spr_mgs_score_box, x-405, y-300, 140, 52, 0, image_alpha_3);
	nine_slice_center(spr_mgs_score_box, x+405, y-300, 140, 52, 0, image_alpha_3);

	draw_text_outline_auto(x-398, y-300+te_y, time_text, b_c, f_c, image_xscale, image_yscale, image_alpha_3, 120, 2, true);
	draw_text_outline_auto(x+408, y-300+te_y, round_text, b_c, f_c, image_xscale, image_yscale, image_alpha_3, 120, 2, true);




}
