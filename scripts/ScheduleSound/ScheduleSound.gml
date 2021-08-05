/// @description  ScheduleSound(target,delta,dur,sound,priority,loops)
/// @function  ScheduleSound
/// @param target
/// @param delta
/// @param dur
/// @param sound
/// @param priority
/// @param loops
function ScheduleSound() {

	// Reference default schedule -- create new schedule on write
	var _schedule = global.SGMS_DefaultSchedule;

	_schedule[SGMS_SCHEDULE.ARGS+1] = argument[5];

	_schedule[SGMS_SCHEDULE.TARGET] = argument[0];
	_schedule[SGMS_SCHEDULE.DELTA] = argument[1];
	_schedule[SGMS_SCHEDULE.DURATION] = argument[2];
	_schedule[SGMS_SCHEDULE.TIME] = argument[2];
	_schedule[SGMS_SCHEDULE.SCRIPT_EVENT] = argument[3];
	_schedule[SGMS_SCHEDULE.ARGS] = argument[4];
	_schedule[SGMS_SCHEDULE.TYPE] = SGMS_SCHEDULE_TYPE.SOUND;
	_schedule[SGMS_SCHEDULE.ID] = ++global.SGMS_INDEX_SCHEDULE;

	// Assign schedule index to schedule map
	global.SGMS_MAP_SCHEDULES[1][? global.SGMS_INDEX_SCHEDULE] = _schedule;
	// Add new schedule to scheduler list
	qs_list_add(SharedScheduler().schedules, _schedule);
	// Return schedule handle index
	return global.SGMS_INDEX_SCHEDULE;



}
