/// @description  TGMS_TweenDelayOnEventRemove(delay,callback,EVENT_TYPE)
/// @function  TGMS_TweenDelayOnEventRemove
/// @param delay
/// @param callback
/// @param EVENT_TYPE
function TGMS_TweenDelayOnEventRemove(argument0, argument1, argument2) {

	if (argument0)
	{
	    var _d = global.TGMS_MAP_DELAY[1][? argument0];
	    var _events = _d[TWEEN_DELAY.EVENTS];
    
	    if (_events != -1)
	    {
	        if (ds_map_exists(_events, argument2))
	        {
	            if (argument1)
	            {
	                // Get callback
	                var _cb = global.TGMS_MAP_CALLBACK[1][? argument1];
	                // Set target as noone -- useful for system cleaning
	                _cb[@ TWEEN_CALLBACK.TARGET] = noone;
	                // Clear self reference handle
	                _cb[@ TWEEN_CALLBACK.ID] = 0;
	                // Invalidate callback
	                ds_map_delete(global.TGMS_MAP_CALLBACK, argument1);
	            }
	        }
	    }
	}



}
