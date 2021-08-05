/// @description  TweenSetProperty(tween,property)
/// @function  TweenSetProperty
/// @param tween
/// @param property
function TweenSetProperty(argument0, argument1) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    _tween[@ TWEEN.PROPERTY] = argument1;
	}



}
