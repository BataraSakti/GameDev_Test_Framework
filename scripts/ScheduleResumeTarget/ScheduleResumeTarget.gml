/// @description  ScheduleResumeTarget(target)
/// @function  ScheduleResumeTarget
/// @param target
function ScheduleResumeTarget(argument0) {
 
	var _schedules = SharedScheduler().schedules;  
	var _index = -1;

	repeat(qs_list_size(_schedules))
	{
	    // Cache schedule
	    var _schedule = _schedules[1][| ++_index];
    
	    // IF schedule belongs to target
	    if (_schedule[SGMS_SCHEDULE.TARGET] == argument0)
	    {
	        ScheduleResume(_schedule[SGMS_SCHEDULE.ID]);
	    }
	}



}
