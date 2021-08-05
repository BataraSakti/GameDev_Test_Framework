/// @description  TweenDelayPropertySetter(delay,property)
/// @function  TweenDelayPropertySetter
/// @param delay
/// @param property
function TweenDelayPropertySetter(argument0, argument1) {
	/*  
	    This can be useful for TweenPlay****Delayed scripts when using extended property setters.
	    Sometimes, you don't want an extended property setter to become active until
	    the delayed tween starts playing, otherwise currently playing tweens could have
	    their intended property setter overridden. 
    
	    Here is an example of how to use it:
    
	        // Create two different extended property setters
	        pExt1 = TPSetExt(ext_xy__, 0, 100, 0, 100);
	        pExt2 = TPSetExt(ext_xy__, 100, 0, 100, 0);
    
	        // Create and play a tween using the first property setter
	        tween = TweenCreate(id, pExt1, true);
	        TweenPlayOnce(id, EaseInQuad, 0, 1, 3.0);
    
	        // Delay the tween and tell it to activate the second property when the tween starts playing
	        var _delay = TweenPlayOnceDelay(tween, 3.0, EaseOutQuad, 0, 1, 3.0);
	        TweenDelayPropertySetter(_delay, pExt2);
        
	    Typically, this script is not required when using TweenFire****Delay or TweenSimple****Delay scripts.
	*/

	if (argument0)
	{
	    var _delay = global.TGMS_MAP_DELAY[1][? argument0];
	    _delay[@ TWEEN_DELAY.PROPERTY] = argument1;
	}



}
