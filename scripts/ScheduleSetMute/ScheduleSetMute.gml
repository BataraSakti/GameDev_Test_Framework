/// @description  ScheduleSetMute(schedule,mute)
/// @function  ScheduleSetMute
/// @param schedule
/// @param mute
function ScheduleSetMute(argument0, argument1) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
    
	    if (argument1)
	    {
	        _schedule[@ SGMS_SCHEDULE.TYPE] = -abs(_schedule[SGMS_SCHEDULE.TYPE]);
	    }
	    else
	    {
	        _schedule[@ SGMS_SCHEDULE.TYPE] = abs(_schedule[SGMS_SCHEDULE.TYPE]);
	    }
	}



}
