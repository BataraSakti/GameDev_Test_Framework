/// @description Insert description here
// You can write your code in this editor
//TweenFire(id, y1__, true, EaseLinear, y, y+50, 1.5);
TweenFireLoop(id, y1__, true, EaseLinear, y, y+100, 0.8);
TweenFireLoop(id, image_alpha_1__, true, EaseLinear, 0, 1, 0.5);
ScheduleScript(id, true, 2.2, destroy_instance, id);