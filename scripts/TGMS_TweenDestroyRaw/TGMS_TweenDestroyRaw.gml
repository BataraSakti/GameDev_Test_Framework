/// @description  TGMS_TweenDestroyRaw(rTween)
/// @function  TGMS_TweenDestroyRaw
/// @param rTween
function TGMS_TweenDestroyRaw(argument0) {
	//!DO NOT CALL THIS DIRECTLY!
	if (argument0[TWEEN.ID]) {
	    qs_map_delete(global.TGMS_MAP_TWEEN, argument0[TWEEN.ID]); // Invalidate tween handle
	    qs_map_delete(SharedTweener().simpleTweens, argument0[TWEEN.SIMPLE_KEY]); // Delete simple tween data
	    argument0[@ TWEEN.ID] = 0; // Nullify id reference
	    argument0[@ TWEEN.TARGET] = noone; // Clear target instance
	    argument0[@ TWEEN.STATE] = TWEEN_STATE.DESTROYED; // Set state as destroyed
    
	    if (argument0[TWEEN.EVENTS] != -1) { // IF tween events map exists
	        var _events = argument0[TWEEN.EVENTS]; // Cache events
	        var _key = qs_map_find_first(_events); // Find key to first event
	        
	        repeat(qs_map_size(_events)) { // Iterate events
	            var _event = _events[1][? _key]; // Get event	            
	            var _cbIndex = 0; // Iterate through event callbacks
	            repeat(qs_list_size(_event)-1) {
	                var _cb = _event[1][| ++_cbIndex]; // Get callback
	                qs_map_delete(global.TGMS_MAP_CALLBACK, _cb[2]); // Invalidate callback handle
	            }
				
				_key = qs_map_find_next(_events, _key); // Find key for next event
	        }
	    }
	    
	    if (argument0[TWEEN.DELAYS] != -1) { // IF tween delays list exists
	        var _delays = argument0[TWEEN.DELAYS]; // Cache tween delays
	        var _dIndex = -1; // Iterate through delays
	        repeat(qs_list_size(_delays)) {
	            var _delay = _delays[1][| ++_dIndex]; // Get delay
	            qs_map_delete(global.TGMS_MAP_DELAY, _delay[8]); // Invalidate delay handle
	        }
	    }
	}
}
