//Create

fn_sz = 0.9;
can_click = 0;
alarm[1] = room_speed/5;
text = "";
press = sprite_index;
sprite = sprite_index;
ui_time = global.g_ui_time;

image_index = 0;

good_c = c_blue;
bad_c = c_red;
b_c = c_orange;
f_c = c_maroon;
px = 3;
fn_valign = fa_middle;
fn_halign = fa_center;
text_yoff = 0;
text_xoff = 0;
force_max = 1000; //Default to not used
doSpeak = true;
forceSpeak = true;
force_eng_tts = false;

a_sch = ScheduleNull();
b_sch = ScheduleNull();

icon = noone;
iconLeft = 1;
iconRight = 1;
action_id = 0;

// Create new tween for "y" property
tween_y = TweenCreate(id, y__, true);
is_imploding = false;

//Hand draw
hand_x = view_wview[1]*0.85+50;
hand_y = view_hview[1]*0.4;
image_speed = 0.15;
draw_hand = false;

tween_mode = 0;
p_tween_x_scale = TweenNull();
p_tween_y_scale = TweenNull();
surface_sprite = 1;

_target = noone;
_target_event = 0;
action_id = noone;

_parent = noone;
_parent_event = 0;


//Pulse Effect
already_nuked = 0;
do_pulse = 1;
p_sched = ScheduleNull();

p_event = 3; 
p_time = 2 + irandom_range(0,3);
p_range = 0.075;
p_ptime = 0.2;

//Press Effect - Set start == dest to disable an effect
p_effect_tween_type_scale = EaseInOutSine;
p_effect_tween_type_alpha = EaseInSine;

p_tween_x_scale = TweenCreate(id, image_xscale__, true, EaseLinear, image_xscale, image_xscale+p_range,p_ptime);
p_tween_x_scale = TweenCreate(id, image_yscale__, true, EaseLinear, image_yscale, image_yscale+p_range,p_ptime);

text = "1";
text_xoff = 0;
text_yoff = -128;
force_max = 160;
doSpeak = false;
marsh_xoff = 0;
marsh_yoff = 65;

only_text = false;
_nine_slice = false;
ns_width = 403;
ns_height = 81;
txt_width = 0;

marshman_index = irandom_range(0, sprite_get_number(sprite_index));

dvalue = noone; 
zvalue = noone;
danswer = " ";
display_only = false;
display_index = -1;
can_return = false;

//Press Effect - Set start == dest to disable an effect
p_alpha_start = 1;
p_xscale_start = image_xscale;
p_yscale_start = image_yscale;
p_alpha_dest = 1;
p_xscale_dest = image_xscale*0.75;
p_yscale_dest = image_yscale*0.75;
p_effect_time = 0.2;
//Lock Delay - prevents repushes for set time
p_lock_delay = p_effect_time * 0.5;

//Pulse
p_time = 3;

if(p_sched == ScheduleNull() && do_pulse == 1) {
    p_sched = ScheduleEventUser(id, true, p_time, p_event);
}

//Ring
do_ring = false;
ring_color = c_white;
answer_color = c_white;
alarm[2] = 3;
show_ring_on_press = true;

only_once = true;
did_once = false;

//Work around for sprite offset getting pushed off
did_explode = false;
was_pressed = false;

//Spawn in effect... 
if(y < 0) {
    // Have object fall from top to postion in 2 seconds
    TweenPlayOnce(tween_y, DampEaseOutBounce, y, -y, 2);
} else {
    image_alpha = 0;
    //image_xscale = 0;
    //image_yscale = 0;
	image_alpha_0 = 0;
    TweenFire(id, image_alpha__, true, EaseInQuad, 0, 1, 0.35);
    TweenFire(id, image_alpha_0__, true, EaseInQuad, 0, 1, 0.35);
	//TweenFire(id, image_xscale__, true, EaseInQuad, 0, image_xscale, 0.35);
    //TweenFire(id, image_yscale__, true, EaseInQuad, 0, image_yscale, 0.35);
}

hide_key = true;
ignore_click_arr = [];

//Not sure why marshmen don't fully inherit create event...  DOC-4787
press_start_time = 0;
press_pressed_time = 0;

follow_parent = false;
offset_x = 0;
offset_y = 0;
read_offset = false;

onpress_only = false;



