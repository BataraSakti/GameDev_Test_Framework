/// @description  TweenSetGroup(tween,group)
/// @function  TweenSetGroup
/// @param tween
/// @param group
function TweenSetGroup(argument0, argument1) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    _tween[@ TWEEN.GROUP] = argument1;
	}



}
