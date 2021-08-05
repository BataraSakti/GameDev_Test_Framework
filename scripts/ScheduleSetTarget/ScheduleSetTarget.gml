/// @description  ScheduleSetTarget(schedule,instance)
/// @function  ScheduleSetTarget
/// @param schedule
/// @param instance
function ScheduleSetTarget(argument0, argument1) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    _schedule[@ SGMS_SCHEDULE.TARGET] = argument1;
	}



}
