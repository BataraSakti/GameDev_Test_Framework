/// @description  ScheduleSetMuteAll(mute,deactivated)
/// @function  ScheduleSetMuteAll
/// @param mute
/// @param deactivated
function ScheduleSetMuteAll(argument0, argument1) {

	var _schedules = SharedScheduler().schedules;  
	var _index = -1;

	if (argument1)
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
	        ScheduleSetMute(_schedule[SGMS_SCHEDULE.ID], argument0);
	    }
	}
	else
	{
	    repeat(qs_list_size(_schedules))
	    {
	        var _schedule = _schedules[1][| ++_index];
        
	        if (instance_exists(_schedule[SGMS_SCHEDULE.TARGET]))
	        {
	            ScheduleSetMute(_schedule[SGMS_SCHEDULE.ID], argument0);
	        }
	    }
	}



}
