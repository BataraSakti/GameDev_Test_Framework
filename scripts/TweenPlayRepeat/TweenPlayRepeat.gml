/// @description  TweenPlayRepeat(tween,[ease,start,dest,dur])
/// @function  TweenPlayRepeat
/// @param tween
/// @param [ease
/// @param start
/// @param dest
/// @param dur]
function TweenPlayRepeat() {

	if (argument_count == 1)
	{
	    TweenPlayOnce(argument[0], TWEEN_PLAY.REPEAT);
	}
	else
	{
	    TweenPlayOnce(argument[0], argument[1], argument[2], argument[3], argument[4], TWEEN_PLAY.REPEAT);
	}



}
