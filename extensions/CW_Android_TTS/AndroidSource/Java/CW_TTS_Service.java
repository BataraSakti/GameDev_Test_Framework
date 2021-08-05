//
//  Released by Collected Worlds 2016.
//  Copyright Collected Worlds 2016.
//

package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.CWFirebase;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.speech.tts.TextToSpeech;



import java.util.HashMap;
import java.util.Locale;
import java.util.List;

public class CW_TTS_Service extends Service implements TextToSpeech.OnInitListener{

    public static final String EXTRA_TTS_TEXT = "tts_text";
    public static final String EXTRA_KILLME = "tts_killme";
    public static final String EXTRA_LANG = "tts_language";
    private TextToSpeech tts;
    private boolean isInit;
    private String tts_text;
    private String sText;
    private String sLang = new String ("en"); // Add default to prevent Null Pointer execption if onStartCommand failed
    private Handler handler;

    private boolean is_done = false;
    private static CW_TTS_Service theContext = null;
    private final IBinder mBinder = new LocalBinder();
    private static CW_TTS_Config conf = null;

    private Looper mServiceLooper;
    private ServiceHandler mServiceHandler;

    private static CWFirebase firebase = null;

    private boolean useGoogleTTS = false;

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if(theContext != null && mServiceHandler != null && intent != null){
            Debug.show_debug("------- TTS SERVICE ONSTARTCOMMAND --------");

            sText = intent.getStringExtra(CW_TTS_Service.EXTRA_TTS_TEXT);
            int kCode = intent.getIntExtra(CW_TTS_Service.EXTRA_KILLME, 0);
            sLang = intent.getStringExtra(CW_TTS_Service.EXTRA_LANG);

            if(conf.getAutoKill() == false && kCode > 0) {
                is_done = true;
                stopSelf();
            } else {
                // For each start request, send a message to start a job and deliver the start ID so we know which request we're stopping when we finish the job
                Message msg = mServiceHandler.obtainMessage();
                msg.arg1 = startId;
                mServiceHandler.sendMessage(msg);
            }

            if(conf.getAutoKill() == true) {
                // If we get killed, meh
                return START_NOT_STICKY;
            } else {
                return START_NOT_STICKY;
            }
        } else {
            Debug.show_debug( "TTS onStartCommandFailed either theContext, ServiceHanlder or intent is NULL");
            stopSelf();
            return START_NOT_STICKY;
        }
    }

    @Override
    public void onCreate() {
        // Start up the thread running the service.  Note that we create a separate thread because the service normally runs in the process's
        // main thread, which we don't want to block.  We also make it background priority so CPU-intensive work will not disrupt our UI.
        Debug.show_debug("------- CALL TTS SERVICE CREATE --------");

        //firebase
        firebase = CWFirebase.getFirebase();
        if(firebase == null) { firebase = new CWFirebase(); }



        theContext = this;
        if (CW_TTS.prefered_TTS.equals("")){
            //use google as default
            CW_TTS.prefered_TTS = CW_TTS.google_tts;

        }
        if(CW_TTS.checkPackage(CW_TTS.prefered_TTS)) {
			CW_TTS.TTS_package_name = CW_TTS.prefered_TTS;
            tts = new TextToSpeech(theContext, this, CW_TTS.prefered_TTS); // Set TTS engine into prefered Engine.
			Debug.show_debug("TTS_Service Current TTS engine is set to "+CW_TTS.prefered_TTS);
			List<TextToSpeech.EngineInfo> Engines = tts.getEngines();
            for (TextToSpeech.EngineInfo e : Engines){
                Debug.show_debug("TTS_service installed engine: "+e.name);
            }


        }
        else {
            Debug.show_debug("TTS_Service onCreate TTS Engine "+CW_TTS.prefered_TTS+" is not installed, use device default");
            tts = new TextToSpeech(theContext, this);
        }

        if (CW_TTS.TTS_package_name.equals("")){

            CW_TTS.TTS_package_name = tts.getDefaultEngine();

        }
        if (CW_TTS.prefered_TTS.equals(CW_TTS.google_tts)) {
            useGoogleTTS = true;
        } else {

            useGoogleTTS = false;
        }


        tts.setOnUtteranceProgressListener(new CW_TTS_UtteranceListener());
        handler = new Handler();

        //conf
        conf = CW_TTS_Config.getTheConfig();
        if(conf == null) { conf = new CW_TTS_Config();}
        if(conf.isUseDefault()) {
            tts.setSpeechRate(1.0f);
            tts.setPitch(1.0f);
        } else {
            tts.setSpeechRate(conf.getSpeechRate());
            tts.setPitch(conf.getSpeechPitch());
        }

        HandlerThread thread = new HandlerThread("ServiceStartArguments", Process.THREAD_PRIORITY_BACKGROUND);
        thread.start();

        //Get the HandlerThread's Looper and use it for our Handler
        mServiceLooper = thread.getLooper();
        mServiceHandler = new ServiceHandler(mServiceLooper);
    }

    @Override
    public void onDestroy() {
        Debug.show_debug("------- CALL TTS SERVICE DESTROY --------");
        if (tts != null) {
            tts.stop();
            tts.shutdown();
        }

        //reset back the current TTS package name
        CW_TTS.TTS_package_name = "";
        super.onDestroy();
    }

    //Init listener
    @Override
    public void onInit(int status) {
        Debug.show_debug( "TTS onInit status = "+status+", useGoogleTTS: "+useGoogleTTS);
        if(tts != null){
            if (status == TextToSpeech.SUCCESS) {
                // int result = tts.setLanguage(Locale.US);
                int result = -1;
                switch(sLang) {
                    case "in":
                    case "id" : {
                        Locale loc = new Locale("id");
                        result = tts.setLanguage(loc);
                        break;
                    }
                    case "es" : {
                        Locale loc = new Locale("es");
                        result = tts.setLanguage(loc);
                        break;
                    }
                    case "pt" : {
                        Locale loc = new Locale("pt");
                        result = tts.setLanguage(loc);
                        break;
                    }
                    case "vi" : {
                        Locale loc = new Locale("vi");
                        result = tts.setLanguage(loc);
                        break;
                    }
                    case "en" : {
                        result = tts.setLanguage(Locale.US);
                        break;
                    }
                    case "hi" : {
                        Locale loc = new Locale("hi");
                        result = tts.setLanguage(loc);
                        break;
                    }
                    case "th" : {
                        Locale loc = new Locale("th");
                        result = tts.setLanguage(loc);
                        break;
                    }
                    default : {
                        result = tts.setLanguage(Locale.US);
                        break;
                    }
                }
                if (result == TextToSpeech.LANG_MISSING_DATA || result == TextToSpeech.LANG_NOT_SUPPORTED ) {

                    //fallback to EN
                    result = tts.setLanguage(Locale.US);
                    Debug.show_debug("TTS speak fallback to EN");
                }
                if (result != TextToSpeech.LANG_MISSING_DATA && result != TextToSpeech.LANG_NOT_SUPPORTED) {
                    Debug.show_debug("------- TTS SERVICE onInit Callback --------");
                    isInit = true;
                    //This is called here because we can't actually speak until the Init is done, and that is finished AFTER
                    //The message handler.  However if this has already been Iniitilized and not destroyed yet, then Init is not called again.
                    //This is why the message handler will check for isInit and try to speak() if true.
                    speak();
                }
            }
        }
    }

    private void speak() {
        if (tts != null) {
            tts_text = conf.getTtsString();
            tts.setSpeechRate(conf.getSpeechRate());
            tts.setPitch(conf.getSpeechPitch());

            int result = -1;
            switch(sLang) {
                case "in":
                case "id" : {
                    Locale loc = new Locale("id");
                    result = tts.setLanguage(loc);
                    break;
                }
                case "es" : {
                    Locale loc = new Locale("es");
                    result = tts.setLanguage(loc);
                    break;
                }
                case "pt" : {
                    Locale loc = new Locale("pt");
                    result = tts.setLanguage(loc);
                    break;
                }
                case "vi" : {
                    Locale loc = new Locale("vi");
                    result = tts.setLanguage(loc);
                    break;
                }
                case "en" : {
                    result = tts.setLanguage(Locale.US);
                    break;
                }
                case "hi" : {
                    Locale loc = new Locale("hi");
                    result = tts.setLanguage(loc);
                    break;
                }
                case "en-gb" : {
                    Locale loc = new Locale("en","GB");
                    result = tts.setLanguage(loc);
                    break;
                }
                case "en-in" :{
                    Locale loc = new Locale("en","IN");
                    result = tts.setLanguage(loc);
                    break;
                }
                case "th" :{
                    Locale loc = new Locale("th");
                    result = tts.setLanguage(loc);
                    break;
                }
                default : {
                    result = tts.setLanguage(Locale.US);
                    break;
                }
            }
            Debug.show_debug( "SAKTI TTS speak Lang = "+sLang+", result = "+result);
            if (result == TextToSpeech.LANG_MISSING_DATA || result == TextToSpeech.LANG_NOT_SUPPORTED ) {

                //fallback to EN
                if (result == TextToSpeech.LANG_MISSING_DATA) {
                    firebase.firebase_analytics_event_string("CANT_SPEAK_DATA", sLang);
                    Debug.show_debug( "SAKTI TTS speak CANT_SPEAK_DATA");
                }
                if (result == TextToSpeech.LANG_NOT_SUPPORTED) {
                    firebase.firebase_analytics_event_string("CANT_SPEAK_NOT_SUPPORTED", sLang);
                    Debug.show_debug( "SAKTI TTS speak CANT_SPEAK_NOT_SUPPORTED");
					/*Would only trigger TTS force restart only if the device use Google TTS package
					  For another TTS provider, we can't guarantee that the provider support the
					  intended voice pack, if its not, the ForceRestart would infinitely recursively triggered
					  and can lead to out of memory crash on low-end device*/

                    CW_TTS.setLangNotSupportedStatus(true);
                    if(useGoogleTTS){
                        CW_TTS.NotifyToForceRestart();
                    }
                }
                //firebase.firebase_analytics_event_string("CANT_SPEAK_Lang", sLang);
                result = tts.setLanguage(Locale.US);Debug.show_debug("TTS speak fallback to EN");
                Debug.show_debug( "SAKTI TTS speak TTS speak fallback to EN");
            } else {

                if (CW_TTS.getLangNotSupportedStatus()){
                    CW_TTS.setLangNotSupportedStatus(false);
                }

                //colling down the force restart cycle on each success speak attempt to give device clear-up memory.
                int forceRestartCycle = CW_TTS.getForceRestartCycle();
                if (forceRestartCycle > 0){

                    forceRestartCycle--;
                    CW_TTS.setForceRestartCycle(forceRestartCycle);
                }
            }

            Bundle params = new Bundle();
            params.putString(TextToSpeech.Engine.KEY_PARAM_UTTERANCE_ID, "");

            if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                //Because this is the new call...
                if(conf.getAddQue() == true) {
                    if(tts.isSpeaking()) {
                        tts.speak(tts_text, TextToSpeech.QUEUE_ADD, params, "UniqueID");
                    } else {
                        tts.speak(tts_text, TextToSpeech.QUEUE_FLUSH, params, "UniqueID");
                    }
                    conf.updateAddQue(false);
                } else {
                    tts.speak(tts_text, TextToSpeech.QUEUE_FLUSH, params, "UniqueID");
                }
            } else {
                //But for version 15 - 20...
                HashMap<String, String> hmap = new HashMap<String, String>();
                hmap.put("KEY_PARAM_UTTERANCE_ID", "UniqueID");
                if(conf.getAddQue() == true) {
                    if(tts.isSpeaking()) {
                        tts.speak(tts_text, TextToSpeech.QUEUE_ADD, hmap);
                    } else {
                        tts.speak(tts_text, TextToSpeech.QUEUE_FLUSH, hmap);
                    }
                    conf.updateAddQue(false);
                } else {
                    tts.speak(tts_text, TextToSpeech.QUEUE_FLUSH, hmap);
                }
            }
        }
    }

    @Override
    public IBinder onBind(Intent intent) {
        return mBinder;
    }

    public static CW_TTS_Service getTheContext() {
        return (CW_TTS_Service)theContext;
    }

    public void killActivity() {
        is_done = true;
        this.stopSelf();
    }

    //Support Classes
    private final class ServiceHandler extends Handler {
        //Handler that receives messages from the thread
        public ServiceHandler(Looper looper) {
            super(looper);
        }
        @Override
        public void handleMessage(Message msg) {
            //Do Work Here...
            Debug.show_debug("------- CALL TTS SERVICE onHandleIntent --------");
            Handler mainHandler = new Handler(Looper.getMainLooper());

            Runnable myRunnable = new Runnable() {
                @Override
                public void run() {
                    //Debug.show_debug("------- TTS RUN SERVICE HANDLER) --------");

                    if (isInit) {
                        //If we are called again but our service still exists.
                        speak();
                    }

                    if(conf.getAutoKill() == true) {
                        handler.removeCallbacksAndMessages(null);
                        handler.postDelayed(new Runnable() {

                            @Override
                            public void run() {
                                is_done = true;
                                stopSelf();
                            }
                        }, (long)conf.getAutoKillTime()*1000);
                    }

                    //End stuff I'm trying to run on the main thread...
                }
            };
            mainHandler.post(myRunnable);

            // Stop the service using the startId, so that we don't stop the service in the middle of handling another job
            //stopSelf(msg.arg1);
        }
    }

    public class LocalBinder extends Binder {
        CW_TTS_Service getService() {
            return CW_TTS_Service.this;
        }
    }
}