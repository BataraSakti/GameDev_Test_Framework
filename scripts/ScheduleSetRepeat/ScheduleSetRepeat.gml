/// @description  ScheduleSetRepeat(schedule,count)
/// @function  ScheduleSetRepeat
/// @param schedule
/// @param count
function ScheduleSetRepeat(argument0, argument1) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    _schedule[@ SGMS_SCHEDULE.REPEAT_COUNT] = max(-1, floor(argument1));
	}



}
