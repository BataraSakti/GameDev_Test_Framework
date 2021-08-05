/// @description  TweenSystemSetMinDeltaFPS(fps)
/// @function  TweenSystemSetMinDeltaFPS
/// @param fps
function TweenSystemSetMinDeltaFPS(argument0) {

	with(SharedTweener())
	{
	    global.TGMS_MinDeltaFPS = argument0;
	    minDeltaFPS = argument0;
	    maxDelta = 1/minDeltaFPS;
	}



}
