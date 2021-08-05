/*
Batara - Add 

Activity class to check whether the Google TTS installed on device or not.

Google TTS is reccomended since there's no spelling mistake and the voice pack quality is good

*/

package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.RunnerActivity;
import android.content.pm.PackageManager;
import android.Manifest;
//import android.support.v4.app.ActivityCompat;
//import android.support.v4.content.ContextCompat;
import android.content.Intent;
import android.app.Activity;
import android.util.Log;
import android.os.Build;
import android.net.Uri;
import android.content.pm.ResolveInfo;
import android.content.pm.ActivityInfo;
import android.content.ComponentName;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Context ;
import android.view.View;
import java.util.List;
import ${YYAndroidPackageName}.CWFirebase;

public class CW_TTS_GoogleTTSChecker extends Activity
{
	private static String GoogleTTSPackageName = "com.google.android.tts";
	private static CWFirebase firebase = null;
	
	@Override
	protected void onStart()
	{
		super.onStart();
		
		//firebase
		firebase = CWFirebase.getFirebase();
		if(firebase == null) { firebase = new CWFirebase(); }
		
		installGoogleTTSPrompt(GoogleTTSPackageName);
	}
	
	
	@Override
	protected void onStop()
	{
		super.onStop();
	}
	
	@Override
	protected void onDestroy()
	{
		super.onDestroy();
	}
	
	@Override
	protected void onNewIntent(Intent intent)
	{
		super.onNewIntent(intent);
	}
	
	private void installGoogleTTSPrompt(String packageName){

		try {
			Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + packageName));
			
			 // find all applications able to handle our rateIntent
			final List<ResolveInfo> otherApps = getPackageManager()
			.queryIntentActivities(intent, 0);
			
			for (ResolveInfo otherApp: otherApps) {
				
			// look for Google Play application
				if (otherApp.activityInfo.applicationInfo.packageName
					.equals("com.android.vending")) {
					ActivityInfo otherAppActivity = otherApp.activityInfo;
					ComponentName componentName = new ComponentName(
							otherAppActivity.applicationInfo.packageName,
							otherAppActivity.name
							);
							
					// make sure it does NOT open in the stack of your activity
					intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
					
					// task reparenting if needed
					intent.addFlags(Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED);
					
					// if the Google Play was already open in a search result
					//  this make sure it still go to the app page you requested
					intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
					
					// this make sure only the Google Play app is allowed to
					// intercept the intent
					intent.setComponent(componentName);
					startActivity(intent);
					finish();
					break;

				}
			}
		} catch (android.content.ActivityNotFoundException anfe) {
			firebase.firebase_analytics_event_string("ActivityNotFoundException", packageName);
			Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://play.google.com/store/apps/details?id=" + packageName));
			startActivity(intent);
		}
	}
}