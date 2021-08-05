/// @description  ScheduleCancel(schedule);
/// @function  ScheduleCancel
/// @param schedule
function ScheduleCancel(argument0) {
	// return null
	if (argument0)
	{
	
	    // Cache schedule data
	    var _schedule = global.SGMS_MAP_SCHEDULES[1][? argument0];
	    // Invalidate schedule's handle -- Use stored handle to prevent deleting of null schedule index key
		if(is_undefined(_schedule)) {
			//Prevent crash if schedule doesn't exist.
			show_debug("WARNING - SCHEDULE DOES NOT EXIST");
		} else {
			qs_map_delete(global.SGMS_MAP_SCHEDULES, _schedule[SGMS_SCHEDULE.ID]);
			// Clear target instance
			_schedule[@ SGMS_SCHEDULE.TARGET] = noone;
			// Set state as destroyed
			_schedule[@ SGMS_SCHEDULE.STATE] = -1;
			// Set self reference as null
			_schedule[@ SGMS_SCHEDULE.ID] = 0;
		}
	}



}
