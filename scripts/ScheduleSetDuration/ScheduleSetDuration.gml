/// @description  ScheduleSetDuration(schedule,interval)
/// @function  ScheduleSetDuration
/// @param schedule
/// @param interval
function ScheduleSetDuration(argument0, argument1) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    _schedule[@ SGMS_SCHEDULE.DURATION] = argument1;
	}



}
