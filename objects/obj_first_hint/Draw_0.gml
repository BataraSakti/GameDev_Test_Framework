/// @description Insert description here
// You can write your code in this editor

if(view_current == 1){
	nine_slice(spr_hud_window1,x-230,y-165,x+230,y+125);
	draw_sprite_ext(spr_volume,0,x,y+50,1,1,0,c_white,image_alpha);
	//if(image_speed > 0 && image_index /== 9){
	//	image_speed = 0;
	//} 
	draw_self();
}