/// @description  SchedulePauseGroup(group,deactivated)
/// @function  SchedulePauseGroup
/// @param group
/// @param deactivated
function SchedulePauseGroup(argument0, argument1) {

	var _schedules = SharedScheduler().schedules;  
	var _index = -1;

	if (argument1)
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
        
	        if (_schedule[SGMS_SCHEDULE.GROUP] == argument0)
	        {
	            SchedulePause(_schedule[SGMS_SCHEDULE.ID]);
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
	            SchedulePause(_schedule[SGMS_SCHEDULE.ID]);
	        }
	    }
	}



}
