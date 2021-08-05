//
//  Released by Collected Worlds 2017.
//  Copyright Collected Worlds 2017.
//

package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.RunnerActivity;
import com.yoyogames.runner.RunnerJNILib;
import android.util.Log;
import android.speech.tts.UtteranceProgressListener;

public class CW_TTS_UtteranceListener extends UtteranceProgressListener {
	static final int EVENT_OTHER_SOCIAL=70;
	
    //UtteranceProgressListener
	@Override
	public void onDone (String utteranceId) {
		Debug.show_debug("------- TTS onDone --------"); 
		sendGMS("done", "1");
	}
	
	@Override
	public void onError (String utteranceId) {
		Debug.show_debug("------- TTS onError --------"); 
		sendGMS("error", "1");
	}
	
	@Override
	public void onStart (String utteranceId) {
		Debug.show_debug("------- TTS onStart --------"); 
		sendGMS("start", "1");
	}
	
	private void sendGMS(String key, String val) {
		Debug.show_debug("------- TTS SEND MESSAGE --------"); 
		int dsMapIndex = RunnerJNILib.jCreateDsMap( null, null, null );
		RunnerJNILib.DsMapAddString( dsMapIndex,"type", "CW_TTS" );	
		RunnerJNILib.DsMapAddString( dsMapIndex, key, val );
		RunnerJNILib.CreateAsynEventWithDSMap( dsMapIndex, EVENT_OTHER_SOCIAL );    	
	}
}