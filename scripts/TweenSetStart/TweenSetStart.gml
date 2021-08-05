/// @description  TweenSetStart(tween,start)
/// @function  TweenSetStart
/// @param tween
/// @param start
function TweenSetStart(argument0, argument1) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    var _dest = _tween[TWEEN.START] + _tween[TWEEN.CHANGE];
    
	    _tween[@ TWEEN.START] = argument1;
	    _tween[@ TWEEN.CHANGE] = _dest - argument1;
	}



}
