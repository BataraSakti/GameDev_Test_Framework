/// @description  SchedulePause(schedule)
/// @function  SchedulePause
/// @param schedule
function SchedulePause(argument0) {

	if (argument0)
	{
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];

	    if (_schedule[SGMS_SCHEDULE.STATE] == 1)
	    {
	        _schedule[@ SGMS_SCHEDULE.STATE] = 0;
	    }
	}



}
