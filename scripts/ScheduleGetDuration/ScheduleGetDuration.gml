/// @description  ScheduleGetDuration(schedule)
/// @function  ScheduleGetDuration
/// @param schedule
function ScheduleGetDuration(argument0) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    return _schedule[SGMS_SCHEDULE.DURATION];
	}



}
