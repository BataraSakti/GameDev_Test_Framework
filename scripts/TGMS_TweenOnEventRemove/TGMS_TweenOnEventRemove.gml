/// @description  TGMS_TweenOnEventRemove(tween,callback,EVENT_TYPE)
/// @function  TGMS_TweenOnEventRemove
/// @param tween
/// @param callback
/// @param EVENT_TYPE
function TGMS_TweenOnEventRemove(argument0, argument1, argument2) {

	if (argument0)
	{
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
	    var _events = _t[TWEEN.EVENTS];
    
	    if (_events != -1)
	    {
	        if (qs_map_exists(_events, argument2))
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
	                qs_map_delete(global.TGMS_MAP_CALLBACK, argument1);
	            }
	        }
	    }
	}



}
