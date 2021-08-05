/// @description  TweenDestroyWhenDone(tween,destroy,[kill_target])
/// @function  TweenDestroyWhenDone
/// @param tween
/// @param destroy
/// @param [kill_target]
function TweenDestroyWhenDone() {
	/*
	    Destroys a tween when it finishes or is stopped.
	    Optionally destroys target as well
	*/

	if (argument[0])
	{
	    var _tween = global.TGMS_MAP_TWEEN[1][? argument[0]];
    
	    if (argument_count == 2)
	    {
	        _tween[@ TWEEN.DESTROY] = argument[1];
	    }
	    else
	    {
	        //_tween[@ TWEEN.DESTROY] = (argument[1]+argument[2])*argument[1];
			var _ttt = argument[1];
			var _ttt2 = argument[2];
			_tween[@ TWEEN.DESTROY] = (_ttt+_ttt2)*argument[1];
	    }
	}



}
