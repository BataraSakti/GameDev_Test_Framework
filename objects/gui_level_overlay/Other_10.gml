if(isExploding == false) {
    isExploding = true;
    TweenFire(id, image_alpha__, true, EaseLinear, 1, 0, effect_time);
    TweenFire(id,player_x__,true, EaseOutSine, player_x, -880, effect_time);
    ScheduleScript(id, true, effect_time + 0.05, destroy_instance, id);
}

