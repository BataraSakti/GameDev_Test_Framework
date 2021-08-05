/// @description  TweenGMS_Init()
/// @function  TweenGMS_Init
function TweenGMS_Init() {
	/*
	    !DO NOT CALL THIS!
	    Automatically called by the extension.
	*/

	global.TGMS_OptimiseYYC = false;

	// Declare global variable for holding shared tweener instance
	global.TGMS_SharedTweener = noone;
	global.TGMS_FirstLoad = true;

	//--------------------------------
	// Index Handle Management
	//--------------------------------
	global.TGMS_INDEX_TWEEN = 0;
	global.TGMS_INDEX_DELAY = 0;
	global.TGMS_INDEX_CALLBACK = 0;

	global.TGMS_MAP_TWEEN = -1;
	global.TGMS_MAP_DELAY = -1;
	global.TGMS_MAP_CALLBACK = -1;

	//-------------------------------
	// Declare Enum Constants
	//-------------------------------
	enum TWEEN_PLAY{ONCE,BOUNCE,PATROL,LOOP,REPEAT,DESTROY_TARGET}
	enum TWEEN_EVENT{PLAY,FINISH,STOP,PAUSE,RESUME,BOUNCE,LOOP,REPEAT,REVERSE}
	enum TWEEN_DELAY_EVENT{CANCEL,PAUSE,RESUME,FINISH}
	enum TWEEN_STATE{DESTROYED=-4,STOPPED=-10,PAUSED=-11}
	enum TWEEN_DELAY_STATE{CANCELED=-1,PAUSED,PLAYING}

	enum TWEEN_SIMPLE
	{
	    MOVE = 195225786,
	    FADE = 195225786*2,
	    SCALE = 195225786*3,
	    TURN = 195225786*4,
	    ROTATE = 195225786*5,
	    IMAGE_CYCLE = 195225786*6,
	    SPEED_RAMP = 195225786*7,
	    HVSPEED_RAMP = 195225786*8,
	    COLOUR = 195225786*9,
	    PATH = 195225786*10
	}

	enum TWEEN
	{
	    TIME=0,
	    START,
	    CHANGE,
	    DURATION,
	    STATE,
	    TIME_SCALE,
	    DELTA,
	    EASE,
	    PROPERTY,
	    TARGET,
	    GROUP,
	    DIRECTION,
	    EVENTS,
	    DELAYS,
	    DESTROY,
	    SIMPLE_KEY,
	    PLAY_MODE,
	    ID
	}

	enum TWEEN_DELAY
	{
	    TWEEN=0,
	    DELAY,
	    EASE,
	    START,
	    DESTINATION,
	    DURATION,
	    PLAY_MODE,
	    STATE,
	    ID,
	    EVENTS,
	    PROPERTY
	}

	enum TWEEN_CALLBACK
	{
	    TARGET=0,
	    SCRIPT,
	    ID
	}

	//---------------------------
	// Create Default Tween
	//---------------------------
	global.TGMS_TweenDefault[TWEEN.ID] = 0;
	global.TGMS_TweenDefault[TWEEN.TARGET] = noone;
	global.TGMS_TweenDefault[TWEEN.EASE] = EaseLinear;
	global.TGMS_TweenDefault[TWEEN.TIME] = 0;
	global.TGMS_TweenDefault[TWEEN.START] = 0;
	global.TGMS_TweenDefault[TWEEN.CHANGE] = 1;
	global.TGMS_TweenDefault[TWEEN.DURATION] = 1;
	global.TGMS_TweenDefault[TWEEN.PROPERTY] = 0;
	global.TGMS_TweenDefault[TWEEN.STATE] = TWEEN_STATE.STOPPED;
	global.TGMS_TweenDefault[TWEEN.TIME_SCALE] = 1;
	global.TGMS_TweenDefault[TWEEN.DELTA] = false;
	global.TGMS_TweenDefault[TWEEN.GROUP] = 0;
	global.TGMS_TweenDefault[TWEEN.EVENTS] = -1;
	global.TGMS_TweenDefault[TWEEN.SIMPLE_KEY] = -1; // I can probably remove this later
	global.TGMS_TweenDefault[TWEEN.DELAYS] = -1; // Could probably move this out to global ds_map
	global.TGMS_TweenDefault[TWEEN.DESTROY] = 0; // compact
	global.TGMS_TweenDefault[TWEEN.DIRECTION] = 1; // compact
	global.TGMS_TweenDefault[TWEEN.PLAY_MODE] = TWEEN_PLAY.ONCE; // compact

	//--------------------------
	// Create Default Delay
	//--------------------------
	global.TGMS_DelayDefault[TWEEN_DELAY.TWEEN] = 0;
	global.TGMS_DelayDefault[TWEEN_DELAY.DELAY] = 0;
	global.TGMS_DelayDefault[TWEEN_DELAY.EASE] = EaseLinear;
	global.TGMS_DelayDefault[TWEEN_DELAY.START] = 0;
	global.TGMS_DelayDefault[TWEEN_DELAY.DESTINATION] = 0;
	global.TGMS_DelayDefault[TWEEN_DELAY.DURATION] = 0;
	global.TGMS_DelayDefault[TWEEN_DELAY.PLAY_MODE] = TWEEN_PLAY.ONCE;
	global.TGMS_DelayDefault[TWEEN_DELAY.STATE] = TWEEN_DELAY_STATE.PLAYING;
	global.TGMS_DelayDefault[TWEEN_DELAY.ID] = 0;
	global.TGMS_DelayDefault[TWEEN_DELAY.EVENTS] = -1;
	global.TGMS_DelayDefault[TWEEN_DELAY.PROPERTY] = undefined;

	//---------------------------
	// Create Index Handle Maps
	//---------------------------
	global.TGMS_MAP_TWEEN = qs_map_create();
	global.TGMS_MAP_DELAY = qs_map_create();
	global.TGMS_MAP_CALLBACK = qs_map_create();



}
