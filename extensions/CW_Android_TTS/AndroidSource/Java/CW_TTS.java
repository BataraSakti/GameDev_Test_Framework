//
//  Released by Collected Worlds 2017.
//  Copyright Collected Worlds 2017.
//

package ${YYAndroidPackageName};
//import ${YYAndroidPackageName}.R;
import ${YYAndroidPackageName}.RunnerActivity;
import ${YYAndroidPackageName}.CWFirebase;
import com.yoyogames.runner.RunnerJNILib;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.app.ActivityManager.RunningServiceInfo;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.speech.tts.TextToSpeech;


//import android.app.Service;


public class CW_TTS extends RunnerSocial {
    static final int TTS_CHECK_CODE = 101;
    static final int EVENT_OTHER_SOCIAL=70;
    private static CWFirebase firebase = null;

    //String text;
    //TextToSpeech tts;
    public static Activity activity = null;
    CW_TTS_Service mService;
    boolean mBound = false;
    boolean bIsTTS = true;
    private static CW_TTS_Config conf = null;
    private String cached_val = "";
    private double cached_addQue = 0.0;
    private String cached_lang = "";
    private static boolean failed_lang_not_suported = false;
    private static int MIN_AV_RAM = 256;
    private static int force_restart_cycle = 0;
    private static final int max_force_restart_cycle = 100;
    public static String TTS_package_name = "";
    public static String prefered_TTS = "";
    public static String google_tts = "com.google.android.tts";
	public static String jio_tts = "com.android.app.jio.voiceassist";

    public double CW_TTS_Available() {
        Debug.show_debug( "------- Check if TTS is available --------");
        if (bIsTTS) {
            return 1.0f;
        } else {
            return 0.0f;
        }
    }

    public static void NotifyToForceRestart(){

        if (failed_lang_not_suported && getAvailableRam() < MIN_AV_RAM){
            //The device doesn't have the supported voice pack yet and the available RAM is below 256MB
            //will not trigger the TTS force restart chain. The TTS would back to normal when
            //the TTS engine can provide the supported voice pack
            Debug.show_debug( "NotifyToForceRestart Lang Not supported and Low Memory");

        } else if (force_restart_cycle >= max_force_restart_cycle){
            Debug.show_debug( "NotifyToForceRestart too much force restart attemp, will wait until it cooldown");

        }else {
            int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
            RunnerJNILib.dsMapAddString(dsMapIndex, "type", "CW_TTS_FORCE_RESTART");

            RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
            force_restart_cycle++;
        }
    }

    public void CW_TTS_Force_Restart(){
        Debug.show_debug( "TTS force restart with cached_val: "+cached_val+", cached_addQue: "+cached_addQue+", cached_lang: "+cached_lang);
        CW_TTS_Stop();
        if (isTTSServiceRunning()){
            CW_TTS_Speak(cached_val, cached_addQue, cached_lang);
        } else {
            //Notify the system to force restart again
            NotifyToForceRestart();
        }

    }

    public void CW_TTS_Speak(String val, double addQue, String lang) {
        Debug.show_debug( "------- TTS Speak --------");
        cached_val = val; cached_addQue = addQue; cached_lang = lang;
        if(conf == null) { conf = new CW_TTS_Config();}
        conf.updateTtsString(val);
        if(addQue >= 0.5) {
            conf.updateAddQue(true);
        }
        Intent speakIntent = new Intent(activity, CW_TTS_Service.class);
        speakIntent.putExtra(CW_TTS_Service.EXTRA_LANG,lang);
        activity.startService(speakIntent);
    }

    public void CW_TTS_Stop() {
        if(conf == null) { conf = new CW_TTS_Config();}
        if(conf.getAutoKill() == true) {
            Debug.show_debug( "------- TTS Will Auto Kill Service --------");
        } else {
            Debug.show_debug( "------- TTS Stop Service --------");
            conf.updateTtsString("");
            Intent speechIntent = new Intent(activity, CW_TTS_Service.class);
            speechIntent.putExtra(CW_TTS_Service.EXTRA_KILLME, 1);
            activity.stopService(speechIntent);
        }
    }

    public void CW_TTS_Install() {
        Debug.show_debug( "------- TTS Install required from appstore --------");
        // Intent installIntent = new Intent();
        // installIntent.setAction(TextToSpeech.Engine.ACTION_INSTALL_TTS_DATA);
        // activity.startActivity(installIntent);

        Intent intent =  new Intent(activity, CW_TTS_GoogleTTSChecker.class);
        activity.startActivity(intent);
    }

    //Config Handlers
    public void CW_TTS_UseDefaultSettings(double val) {
        //if(conf == null) { conf = new CW_TTS_Config();}
        //This must be set BEFORE the call to speak is made if you do not want to autokill
        boolean t__ = false;
        if(val > 0.5) { t__ = true; }
        conf.updateUseDefault(t__);
    }

    public void CW_TTS_AutoKill(double val) {
        //if(conf == null) { conf = new CW_TTS_Config();}
        //This must be set BEFORE the call to speak is made if you do not want to autokill
        boolean t__ = false;
        if(val > 0.5) { t__ = true; }
        conf.updateAutoKill(t__);
    }

    public void CW_TTS_UpdateAutoKillTime(double val) {
        //if(conf == null) { conf = new CW_TTS_Config();}
        //This must be set BEFORE the call to speak is made
        conf.updateAutoKillTime((double)val);
    }

    public void CW_TTS_UpdateSpeechRate(double val) {
        //if(conf == null) { conf = new CW_TTS_Config();}
        //This must be set BEFORE the call to speak is made
        conf.updateSpeechRate((float)val);
    }

    public void CW_TTS_UpdateSpeechPitch(double val) {
        //if(conf == null) { conf = new CW_TTS_Config();}
        //This must be set BEFORE the call to speak is made
        conf.updateSpeechPitch((float)val);
    }

    //IF you reset the above after calling speak - they will not apply until AFTER the service resets or you call speak again.
    //It MAY crash if you force kill it by disabiling autokill on an exisiting service before calling stop on it.

    //lifecycle methods
    @Override
    public void onStart() {
        Debug.show_debug( "------- CALL TTS CREATE --------");
        super.onStart();
        //firebase
        firebase = CWFirebase.getFirebase();
        if(firebase == null) { firebase = new CWFirebase(); }

        activity = RunnerActivity.CurrentActivity;
        conf = new CW_TTS_Config();
    }

    public void CW_TTS_GMS_Init() {
        Debug.show_debug( "------- CALL CW_TTS_GMS_Init --------");
        if(conf == null) { conf = new CW_TTS_Config();}
        Intent checkIntent = new Intent();
        checkIntent.setAction(TextToSpeech.Engine.ACTION_CHECK_TTS_DATA);
        //activity.startActivityForResult(checkIntent, TTS_CHECK_CODE);
        if (!Macros.IS_JIO){

            prefered_TTS = google_tts;
        } else {
            prefered_TTS = jio_tts;

        }

    }

    @Override
    public void onStop() {
        Debug.show_debug( "------- CALL TTS DESTROY --------");

        if (mBound) {
            //activity.unbindService(mConnection);
            mBound = false;
        }

        conf = null;

        CW_TTS_Stop();

        super.onStop();
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        switch(requestCode) {
            case TTS_CHECK_CODE: {
                if (resultCode == TextToSpeech.Engine.CHECK_VOICE_DATA_PASS) {
                    // success
                    Debug.show_debug( "------- TTS CHECK_VOICE_DATA_PASS --------");
                    bIsTTS = true;
                } else {
                    // missing data
                    Debug.show_debug( "------- TTS CHECK_VOICE_DATA_PASS FAILED --------");
                    bIsTTS = false;
                }
                break;
            }
			/*
			default: {
				Debug.show_debug( "------- TTS Unknown requestCode " + requestCode + " --------");
				break;
			}
			*/
        }

        super.onActivityResult(requestCode, resultCode, data);
    }

    //Batara Add
    //Detect Google TTS Installation, prompt user to install it if not installed yet.
    public double CW_TTS_CheckGoogleTTSInstallation(){

        final String appPackageName = "com.google.android.tts";
        boolean isGoogleTTSInstalled = checkPackage(appPackageName);
        double isInstalled = (double) 1.0;

        if(!isGoogleTTSInstalled){

            Debug.show_debug("Google TTS not installed, prompt user to install it");
            // Intent intent =  new Intent(activity, CW_TTS_GoogleTTSChecker.class);
            // activity.startActivity(intent);
            isInstalled = (double) 0.0;

        }

        return isInstalled;
    }

    public static boolean checkPackage(String packageName){
        PackageManager pm = null;
		Debug.show_debug("CW_TTS checkPackage packageName: "+packageName);
        if(activity == null){

            activity = RunnerActivity.CurrentActivity;
        }
        if(activity != null){
            try{
                pm = activity.getPackageManager();
            } catch (java.lang.NullPointerException e){
                Debug.show_debug("actitvity might be null, try to reinvoke it");
                activity = RunnerActivity.CurrentActivity;
                try{
                    pm = activity.getPackageManager();
                } catch (java.lang.NullPointerException err){
                    if(firebase == null) { firebase = new CWFirebase(); }
                    firebase.firebase_crashlytics_exception(err);
                }
            }

            try {
                if (pm != null){

                    pm.getPackageInfo(packageName, PackageManager.GET_ACTIVITIES);
					Debug.show_debug("CW_TTS checkPackage packageName: "+packageName+" FOUND");
                    return true;
                }
            } catch (PackageManager.NameNotFoundException e) {
                //firebase.firebase_crashlytics_exception(e);
                if(firebase == null) { firebase = new CWFirebase(); }
                firebase.firebase_analytics_event_string("TTS_MISSING_PACKAGE", "MISSING_TTS_Package");
            }
        }
        return false;
    }

    public void CW_TTS_GoTo_GoogleTTSMarket() {
        if(firebase == null) { firebase = new CWFirebase(); }
        firebase.firebase_analytics_event_string("TTS_GOTO_MARKET", "Get_TTS_Package");
        Intent intent =  new Intent(activity, CW_TTS_GoogleTTSChecker.class);
        activity.startActivity(intent);
    }

    public String CW_TTS_Get_Current_Package_Name(){

        return TTS_package_name;
    }

    private boolean isTTSServiceRunning (){

        if(RunnerActivity.CurrentActivity != null){
            ActivityManager actManager = (ActivityManager) RunnerActivity.CurrentActivity.getSystemService(Context.ACTIVITY_SERVICE);
            for (RunningServiceInfo serviceInfo : actManager.getRunningServices(Integer.MAX_VALUE)) {
                if (CW_TTS_Service.class.getName().equals(serviceInfo.service.getClassName())) {
                    Debug.show_debug( " isTTSServiceRunning TRUE");
                    return true;
                }
            }
        }
        Debug.show_debug( " isTTSServiceRunning FALSE");
        return false;

    }

    public double CW_TTS_Set_Prefered_Engine(String engine_package){
        CW_TTS.prefered_TTS = engine_package;
        Debug.show_debug("CW_TTS prefered engine set to "+engine_package);
		
		if (isTTSServiceRunning()){
			//force stop the service so that the next start the new prefered engine is used.
			conf.updateTtsString("");
			Intent speechIntent = new Intent(activity, CW_TTS_Service.class);
			speechIntent.putExtra(CW_TTS_Service.EXTRA_KILLME, 1);
			activity.stopService(speechIntent);
		}
        return 0.0;
    }

    public static void setLangNotSupportedStatus(boolean status){

        failed_lang_not_suported = status;
    }

    public static boolean getLangNotSupportedStatus(){
        return failed_lang_not_suported;
    }

    private static double getAvailableRam(){
        ActivityManager actManager = (ActivityManager) RunnerActivity.CurrentActivity.getSystemService(Context.ACTIVITY_SERVICE);
        MemoryInfo memInfo = new ActivityManager.MemoryInfo();
        actManager.getMemoryInfo(memInfo);
        double t_out = memInfo.availMem/1024/1024;
        return t_out;

    }

    public static int getForceRestartCycle(){

        return force_restart_cycle;
    }

    public static void setForceRestartCycle(int cycle){

        force_restart_cycle = cycle;
    }

	/* public void CW_TTS_Set_Language (String language) {
		OsLanguage = language;
	} */
}
