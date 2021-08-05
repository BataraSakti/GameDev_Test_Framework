function SharedScheduler_RoomEnd() {
	//show_debug("Shared Scheduler Room End");
	/// SharedScheduler_RoomEnd()

	var _schedules = schedules;
	var _tempPersistent = false;

	//------------------------------------------
	// Handle Schedules for Persistent Room
	//------------------------------------------
	if (room_persistent)
	{
	    // Use room index as map key for storing schedules
	    var _key = room;
	    // Tell shared scheduler to remain persistent -- tell it who's boss!
	    keepPersistent = true;
	    // Create persistent queue for room if it doesn't exist
	    if (qs_map_exists(pRoomSchedules, _key) == false) { qs_map_replace(pRoomSchedules, _key, qs_queue_create()); }
	    // Cache room's schedule queue
	    var _pRoomQueue = pRoomSchedules[1][? _key]; 
        
	    // Add schedules to persistent room data 
	    var _index = qs_list_size(_schedules); // Start index checking at schedule list size
	    repeat(_index)
	    {  
	        // Cache schedule
	        var _schedule = _schedules[1][| --_index];
	        // Cache target
	        var _target = _schedule[SGMS_SCHEDULE.TARGET];
        
	        // IF target exists and is not persistent...
	        if (instance_exists(_target))
	        {
	            if (_target.persistent == false)
	            {
	                // Remove from main schedule list
	                qs_list_delete(_schedules, _index);
	                // Add schedule to persistent room queue
	                qs_queue_enqueue(_pRoomQueue, _schedule);
	            }
	        }
	        else
	        {
	            // Attempt to activate instance
	            instance_activate_object(_target);
            
	            // IF the instance now exists
	            if (instance_exists(_target))
	            {
	                // IF instance is not persistent
	                if (_target.persistent == false)
	                {
	                    // Remove from main schedule list
	                    qs_list_delete(_schedules, _index);
	                    // Add schedule to persistent room queue
	                    qs_queue_enqueue(_pRoomQueue, _schedule);
	                }
                
	                // Put instance back to deactivated state
	                instance_deactivate_object(_target);
	            }
	        }
	    }
	}
	else
	{ 
	    //------------------------------------------------
	    // Handle Schedules for Non-Persistent Room
	    //------------------------------------------------ 
	    var _index = qs_list_size(_schedules);
	    repeat(_index)
	    {  
	        // Cache schedule
	        var _schedule = _schedules[1][| --_index];
        
	        // IF target exists and is persistent, signal system to be persistent
	        if (instance_exists(_schedule[SGMS_SCHEDULE.TARGET]) && _schedule[SGMS_SCHEDULE.TARGET].persistent)
	        {
	            _tempPersistent = true;
	        }
	        else
	        {
	            // Remove schedule from schedules list
	            qs_list_delete(_schedules, _index);
	            // Clear schedule handle
	            qs_map_delete(global.SGMS_MAP_SCHEDULES, _schedule[9]);
	        }
	    }
	}

	//-----------------------------------------------------
	// Destroy Shared Scheduler if not set as persistent
	//-----------------------------------------------------
	if (keepPersistent || _tempPersistent) 
	{
	    persistent = true;
	}
	else 
	{
	    instance_destroy();
	}




}
