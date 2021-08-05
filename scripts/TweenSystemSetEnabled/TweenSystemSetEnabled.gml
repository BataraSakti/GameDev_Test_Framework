/// @description  TweenSystemSetEnabled(enable)
/// @function  TweenSystemSetEnabled
/// @param enable
function TweenSystemSetEnabled(argument0) {

	(SharedTweener()).isEnabled = argument0;
	global.TGMS_IsEnabled = argument0;



}
