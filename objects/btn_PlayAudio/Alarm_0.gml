
if(instance_number(gui_yes_text_top)>0){exit;}
with(gui_mg_0){
    draw_hand = 0;
    if(display_stage == 2){
        c_counter = 0;
    }
    tock = true;
    test_timer_tock = true;
}
if(only_once == true) {
    if(did_once == false) {
        did_once = true;
    } else {
        exit;
    }
}

event_inherited();

