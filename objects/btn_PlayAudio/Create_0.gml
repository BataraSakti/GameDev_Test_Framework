event_inherited();
te_y = 0;
if(global.lang == "te"){
	te_y = 10;
}

text = "";
text_xoff = 70;
text_yoff = -10 + te_y;

//force_max = 140;
if (global.lang == "my") {
	force_max = 90;
}
if (global.lang != "my") {
	force_max = 140;
}
doSpeak = false;

dont_wiggle = false;

only_once = true;
did_once = false;
p_time = 1.5;
p_ptime = 0.5;
p_event = 4; //Wiggle
p_angle_start = image_angle;
rot_right = 10;
rot_left = -10;

//Surface draw sprite + text
new_spr = scp_combine_spr_txt(sprite, image_index, b_c, f_c, text, fn_halign, fn_valign, c_red, true);
//set text to not draw twice
text = "";


