/// @description  TweenDefaultSetTimeScale(scale)
/// @function  TweenDefaultSetTimeScale
/// @param scale
function TweenDefaultSetTimeScale(argument0) {
	/*
	    Assign default time scale for newly created tweens
	*/

	global.TGMS_TweenDefault[@ TWEEN.TIME_SCALE] = clamp(argument0, 0, 100);



}
