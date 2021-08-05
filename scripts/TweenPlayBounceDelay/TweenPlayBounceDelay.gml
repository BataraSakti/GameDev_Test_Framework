/// @description  TweenPlayBounceDelay(tween,delay,[ease,start,dest,dur])
/// @function  TweenPlayBounceDelay
/// @param tween
/// @param delay
/// @param [ease
/// @param start
/// @param dest
/// @param dur]
function TweenPlayBounceDelay() {

	if (argument_count == 2)
	{
	    return TweenPlayOnceDelay(argument[0], argument[1], TWEEN_PLAY.BOUNCE);
	}
	else
	{
	    return TweenPlayOnceDelay(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], TWEEN_PLAY.BOUNCE);
	}



}
