
mainAudio = audio_play_sound(snd_BGM, 100, true);
applauseSound = undefined;
playingApplause = false;

playApplause = function() {
  if (playingApplause) {
    return;
  }
  playingApplause = true;
  applauseSound = audio_play_sound(snd_Applause, 90, false);
  audio_sound_gain(mainAudio, 0, 1000);
  audio_sound_gain(applauseSound, 0, 0);
  audio_sound_gain(applauseSound, 1, 1000);
  alarm[0] = 60 * 23.78; // Length of applauseSound
}