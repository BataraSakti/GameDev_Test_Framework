/// @description  TweenSystemSetAutoCleanIterations(num)
/// @function  TweenSystemSetAutoCleanIterations
/// @param num
function TweenSystemSetAutoCleanIterations(argument0) {

	with(SharedTweener())
	{
	    global.TGMS_AutoCleanIterations = argument0;
	    autoCleanIterations = argument0;
	}



}
