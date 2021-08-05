/// @description  TweenSystemDeltaTime(scaled)
/// @function  TweenSystemDeltaTime
/// @param scaled
function TweenSystemDeltaTime(argument0) {

	if (argument0)
	{
	    return SharedTweener().deltaTime * SharedTweener().timeScale;
	}

	return SharedTweener().deltaTime;



}
