/// @description  TGMS_Tweener_Destroy()
/// @function  TGMS_Tweener_Destroy
function TGMS_Tweener_Destroy() {

	//-------------------------------------------------
	// Destroy Tweens and Delays for Persistent Rooms
	//-------------------------------------------------
	TweenSystemClearAllRooms();

	//---------------------------------------------
	// Destroy remaining tweens
	//---------------------------------------------
	var _tweens = tweens;
	var _index = qs_list_size(_tweens);
	repeat(_index)
	{   
	    // Get tween
	    var _tween = _tweens[1][| --_index]; 
	    // Remove tween from tweens list
	    qs_list_delete(_tweens, _index);
    
	    // Destroy tween delays list
	    if (_tween[TWEEN.DELAYS] != -1)
	    {
	        qs_list_destroy(_tween[TWEEN.DELAYS]);
	    }
    
	    // Destroy tween events if events map exists
	    if (_tween[TWEEN.EVENTS] != -1)
	    {
	        // Cache events
	        var _events = _tween[TWEEN.EVENTS];
        
	        // Iterate through events
	        repeat(qs_map_size(_events))
	        {
	            // Destroy event list
	            qs_list_destroy(_events[1][? qs_map_find_first(_events)]);
	            // Delete event key   
	            qs_map_delete(_events, qs_map_find_first(_events));
	        }
        
	        // Destroy events map
	        qs_map_destroy(_events);
	    }
	}

	// Remove self as shared tweener singleton
	global.TGMS_SharedTweener = noone;

	//---------------------------------------
	// Destroy Data Structures
	//---------------------------------------
	qs_list_destroy(tweens);
	qs_list_destroy(delayedTweens);
	qs_map_destroy(simpleTweens);
	qs_map_destroy(pRoomTweens);
	qs_map_destroy(pRoomDelays);
	qs_priority_destroy(eventCleaner);

	//---------------------------------------
	// Clear id reference maps
	//---------------------------------------
	qs_map_clear(global.TGMS_MAP_TWEEN);
	qs_map_clear(global.TGMS_MAP_DELAY);
	qs_map_clear(global.TGMS_MAP_CALLBACK);




}
