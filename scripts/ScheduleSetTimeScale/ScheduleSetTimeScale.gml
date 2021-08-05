/// @description  ScheduleSetTimeScale(schedule,scale)
/// @function  ScheduleSetTimeScale
/// @param schedule
/// @param scale
function ScheduleSetTimeScale(argument0, argument1) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    _schedule[@ SGMS_SCHEDULE.TIME_SCALE] = argument1;
	}



}
