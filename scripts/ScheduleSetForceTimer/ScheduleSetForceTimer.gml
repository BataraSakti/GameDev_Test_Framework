/// @description  ScheduleSetForceTimer(schedule,force)
/// @function  ScheduleSetForceTimer
/// @param schedule
/// @param force
function ScheduleSetForceTimer(argument0, argument1) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    _schedule[@ SGMS_SCHEDULE.FORCE_TIMER] = argument1;
	}



}
