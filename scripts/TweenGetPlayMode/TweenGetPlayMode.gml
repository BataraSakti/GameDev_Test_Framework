/// @description  TweenGetPlayMode(tween)
/// @function  TweenGetPlayMode
/// @param tween
function TweenGetPlayMode(argument0) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
	    return _tween[TWEEN.PLAY_MODE];
	}



}
