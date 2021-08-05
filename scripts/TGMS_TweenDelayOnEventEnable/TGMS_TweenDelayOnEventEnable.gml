/// @description  TGMS_TweenDelayOnEventEnable(delay,enable,EVENT_TYPE);
/// @function  TGMS_TweenDelayOnEventEnable
/// @param delay
/// @param enable
/// @param EVENT_TYPE
function TGMS_TweenDelayOnEventEnable(argument0, argument1, argument2) {

	if (argument0)
	{
	    var _d = global.TGMS_MAP_DELAY[1][? argument0];
	    var _enable = argument1;
	    var _EVENT_TYPE = argument2;
	    var _events = _d[TWEEN_DELAY.EVENTS];
    
	    // Create and assign events map if it doesn't exist
	    if (_events == -1)
	    {
	        _events = qs_map_create();
	        _d[@ TWEEN_DELAY.EVENTS] = _events;
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
