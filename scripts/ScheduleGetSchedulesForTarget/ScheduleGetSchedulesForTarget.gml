/// @description  ScheduleGetSchedulesForTarget(target)
/// @function  ScheduleGetSchedulesForTarget
/// @param target
function ScheduleGetSchedulesForTarget(argument0) {

	var _schedules = SharedScheduler().schedules;
	var _index = -1;
	var _found = -1;
	var _list;
	_list[0] = ScheduleNull();

	repeat(qs_list_size(_schedules)) {
	    // Cache schedule
	    var _schedule = _schedules[1][| ++_index];
    
	    // IF schedule belongs to target
	    if (_schedule[SGMS_SCHEDULE.TARGET] == argument0) {
			_list[++_found] = _schedule[SGMS_SCHEDULE.ID];
	    }
	}

	show_debug(object_get_name(argument0.object_index) + " has " + string(_found+1) + " schedules: " + string(_list));

	return _list;


}
