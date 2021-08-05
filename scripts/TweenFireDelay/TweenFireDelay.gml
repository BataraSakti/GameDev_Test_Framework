/// @description  TweenFireDelay(target,property,delta,ease,start,dest,dur,delay);
/// @function  TweenFireDelay
/// @param target
/// @param property
/// @param delta
/// @param ease
/// @param start
/// @param dest
/// @param dur
/// @param delay
function TweenFireDelay(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var _tweenID = TweenCreate(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
	var _delayID = TweenPlayOnceDelay(_tweenID, argument7);
	var _tweenRaw = global.TGMS_MAP_TWEEN[1][? _tweenID];

	_tweenRaw[@ TWEEN.DESTROY] = 1;

	var _return;
	_return[0] = _tweenID;
	_return[1] = _delayID;

	return _return;



}
