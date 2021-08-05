/// @description  TGMS_Tweener_RoomStart()
/// @function  TGMS_Tweener_RoomStart
function TGMS_Tweener_RoomStart() {

	// Reset index cleaners
	autoCleanIndex = 0;

	if (room_persistent)
	{   
	    // Cache tweens list
	    var _tweens = tweens; 
	    // Cache delayed tweens
	    var _delayedTweens = delayedTweens;
	    // Cache room name for map key
	    var _key = room;
	    // Tell obj_SharedTweener to remain persistent
	    keepPersistent = true;
    
	    // IF stored tween data exists for persistent room
	    if (ds_map_exists(pRoomTweens, _key))
	    {
	        // Cache queue of room's tweens
	        var _queuedTweens = pRoomTweens[? _key];
        
	        // Iterate through queue, adding stored tweens back to main tween list
	        repeat(ds_queue_size(_queuedTweens))
	        {
	            ds_list_add(_tweens, ds_queue_dequeue(_queuedTweens));
	        }
	    }
    
	    // IF stored tween delay data exists for persistent room
	    if (ds_map_exists(pRoomDelays, _key))
	    {
	        // Cache queue of room's delayed tweens
	        var _queuedDelays = pRoomDelays[? _key];
        
	        // Iterate through queue, adding stored tween delays back to main tween delay list
	        repeat(ds_queue_size(_queuedDelays))
	        {
	            ds_list_add(_delayedTweens, ds_queue_dequeue(_queuedDelays));
	        }
	    }
	}




}
