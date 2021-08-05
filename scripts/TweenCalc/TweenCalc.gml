/// @description  TweenCalc(tween)
/// @function  TweenCalc
/// @param tween
function TweenCalc(argument0) {

	if (argument0)
	{
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
    
	    if (_t[TWEEN.DURATION] == 0)
	    {
	        return _t[TWEEN.START];
	    }
    
	    // Return calculated tween value
	    return script_execute(_t[TWEEN.EASE], _t[TWEEN.TIME], _t[TWEEN.START], _t[TWEEN.CHANGE], _t[TWEEN.DURATION]);
	}



}
