/// @description  TweenDefine(tween,target,property,delta,ease,start,dest,dur)
/// @function  TweenDefine
/// @param tween
/// @param target
/// @param property
/// @param delta
/// @param ease
/// @param start
/// @param dest
/// @param dur
function TweenDefine(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	if (argument0)
	{
	    TweenSetTarget(argument0, argument1);
	    TweenSetProperty(argument0,argument2);
    
	    var _t = global.TGMS_MAP_TWEEN[1][? argument0];
	    _t[@ TWEEN.DELTA] = argument3;
	    _t[@ TWEEN.EASE] = argument4;
	    _t[@ TWEEN.START] = argument5;
	    _t[@ TWEEN.DURATION] = argument7;
	    _t[@ TWEEN.CHANGE] =  argument6 - argument5;
	}



}
