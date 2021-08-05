/// @description  TweenStop(tween)
/// @function  TweenStop
/// @param tween
function TweenStop(argument0) {

	if (argument0)
	{
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
	    if (!is_array(_t)){
			exit;
		}
	    if (_t[TWEEN.STATE] >= TWEEN_STATE.PAUSED)
	    {
	        _t[@ TWEEN.STATE] = TWEEN_STATE.STOPPED;
	        TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EVENT.STOP);
    
	        if (_t[TWEEN.DESTROY] && _t[TWEEN.DELAYS] == -1)
	        {
	            TweenDestroy(_t[TWEEN.ID]);
	        }
	    }
	}



}
