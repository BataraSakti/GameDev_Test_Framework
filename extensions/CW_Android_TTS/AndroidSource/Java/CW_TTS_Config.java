//
//  Released by Collected Worlds 2017.
//  Copyright Collected Worlds 2017.
//

package ${YYAndroidPackageName};
import android.speech.RecognizerIntent;
import android.util.Log;

public class CW_TTS_Config {
	private static CW_TTS_Config me = null;
	private static boolean useDefault = true;
	private static String ttsString = " ";
	private static boolean bAutoKill = true;
	private static double dAutoKillTime = 15.0f;
	private static float fSpeechRate = 1.0f;
	private static float fSpeechPitch = 1.0f;
	private static boolean bAddQue = false;
	
	public CW_TTS_Config() {
		Debug.show_debug("------- CALL TTS CREATE SETTINGS --------");
		me = this;
		useDefault = true;
	}
	
	public static CW_TTS_Config getTheConfig() {
		if(me != null) {
			return me;
		} else {
			Debug.show_debug("------- TTS SETTINGS NOT READY --------");
			return null;
		}
	}
	
	//Settings
	//Use Default
	public void updateUseDefault(boolean val) {
		useDefault = val;
		if(useDefault == true) {
			ttsString = " ";
			bAutoKill = true;
			dAutoKillTime = 15.0f;
			fSpeechPitch = 1.0f;
			fSpeechRate = 1.0f;
		}
	}
	
	public boolean isUseDefault() {
		return useDefault;
	}
	
	//TTS String
	public void updateTtsString(String val) {
		ttsString = val;
	}
	
	public String getTtsString() {
		return ttsString;
	}
	
	//Do Auto Kill
	public void updateAutoKill(boolean val) {
		bAutoKill = val;
	}
	
	public boolean getAutoKill() {
		return bAutoKill;
	}
	
	//Auto Kill Time
	public void updateAutoKillTime(double val) {
		dAutoKillTime = val;
	}
	
	public double getAutoKillTime() {
		return dAutoKillTime;
	}
	
	//Speech Rate
	public void updateSpeechRate(float val) {
		fSpeechRate = val;
	}
	
	public float getSpeechRate() {
		return fSpeechRate;
	}
	
	//Speech Pitch
	public void updateSpeechPitch(float val) {
		fSpeechPitch = val;
	}
	
	public float getSpeechPitch() {
		return fSpeechPitch;
	}
	
	//Add Que
	public void updateAddQue(boolean val) {
		bAddQue = val;
	}
	
	public boolean getAddQue() {
		return bAddQue;
	}
	
}