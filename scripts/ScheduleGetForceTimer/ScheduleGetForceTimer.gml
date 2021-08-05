/// @description  ScheduleGetForceTimer(schedule)
/// @function  ScheduleGetForceTimer
/// @param schedule
function ScheduleGetForceTimer(argument0) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    return _schedule[SGMS_SCHEDULE.FORCE_TIMER];
	}



}
