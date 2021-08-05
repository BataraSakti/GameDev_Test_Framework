/// @description  TweenPlayLoop(tween,[ease,start,dest,dur])
/// @function  TweenPlayLoop
/// @param tween
/// @param [ease
/// @param start
/// @param dest
/// @param dur]
function TweenPlayLoop() {

	if (argument_count == 1)
	{
	    TweenPlayOnce(argument[0], TWEEN_PLAY.LOOP);
	}
	else
	{
	    TweenPlayOnce(argument[0], argument[1], argument[2], argument[3], argument[4], TWEEN_PLAY.LOOP);
	}



}
