/// @description  TweenSetPlayMode(tween,TWEEN_PLAY_MODE)
/// @function  TweenSetPlayMode
/// @param tween
/// @param TWEEN_PLAY_MODE
function TweenSetPlayMode(argument0, argument1) {
 
	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
		if (is_array(_tween)){
			_tween[@ TWEEN.PLAY_MODE] = argument1;
		}
	}



}
