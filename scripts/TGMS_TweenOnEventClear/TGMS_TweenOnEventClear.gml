/// @description  TGMS_TweenOnEventClear(tween,EVENT_TYPE)
/// @function  TGMS_TweenOnEventClear
/// @param tween
/// @param EVENT_TYPE
function TGMS_TweenOnEventClear(argument0, argument1) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
		if (!is_array(_tween)){
			show_debug("TGMS_TweenOnEventClear _tween is not array");
			exit;
		}
	    var _events = _tween[TWEEN.EVENTS];
    
	    if (_events != -1)
	    {    
	        if (qs_map_exists(_events, argument1))
	        {
	            var _event = _events[1][? argument1]; 
	            var _index = 0;
            
	            repeat(qs_list_size(_event)-1)
	            {
	                var _cb = _event[1][| ++_index];
	                _cb[@ TWEEN_CALLBACK.TARGET] = noone;
	                qs_map_delete(global.TGMS_MAP_CALLBACK, _cb[TWEEN_CALLBACK.ID]);
	            }
	        }
	    }
	}



}
