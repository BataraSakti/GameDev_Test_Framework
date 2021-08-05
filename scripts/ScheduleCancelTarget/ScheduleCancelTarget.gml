/// @description  ScheduleCancelTarget(target)
/// @function  ScheduleCancelTarget
/// @param target
function ScheduleCancelTarget(argument0) {

	if(IS_DEBUG && SHOW_SCHEDULER_LOGS) {
		ScheduleGetSchedulesForTarget(argument0);
	}

	var _schedules = SharedScheduler().schedules;
	var _index = -1;

	repeat(qs_list_size(_schedules))
	{
	    // Cache schedule
	    var _schedule = _schedules[1][| ++_index];
    
	    // IF schedule belongs to target
	    if (_schedule[SGMS_SCHEDULE.TARGET] == argument0)
	    {
	        ScheduleCancel(_schedule[SGMS_SCHEDULE.ID]);
	    }
	}



}
