/// @description  ScheduleIsPlaying(schedule)
/// @function  ScheduleIsPlaying
/// @param schedule
function ScheduleIsPlaying(argument0) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    return _schedule[SGMS_SCHEDULE.STATE] == 1;
	}



}
