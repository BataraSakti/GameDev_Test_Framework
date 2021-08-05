/// @description  ScheduleSetTimeScaleGroup(group,scale,deactivated)
/// @function  ScheduleSetTimeScaleGroup
/// @param group
/// @param scale
/// @param deactivated
function ScheduleSetTimeScaleGroup(argument0, argument1, argument2) {

	var _schedules = SharedScheduler().schedules;  
	var _index = -1;

	if (argument2)
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
        
	        if (_schedule[SGMS_SCHEDULE.GROUP] == argument0)
	        {
	            ScheduleSetTimeScale(_schedule[SGMS_SCHEDULE.ID], argument1);
	        }
	    }
	}
	else
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
        
	        if (_schedule[SGMS_SCHEDULE.GROUP] == argument0 && instance_exists(_schedule[SGMS_SCHEDULE.TARGET]))
	        {
	            ScheduleSetTimeScale(_schedule[SGMS_SCHEDULE.ID], argument1);
	        }
	    }
	}



}
