/// @description  TGMS_Tweener_RoomEnd()
/// @function  TGMS_Tweener_RoomEnd
function TGMS_Tweener_RoomEnd() {
	var _tweens = tweens;
	var _tempPersistent = false;

	//------------------------------------------
	// Handle Persistent Room
	//------------------------------------------
	if (room_persistent) {
	    // Set map key as room id
	    var _key = room;
	    // Tell shared tweener to remain persistent -- tell it who's boss!
	    keepPersistent = true;
    
	    // Create persistent queue for room if it doesn't exist
	    if (ds_map_exists(pRoomTweens, _key) == false) {
	        ds_map_replace(pRoomTweens, _key, ds_queue_create());
	    }
    
	    // Cache room's tween queue
	    var _pRoomQueue = pRoomTweens[? _key]; 
        
	    // Add tweens to persistent room data 
	    var _index = qs_list_size(_tweens);
	    repeat(_index) {
	        var _tween = _tweens[1][| --_index];
	        var _target = _tween[TWEEN.TARGET];
        
	        if (instance_exists(_target)) {
	            if (_target.persistent == false) {
	                // Add tween to persistent room queue
	                ds_queue_enqueue(_pRoomQueue, _tween);
	                // Remove from main tween list
	                ds_list_delete(_tweens, _index);
	            }
	        } else {
	            // Attempt to activate target
	            instance_activate_object(_target);
            
	            if (instance_exists(_target)) {
	                if (_target.persistent == false) {
	                    // Add tween to persistent room queue
	                    ds_queue_enqueue(_pRoomQueue, _tween);
	                    // Remove from main tween list
	                    ds_list_delete(_tweens, _index);
	                }
                
	                // Put target back to deactivated state
	                instance_deactivate_object(_target); 
	            } else {
	                TGMS_TweenDestroyRaw(_tween);
	            }
	        }
	    }
    
	    //----------------------
	    //  Handle delays
	    //----------------------
	    // Cache room's tween queue
	    var _pRoomDelays = pRoomDelays[? _key]; 
    
	    // Iterate through all delayed tweens
	    var _index = ds_list_size(delayedTweens);
	    repeat(_index) {
	        // Get tween
	        var _tween = delayedTweens[| --_index];
	        // Get target
	        var _target = _tween[TWEEN.TARGET];
        
	        // IF target exists
	        if (instance_exists(_target)) {
	            // IF target is not persistent
	            if (_target.persistent == false) {
	                // Remove delay from main delay list
	                ds_list_delete(delayedTweens, _index);
	                // Add delay to persistent room queue
	                ds_queue_enqueue(_pRoomDelays, _tween);
	            }
	        } else {
	            // Attempt to activate target
	            instance_activate_object(_target);
            
	            // IF target now exists
	            if (instance_exists(_target)) {
	                // IF target is not persistent
	                if (_target.persistent == false) {
	                    // Remove delay from main delay list
	                    ds_list_delete(delayedTweens, _index);
	                    // Add delay to persistent room queue
	                    ds_queue_enqueue(_pRoomDelays, _tween);
	                }
                
	                // Put target back to deactivated state
	                instance_deactivate_object(_target);   
	            }
	        }
	    }             
	} else { 
	    //------------------------------------------------
	    // Handle Non-Persistent Room
	    //------------------------------------------------ 
	    var _index = qs_list_size(_tweens);
	    repeat(_index) {  
	        // Get tween
	        var _tween = _tweens[1][| --_index];
	        var _target = _tween[TWEEN.TARGET];
        
	        // IF target exists and is persistent, signal tweening system to be persistent
	        if (instance_exists(_target)) {
	            // IF target is persistent
	            if (_target.persistent) {
	                // Signal system to remain persistent
	                _tempPersistent = true;
	            } else {
	                // Signal tween to be destroyed
	                TGMS_TweenDestroyRaw(_tween);
	            }
	        } else {
	            // Attempt to activate instance
	            instance_activate_object(_target);
            
	            // IF target now exists
	            if (instance_exists(_target)) {
	                // IF target is persistent
	                if (_target.persistent) {
	                    // Signal system to remain persistent
	                    _tempPersistent = true;
	                } else {
	                    // Signal tween to be destroyed
	                    TGMS_TweenDestroyRaw(_tween);
	                }
                
	                // Put target back to deactive state
	                instance_deactivate_object(_target);
	            } else {
	                // Signal tween to be destroyed
	                TGMS_TweenDestroyRaw(_tween);
	            }
	        }
	    }
	}

	//-----------------------------------------------------
	// Destroy Shared Tweener if not set as persistent
	//-----------------------------------------------------
	if (keepPersistent || _tempPersistent)  {
	    persistent = true;
	} else  {
	    instance_destroy();
	}
}
