#import "CW_IOS_TTS.h"
#import <AVFoundation/AVFoundation.h>

extern bool F_DsMapAdd_Internal(int _index, char* _pKey, double _value);
extern bool F_DsMapAdd_Internal(int _index, char* _pKey, char* _pValue);
extern int CreateDsMap( int _num, ... );
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);


@implementation CW_IOS_TTS

bool bIsTTS = true;
NSString *cached_val = @"";
double cached_addQue = 0.0;
NSString *cached_lang = @"en-US";
static int EVENT_OTHER_SOCIAL=70;

// Default configuration
NSString *ttsString = @"";
bool bAutoKill = true;
double dAutoKillTime = 15.0;
double fSpeechPitch = 1.0;
double fSpeechRate = 1.0;
bool useDefault = YES;

AVSpeechSynthesizer *synthesizer;

- (double) CW_TTS_Available{
    NSLog(@"------- Check if TTS is available --------");
    if(bIsTTS){
        return 1.0;
    }else{
        return 0.0;
    }
}

- (void)CW_TTS_Force_Restart{
    NSLog(@"TTS force restart with cached_val: %@, cached_addQue: %f, cached_lang: %@", cached_val, cached_addQue, cached_lang);
    [self CW_TTS_Stop];
    [self CW_TTS_Speak:cached_val andAddQue:cached_addQue andLang:cached_lang];
}

- (void)CW_TTS_Stop{
    if(synthesizer){
        BOOL speechStopped =[synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        if(!speechStopped){
            [synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
        }
    }

}

-(void) CW_TTS_Install {
    NSLog(@"No need to install 3rd party STT library, it's supported natively by iOS");
}

-(void) CW_TTS_UseDefaultSettings:(double) val{
    if(val > 0.5) {
        ttsString = @"";
        bAutoKill = YES;
        dAutoKillTime = 15.0;
        fSpeechPitch = 1.0;
        fSpeechRate = 1.0;
    }
}

-(void) CW_TTS_AutoKill:(double) val{
    if(val > 0.5) {
        bAutoKill = YES;
    }else{
        bAutoKill = NO;
    }
}

-(void) CW_TTS_UpdateAutoKillTime:(double) val{
    dAutoKillTime = val;
}

-(void) CW_TTS_UpdateSpeechRate:(double) val{
    fSpeechRate = val;
}

-(void) CW_TTS_UpdateSpeechPitch:(double) val {
    fSpeechPitch = val;
}

-(void) CW_TTS_GMS_Init{
    NSLog(@"------- CALL CW_TTS_GMS_Init --------");
    synthesizer = [[AVSpeechSynthesizer alloc]init];
    // TODO
}

-(double) CW_TTS_CheckGoogleTTSInstallation{
    // By default, tts is always installed
    return 1.0;
}

-(bool) checkPackage{
    // since we're not using third party package, so no need to check package
    return false;
}

-(void)CW_TTS_GoTo_GoogleTTSMarket{
    // no need to go to appstore to download TTS
}

- (void) CW_TTS_Speak:(NSString *)val andAddQue:(double)addQue andLang:(NSString *) lang{
    NSLog(@"------- TTS Speak --------");
    cached_val = val; cached_addQue = addQue; cached_lang = lang;

    if(synthesizer == nil){
        [self CW_TTS_GMS_Init];
    }

    BOOL speechStopped =[synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    if(!speechStopped){
        [synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
    }

    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:val];
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:lang];
    if(voice){
        // If voice exists then do the speak
        utterance.voice = voice;
        // Set the configuration
        utterance.pitchMultiplier = (float) fSpeechPitch;
        utterance.rate = (float) fSpeechRate / 2;

        synthesizer.delegate = self;
        // Enunciate the word
        [synthesizer speakUtterance:utterance];
    }
}

-(void) speechSynthesizer:(AVSpeechSynthesizer *) synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *) utterance{
    NSLog(@"------- TTS onDone --------");
    [self sendGMS:@"done" andValue:@"1"];
}

-(void) speechSynthesizer:(AVSpeechSynthesizer *) synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    NSLog(@"------- TTS onStart --------");
    [self sendGMS:@"start" andValue:@"1"];
}

-(void) sendGMS:(NSString *)key andValue:(NSString *) val{
    NSLog(@"------- TTS SEND MESSAGE --------");
    int dsMapIndex = CreateDsMap(0);
    F_DsMapAdd_Internal(dsMapIndex, (char *)[@"type" UTF8String], (char *)[@"CW_TTS" UTF8String]);
    F_DsMapAdd_Internal(dsMapIndex, (char *)[key UTF8String], (char *)[val UTF8String]);
    CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
}



@end
