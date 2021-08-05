/// @description  ScheduleCancelGroup(group,deactivated)
/// @function  ScheduleCancelGroup
/// @param group
/// @param deactivated
function ScheduleCancelGroup(argument0, argument1) {
    
	var _schedules = SharedScheduler().schedules;
	var _index = -1;

	if (argument1)
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
    
	        // IF schedule belongs to group
	        if (_schedule[SGMS_SCHEDULE.GROUP] == argument0)
	        {   
	            ScheduleCancel(_schedule[SGMS_SCHEDULE.ID]);
	        }
	    }
	}
	else
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
    
	        // IF schedule belongs to group
	        if (_schedule[SGMS_SCHEDULE.GROUP] == argument0 && instance_exists(_schedule[SGMS_SCHEDULE.TARGET]))
	        {   
	            ScheduleCancel(_schedule[SGMS_SCHEDULE.ID]);
	        }
	    }
	}



}
