/// @description  TweenResume(tween)
/// @function  TweenResume
/// @param tween
function TweenResume(argument0) {

	if (argument0)
	{
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
    
		if (is_array(_t)){
		    if (_t[TWEEN.STATE] == TWEEN_STATE.PAUSED)
		    {
		        _t[@ TWEEN.STATE] = _t[TWEEN.TARGET];
		        TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.RESUME);
		    }
		}
	}



}
