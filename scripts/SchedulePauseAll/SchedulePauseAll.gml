/// @description  SchedulePauseAll(deactivated)
/// @function  SchedulePauseAll
/// @param deactivated
function SchedulePauseAll(argument0) {

	var _schedules = SharedScheduler().schedules;  
	var _index = -1;

	if (argument0)
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
	        SchedulePause(_schedule[SGMS_SCHEDULE.ID]);
	    }
	}
	else
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
        
	        if (instance_exists(_schedule[SGMS_SCHEDULE.TARGET]))
	        {
	            SchedulePause(_schedule[SGMS_SCHEDULE.ID]);
	        }
	    }
	}



}
