/// @description  ScheduleSetMuteGroup(group,mute,deactivated)
/// @function  ScheduleSetMuteGroup
/// @param group
/// @param mute
/// @param deactivated
function ScheduleSetMuteGroup(argument0, argument1, argument2) {

	var _schedules = SharedScheduler().schedules;  
	var _index = -1;

	if (argument2)
	{
	    repeat(qs_list_size(_schedules))
	    {
	        if (_schedule[SGMS_SCHEDULE.GROUP] == argument0)
	        {
	            var _schedule = _schedules[1][| ++_index];
	            ScheduleSetMute(_schedule[SGMS_SCHEDULE.ID], argument1);
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
	            ScheduleSetMute(_schedule[SGMS_SCHEDULE.ID], argument1);
	        }
	    }
	}



}
