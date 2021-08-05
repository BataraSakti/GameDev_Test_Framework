/// @description  TweenSystemSetUpdateInterval(steps)
/// @function  TweenSystemSetUpdateInterval
/// @param steps
function TweenSystemSetUpdateInterval(argument0) {

	(SharedTweener()).updateInterval = argument0;
	global.TGMS_UpdateInterval = argument0;



}
