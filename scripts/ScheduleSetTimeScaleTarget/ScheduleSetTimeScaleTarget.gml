/// @description  ScheduleSetTimeScaleTarget(target,scale)
/// @function  ScheduleSetTimeScaleTarget
/// @param target
/// @param scale
function ScheduleSetTimeScaleTarget(argument0, argument1) {

	var _schedules = SharedScheduler().schedules;  
	var _index = -1;

	repeat(qs_list_size(_schedules))
	{
	    // Cache schedule
	    var _schedule = _schedules[1][| ++_index];
    
	    // IF schedule belongs to target
	    if (_schedule[SGMS_SCHEDULE.TARGET] == argument0)
	    {
	        ScheduleSetTimeScale(_schedule[SGMS_SCHEDULE.ID], argument1);
	    }
	}



}
