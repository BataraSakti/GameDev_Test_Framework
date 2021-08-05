image_alpha = 0;

text_sprite = spr_txt_perfect;
dvalue = 1;
bar_width = -329;

alarm[0] = 1; //Update next step

isExploding = false;
effect_time = 0.35;

player_x_dest = -460;
player_x = -880;

TweenFire(id,player_x__,true, EaseOutSine, player_x, player_x_dest, effect_time);

