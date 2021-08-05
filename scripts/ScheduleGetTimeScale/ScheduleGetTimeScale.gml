/// @description  ScheduleGetTimeScale(schedule)
/// @function  ScheduleGetTimeScale
/// @param schedule
function ScheduleGetTimeScale(argument0) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    return _schedule[SGMS_SCHEDULE.TIME_SCALE];
	}



}
