/// @description scp_tts_pc_playbackaudiorate(rate);
/// @function scp_tts_pc_playbackaudiorate
/// @param rate
function scp_tts_pc_playbackaudiorate(argument0) {

	scp_tts_pc_checkcreate();

	with(instance_find(_TTS_PC,0)) {	
		switch(argument0) {
			case AUDIO_11k:
			case AUDIO_16k:
			case AUDIO_22k:
			case AUDIO_44k:
			case AUDIO_48k: {
				i_audio_rate = argument0;
				break;
			}
			default: {
				i_audio_rate = AUDIO_22k; 
				break;
			}
		}
	
		return i_audio_rate;
	}


}
