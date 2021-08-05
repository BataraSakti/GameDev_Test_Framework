/// @description  ScheduleSystemSetUpdateInterval(steps)
/// @function  ScheduleSystemSetUpdateInterval
/// @param steps
function ScheduleSystemSetUpdateInterval(argument0) {

	(SharedScheduler()).updateInterval = argument0;
	global.SGMS_UpdateInterval = argument0;



}
