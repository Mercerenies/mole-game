
function voiceSound(snd_id) {
  if ((!is_undefined(ctrl_BackgroundMusic.voice)) && (audio_is_playing(ctrl_BackgroundMusic.voice))) {
    audio_stop_sound(ctrl_BackgroundMusic.voice);
  }
  ctrl_BackgroundMusic.voice = audio_play_sound(snd_id, 20, false);
}