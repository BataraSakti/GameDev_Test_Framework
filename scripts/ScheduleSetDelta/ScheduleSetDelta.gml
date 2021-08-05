/// @description  ScheduleSetDelta(schedule,bool)
/// @function  ScheduleSetDelta
/// @param schedule
/// @param bool
function ScheduleSetDelta(argument0, argument1) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    _schedule[@ SGMS_SCHEDULE.DELTA] = argument1;
	}



}
