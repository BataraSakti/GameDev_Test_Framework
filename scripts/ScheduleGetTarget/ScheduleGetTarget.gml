/// @description  ScheduleGetTarget(schedule)
/// @function  ScheduleGetTarget
/// @param schedule
function ScheduleGetTarget(argument0) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    return _schedule[SGMS_SCHEDULE.TARGET];
	}
	else
	{
	    return noone;
	}



}
