/// @description  TweenSetTarget(tween,instance)
/// @function  TweenSetTarget
/// @param tween
/// @param instance
function TweenSetTarget(argument0, argument1) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
    
	    if (_tween[TWEEN.TARGET] != noone)
	    {
	        _tween[@ TWEEN.TARGET] = argument1;
        
	        if (_tween[TWEEN.STATE] >= 0) 
	        {
	            _tween[@ TWEEN.STATE] = argument1;
	        }
	    }
	}



}
