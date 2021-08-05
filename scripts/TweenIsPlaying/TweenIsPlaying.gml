/// @description  TweenIsPlaying(tween)
/// @function  TweenIsPlaying
/// @param tween
function TweenIsPlaying(argument0) {

	if (argument0)
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument0];
		var _ret = false;
		if(is_array(_tween)){
			_ret = _tween[TWEEN.STATE] >= 0;
		} else {
			show_debug("TweenIsPlaying tween is not array");
		}
	}



}
