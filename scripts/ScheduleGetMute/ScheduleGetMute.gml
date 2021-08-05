/// @description  ScheduleGetMute(schedule)
/// @function  ScheduleGetMute
/// @param schedule
function ScheduleGetMute(argument0) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    return _schedule[SGMS_SCHEDULE.TYPE] <= 0;
	}



}
