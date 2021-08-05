/// @description  ScheduleSystemSetTimeScale(scale)
/// @function  ScheduleSystemSetTimeScale
/// @param scale
function ScheduleSystemSetTimeScale(argument0) {

	(SharedScheduler()).timeScale = argument0;
	global.SGMS_TimeScale = argument0;



}
