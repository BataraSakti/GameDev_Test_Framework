/// @description  ScheduleSetGroup(schedule,group)
/// @function  ScheduleSetGroup
/// @param schedule
/// @param group
function ScheduleSetGroup(argument0, argument1) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    _schedule[@ SGMS_SCHEDULE.GROUP] = argument1;
	}



}
