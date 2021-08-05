/// @description  TweenSystemOptimise(enable)
/// @function  TweenSystemOptimise
/// @param enable
function TweenSystemOptimise(argument0) {

	// Set optional optimisation path for YYC
	if (code_is_compiled() && os_browser == browser_not_a_browser)
	{
	    global.TGMS_OptimiseYYC = argument0;
    
	    return argument0;
	}



}
