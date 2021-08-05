/// @description  ScheduleSetTime(schedule,time)
/// @function  ScheduleSetTime
/// @param schedule
/// @param time
function ScheduleSetTime(argument0, argument1) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    _schedule[@ SGMS_SCHEDULE.TIME] = argument1;
	}



}
