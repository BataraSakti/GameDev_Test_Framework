/// @description  ScheduleResume(schedule)
/// @function  ScheduleResume
/// @param schedule
function ScheduleResume(argument0) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];

	    if (_schedule[SGMS_SCHEDULE.STATE] == 0)
	    {
	        _schedule[@ SGMS_SCHEDULE.STATE] = 1;
	    }
	}



}
