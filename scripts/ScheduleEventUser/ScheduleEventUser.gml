/// @description  ScheduleEventUser(target,delta,dur,numb)
/// @function  ScheduleEventUser
/// @param target
/// @param delta
/// @param dur
/// @param numb
function ScheduleEventUser() {

	// Reference default schedule -- create new schedule on write
	var _schedule = global.SGMS_DefaultSchedule;

	_schedule[SGMS_SCHEDULE.TARGET] = argument[0];
	_schedule[SGMS_SCHEDULE.DELTA] = argument[1];
	_schedule[SGMS_SCHEDULE.DURATION] = argument[2];
	_schedule[SGMS_SCHEDULE.TIME] = argument[2];
	_schedule[SGMS_SCHEDULE.SCRIPT_EVENT] = argument[3];
	_schedule[SGMS_SCHEDULE.TYPE] = SGMS_SCHEDULE_TYPE.EVENT_USER;
	_schedule[SGMS_SCHEDULE.ID] = ++global.SGMS_INDEX_SCHEDULE;

	// Assign schedule index to schedule map
	global.SGMS_MAP_SCHEDULES[1][? global.SGMS_INDEX_SCHEDULE] = _schedule;
	// Add new schedule to scheduler list
	qs_list_add(SharedScheduler().schedules, _schedule);
	// Return schedule handle index
	return global.SGMS_INDEX_SCHEDULE;



}
