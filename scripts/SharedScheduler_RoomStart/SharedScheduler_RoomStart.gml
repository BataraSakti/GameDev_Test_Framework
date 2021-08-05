function SharedScheduler_RoomStart() {
	//show_debug("Shared Scheduler Room Start");
	/// SharedScheduler_RoomStart()

	// Restore schedules for persistent rooms
	if (room_persistent)
	{
	    // Tell shared scheduler to remain persistent
	    keepPersistent = true;
	    // Cache room name for map key
	    var _key = room;
    
	    // IF the persistent room has stored schedules
	    if (ds_map_exists(pRoomSchedules, _key))
	    {
	        // Cache queue of room's schedules
	        var _queuedSchedules = pRoomSchedules[? _key];
	        // Cache schedules list
	        var _schedules = schedules; 
        
	        // Add stored tweens back to main schedules list
	        repeat(ds_queue_size(_queuedSchedules))
	        {
	            ds_list_add(_schedules, ds_queue_dequeue(_queuedSchedules));
	        }
	    }
	}




}
