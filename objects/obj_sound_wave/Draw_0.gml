/// @description Insert description here
// You can write your code in this editor

if(view_current == 1){
	if(image_speed > 0 && image_index == 9){
		image_speed = 0;
	} 
	draw_sprite_ext(sprite_index,image_index,x,y,self_scale,self_scale,0,c_white,image_alpha);
}