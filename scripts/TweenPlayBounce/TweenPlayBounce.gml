/// @description  TweenPlayBounce(tween,[ease,start,dest,dur])
/// @function  TweenPlayBounce
/// @param tween
/// @param [ease
/// @param start
/// @param dest
/// @param dur]
function TweenPlayBounce() {

	if (argument_count == 1)
	{
	    TweenPlayOnce(argument[0], TWEEN_PLAY.BOUNCE);
	}
	else
	{
	    TweenPlayOnce(argument[0], argument[1], argument[2], argument[3], argument[4], TWEEN_PLAY.BOUNCE);
	}



}
