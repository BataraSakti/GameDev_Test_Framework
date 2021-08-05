/// @description  ScheduleGetRepeat(schedule)
/// @function  ScheduleGetRepeat
/// @param schedule
function ScheduleGetRepeat(argument0) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    return _schedule[SGMS_SCHEDULE.REPEAT_COUNT];
	}



}
