/// @description  ScheduleSystemSetEnabled(bool)
/// @function  ScheduleSystemSetEnabled
/// @param bool
function ScheduleSystemSetEnabled(argument0) {

	(SharedScheduler()).isEnabled = argument0;
	global.SGMS_IsEnabled = argument0;



}
