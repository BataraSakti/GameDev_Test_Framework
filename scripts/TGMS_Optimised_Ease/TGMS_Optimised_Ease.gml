/// @description  TGMS_Optimised_Ease(ease,time,start,change,duration);
/// @function  TGMS_Optimised_Ease
/// @param ease
/// @param time
/// @param start
/// @param change
/// @param duration
function TGMS_Optimised_Ease(argument0, argument1, argument2, argument3, argument4) {
	/*
	    Ease algorithm optimisation path.
	    Extend as needed...
	*/

	switch(argument0)
	{
	    // Standard cases
	    case EaseLinear: return EaseLinear(argument1, argument2, argument3, argument4); break;
	    case EaseInQuad: return EaseInQuad(argument1, argument2, argument3, argument4); break;
	    case EaseOutQuad: return EaseOutQuad(argument1, argument2, argument3, argument4); break;
	    case EaseInOutQuad: return EaseInOutQuad(argument1, argument2, argument3, argument4); break;
	    case EaseInCubic: return EaseInCubic(argument1, argument2, argument3, argument4); break;
	    case EaseOutCubic: return EaseOutCubic(argument1, argument2, argument3, argument4); break;
	    case EaseInOutCubic: return EaseInOutCubic(argument1, argument2, argument3, argument4); break;
	    case EaseInQuart: return EaseInQuart(argument1, argument2, argument3, argument4); break;
	    case EaseOutQuart: return EaseOutQuart(argument1, argument2, argument3, argument4); break;
	    case EaseInOutQuart: return EaseInOutQuart(argument1, argument2, argument3, argument4); break;
	    case EaseInQuint: return EaseInQuint(argument1, argument2, argument3, argument4); break;
	    case EaseOutQuint: return EaseOutQuint(argument1, argument2, argument3, argument4); break;
	    case EaseInOutQuint: return EaseInOutQuint(argument1, argument2, argument3, argument4); break;
	    case EaseInSine: return EaseInSine(argument1, argument2, argument3, argument4); break;
	    case EaseOutSine: return EaseOutSine(argument1, argument2, argument3, argument4); break;
	    case EaseInOutSine: return EaseInOutSine(argument1, argument2, argument3, argument4); break;
	    case EaseInCirc: return EaseInCirc(argument1, argument2, argument3, argument4); break;
	    case EaseOutCirc: return EaseOutCirc(argument1, argument2, argument3, argument4); break;
	    case EaseInOutCirc: return EaseInOutCirc(argument1, argument2, argument3, argument4); break;
	    case EaseInExpo: return EaseInExpo(argument1, argument2, argument3, argument4); break;
	    case EaseOutExpo: return EaseOutExpo(argument1, argument2, argument3, argument4); break;
	    case EaseInOutExpo: return EaseInOutExpo(argument1, argument2, argument3, argument4); break;
	    case EaseInElastic: return EaseInElastic(argument1, argument2, argument3, argument4); break;
	    case EaseOutElastic: return EaseOutElastic(argument1, argument2, argument3, argument4); break;
	    case EaseInOutElastic: return EaseInOutElastic(argument1, argument2, argument3, argument4); break;
	    case EaseInBack: return EaseInBack(argument1, argument2, argument3, argument4); break;
	    case EaseOutBack: return EaseOutBack(argument1, argument2, argument3, argument4); break;
	    case EaseInOutBack: return EaseInOutBack(argument1, argument2, argument3, argument4); break;
	    case EaseInBounce: return EaseInBounce(argument1, argument2, argument3, argument4); break;
	    case EaseOutBounce: return EaseOutBounce(argument1, argument2, argument3, argument4); break;
	    case EaseInOutBounce: return EaseInOutBounce(argument1, argument2, argument3, argument4); break;
    
	    // Custom cases
	    // MAKE SURE TO BACK UP CUSTOM CASES WHEN DONE
	  }




}
