/// @description Setup

can_click = 0;
alarm[1] = room_speed/5;
text = "";
press = sprite_index;
sprite = sprite_index;

image_speed = 0;
image_index = 0;
ui_time = global.g_ui_time;

anti_ignore_click_arr = false;

flat = false;

b_c = c_black;
f_c = c_white;
fn_valign = fa_middle;
fn_halign = fa_center;
m_draw_font = global.font;
text_yoff = 0;
text_xoff = 0;
icon_xoff = 0;
icon_yoff = 0;
force_max = 1000; //Default to not used
doSpeak = true;
forceSpeak = false;
draw_spr = true;
draw_texts = true;

a_sch = ScheduleNull();
b_sch = ScheduleNull();

icon = noone;
iconLeft = 1;
iconRight = 1;
iconCenter = 0;
icon_xscale = 1;
icon_yscale = 1;

base_xscale = 1;
base_yscale = 1;

use_fnt_normal = false;

//Sprite from surface

// Create new tween for "y" property
tween_y = TweenCreate(id, y__, true);

is_imploding = false;

_target = noone;
_target_event = 0;
action_id = noone;

_parent = noone;
_parent_event = 0;

force_eng_tts = false;

//Sunray
do_sunray = 0;

//Pulse Effect
already_nuked = 0;
do_pulse = 1;
p_sched = ScheduleNull();

p_event = 3; 
p_time = 5;
p_range = 0.075;
p_ptime = 0.2;

special_enable = false;

//Press Effect - Set start == dest to disable an effect
p_alpha_start = 1;
p_xscale_start = 1;
p_yscale_start = 1;
p_alpha_dest = 1;
p_xscale_dest = 0.5;
p_yscale_dest = 0.5;
p_effect_time = 0.2;
p_effect_tween_type_scale = EaseInOutSine;
p_effect_tween_type_alpha = EaseInSine;
//Wiggle
w_angle_start = image_angle;
w_time = 0.1; //Interval between tween
w_animate_spd = 0.5;//Animate speed
rot_right = 10;
rot_left = -10;
//Bounce Effect 
b_animate_up_spd = 0.67;
b_animate_drop_spd = 1;
p_y_start = y-30;
p_y_end = y+5;
range_up = -10;
speed_up = 0.4;

//Shake Effect
s_animate_spd = 0.15;//Shake speed
p_x_start = x;
p_x_right = x+30;
p_x_left = x-30;
//Lock Delay - prevents repushes for set time
p_lock_delay = p_effect_time * 0.5;

oscp_range_nerf = 30; //How much space from edge of sprite to end of text

if(y >= 0) {
    //For default pop in effect
    image_alpha = 0;
    image_xscale = 0;
    image_yscale = 0;
}

p_tween_x_scale = TweenCreate(id, image_xscale__, true);
p_tween_y_scale = TweenCreate(id, image_yscale__, true);
tween_mode = 0;//0 pulse // 1 wiggle // 2 bounce // 3 shake // 4 bounce sml
do_loop = 1;
cr_mode = 0; // 0 fade, // 1 pop // 2 slide-left // 3 slide-right // 4 slide up

//Outline control
out_line_px = 2;
soft_outline = true;

p_xscale_spin_base = 1.0;
p_yscale_spin_base = 1.0;
max_text_scale = 1.0;

//Effect Times
spawn_effect_time_alpha = 0.1;
spawn_effect_time_scale = 0.1;
spawn_effect_time_bounce = 0.1;
spawn_effect_time_slide = 0.35;
spawn_effect_time_fall = 1.0;

use_nineslice = false;
width = 0;
height = 0;

onpress_only = false;

//Finish Create 1 step later for create time configs to be accounted for. 
alarm[11] = 1;

surface_sprite = -1;

//Work around for sprite offset getting pushed off
did_explode = false;

was_pressed = false;

hide_key = true;

// text scale control
scale_text = 0.4;

// FILTER ButtonText
//Slightly more efficent this way .. but really shouldn't be doing this for every button create.  
var _t_play = "play";
var _t_reg = "register";
var _t_add = "add new";
var _t_cancel = "cancel";
var _t_mg7fin = "mg7_finish";

if (text == _t_play){ scale_text = 0.85;}
if (text == _t_reg){ scale_text = 0.6;}
if (text == _t_add){ scale_text = 0.6;}	//Login
if (text == _t_cancel){ scale_text = 0.8;}
if (text == _t_mg7fin){ scale_text = 2;}//Finish
			

mouse_enter_x_scale = 0.075;

ignore_click_arr = [];

press_start_time = 0;
press_pressed_time = 0;

follow_parent = false;
offset_x = 0;
offset_y = 0;
read_offset = false;
can_collide = true;
