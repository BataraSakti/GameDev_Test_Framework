/// @description Insert description here
// You can write your code in this editor
if(view_current == 1){ 
	draw_set_halign(fa_center);
	draw_text_outline_auto(x-20, y-70, "swipe", c_black, c_white, 1, 1, image_alpha_1, 200, 2, 0);
	draw_sprite_ext(spr_hand_tap, 1, x, y1, image_xscale*0.9, image_yscale*0.9, rotat, c_white, image_alpha);
}