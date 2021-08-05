/// @description  TweenCalcTime(tween,time)
/// @function  TweenCalcTime
/// @param tween
/// @param time
function TweenCalcTime(argument0, argument1) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
    
	    if (_tween[TWEEN.DURATION] == 0)
	    {
	        return _tween[TWEEN.START];
	    }
    
	    return script_execute(_tween[TWEEN.EASE], argument1, _tween[TWEEN.START], _tween[TWEEN.CHANGE], _tween[TWEEN.DURATION]);
	}



}
