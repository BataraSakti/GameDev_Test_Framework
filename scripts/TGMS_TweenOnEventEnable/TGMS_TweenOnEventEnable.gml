/// @description  TGMS_TweenOnEventEnable(tween,enable,EVENT_TYPE);
/// @function  TGMS_TweenOnEventEnable
/// @param tween
/// @param enable
/// @param EVENT_TYPE
function TGMS_TweenOnEventEnable(argument0, argument1, argument2) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    var _enable = argument1;
	    var _EVENT_TYPE = argument2;
	    var _events = _tween[TWEEN.EVENTS];
    
	    // Create and assign events map if it doesn't exist
	    if (_events == -1)
	    {
	        _events = qs_map_create();
	        _tween[@ TWEEN.EVENTS] = _events;
	    }
    
	    if (qs_map_exists(_events, _EVENT_TYPE) == false)
	    {
	        // Create event list
	        var _event = qs_list_create();
	        // Add event to events map
	        _events[1][? _EVENT_TYPE] = _event;
	    }
    
	    // Set tween event state
	    var _event = _events[1][? _EVENT_TYPE];
	    _event[1][| 0] = _enable;
	}



}
