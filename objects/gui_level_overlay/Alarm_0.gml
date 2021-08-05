switch(dvalue) {
    case 0: {
        bar_width = 1;
        break;
    }
    case 1: {
        bar_width = 162;
        break;
    }
    case 2: {
        bar_width = 324;
        break;
    }
    case 3: {
        bar_width = 486;
        break;
    }
    case 4: {
        bar_width = 648;
        break;
    }
}

show_debug(string(dvalue) + " Level Progress Bar width = " + string(bar_width));

TweenFire(id, image_alpha__, true, EaseLinear, 0, 1, effect_time);

