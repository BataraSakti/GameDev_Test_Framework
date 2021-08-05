/// @description  TweenDelaySetTime(delay,time)
/// @function  TweenDelaySetTime
/// @param delay
/// @param time
function TweenDelaySetTime(argument0, argument1) {

	if (argument0)
	{
	    var _delay = global.TGMS_MAP_DELAY[1][? argument0];
	    var _tween = _delay[TWEEN_DELAY.TWEEN];
    
	    if (_tween[TWEEN.TARGET] != noone)
	    {
	        _delay[@ TWEEN_DELAY.DELAY] = argument1;
	    }
	}



}
