/// @description  ScheduleResumeAll(deactivated)
/// @function  ScheduleResumeAll
/// @param deactivated
function ScheduleResumeAll(argument0) {
 
	var _schedules = SharedScheduler().schedules;  
	var _index = -1;

	if (argument0)
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
	        ScheduleResume(_schedule[SGMS_SCHEDULE.ID]);
	    }
	}
	else
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
        
	        if (instance_exists(_schedule[SGMS_SCHEDULE.TARGET]))
	        {
	            ScheduleResume(_schedule[SGMS_SCHEDULE.ID]);
	        }
	    }
	}



}
