/// @description  TGMS_Tweener_Create()
/// @function  TGMS_Tweener_Create
function TGMS_Tweener_Create() {

	// Set default global settings IF first time creating shared tweener
	if (global.TGMS_FirstLoad)
	{   
	    global.TGMS_FirstLoad = false; // Prevent future default setup calls
	    global.TGMS_IsEnabled = true; // System's active state boolean
	    global.TGMS_TimeScale = 1.0; // Effects overall speed of how fast system plays tweens/delays
	    global.TGMS_MinDeltaFPS = 10; // The lowest framerate before delta tweens will begin to lag behind (Ideally, keep between 10-15)
	    global.TGMS_UpdateInterval = 1.0; // Sets how often (in steps) system will update (1 = default, 2 = half speed, 0.5 = double speed) DO NOT set as 0 or below!
	    global.TGMS_AutoCleanIterations = 10; // Limits, each step, number of tweens passively checked by memory manager (Default:10)
	    global.TGMS_SimpleTweensUseDelta = false; // Toggles simple tweens between using step/frame and delta/seconds timing
	}

	// Assign global values to instance variables
	isEnabled = global.TGMS_IsEnabled;
	timeScale = global.TGMS_TimeScale;
	minDeltaFPS = global.TGMS_MinDeltaFPS;
	updateInterval = global.TGMS_UpdateInterval;
	autoCleanIterations = global.TGMS_AutoCleanIterations;
	simpleTweensUseDelta = global.TGMS_SimpleTweensUseDelta;

	// System maintenance variables
	tick = 0; // System update timer
	autoCleanIndex = 0; // Used for processing step tweens' passive memory manager
	keepPersistent = false; // Becomes true if tweening used in persistent room
	maxDelta = 1/minDeltaFPS; // Cache delta cap
	deltaTime = delta_time/1000000; // Let's make delta time more practical to work with, shall we?
	prevDeltaTime = deltaTime;
	deltaRestored = false; // Used to help maintain predictable delta timing
	timeScales[0] = timeScale;
	timeScales[1] = timeScale*deltaTime;

	// Data structures
	tweens = qs_list_create(); // Stores automated step tweens
	delayedTweens = qs_list_create(); // Stores tween delay data
	simpleTweens = qs_map_create(); // Used for simple tweens
	pRoomTweens = qs_map_create(); // Associates persistent rooms with stored tween lists
	pRoomDelays = qs_map_create(); // Associates persistent rooms with stored tween delay lists
	eventCleaner = qs_priority_create(); // Used to clean callbacks from events




}
