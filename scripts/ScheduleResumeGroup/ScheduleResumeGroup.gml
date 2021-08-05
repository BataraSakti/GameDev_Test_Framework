/// @description  ScheduleResumeGroup(group,deactivated)
/// @function  ScheduleResumeGroup
/// @param group
/// @param deactivated
function ScheduleResumeGroup(argument0, argument1) {
 
	var _schedules = SharedScheduler().schedules;  
	var _index = -1;

	if (argument1)
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
    
	        if (_schedule[SGMS_SCHEDULE.GROUP] == argument0)
	        { 
	            ScheduleResume(_schedule[SGMS_SCHEDULE.ID]);
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
	            ScheduleResume(_schedule[SGMS_SCHEDULE.ID]);
	        }
	    }
	}



}
