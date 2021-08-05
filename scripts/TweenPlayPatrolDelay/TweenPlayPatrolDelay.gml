/// @description  TweenPlayPatrolDelay(tween,delay,Opt:[ease,start,dest,dur])
/// @function  TweenPlayPatrolDelay
/// @param tween
/// @param delay
/// @param Opt:[ease
/// @param start
/// @param dest
/// @param dur]
function TweenPlayPatrolDelay() {

	if (argument_count == 2)
	{
	    return TweenPlayOnceDelay(argument[0], argument[1], TWEEN_PLAY.PATROL);
	}
	else
	{
	    return TweenPlayOnceDelay(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], TWEEN_PLAY.PATROL);
	}



}
